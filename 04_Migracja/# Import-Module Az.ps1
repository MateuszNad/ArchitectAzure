# create resource group
($ResourceGroup = New-AzResourceGroup 'webapp-rg2' -Location westeurope)

# create virtual machine scale set
$Credential = Get-Credential -UserName 'useradmin'
$paramVsmm = @{
    ResourceGroupName = $ResourceGroup.ResourceGroupName
    VMScaleSetName    = "webapp-vmss"
    UpgradePolicyMode = "Automatic"
    ImageName         = 'MicrosoftWindowsServer:WindowsServer:2019-datacenter-smalldisk-g2:latest'
    Credential        = $Credential
    LoadBalancerName  = "webappslb"
}
($VMScaleSet = New-AzVmss  @paramVsmm )

# add IIS
$Settings = @{
    "fileUris"         = (, "https://raw.githubusercontent.com/MateuszNad/ArchitectAzure/master/04_Migracja/vmss-deploy-web.ps1");
    "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File vmss-deploy-web.ps1"
}

$paramVmssExtension = @{
    VirtualMachineScaleSet = $VMScaleSet
    Name                   = "customScript"
    Publisher              = 'Microsoft.Compute'
    Type                   = 'CustomScriptExtension'
    TypeHandlerVersion     = "1.9"
    Setting                = $Settings
}
($VMScaleSetExtension = Add-AzVmssExtension @paramVmssExtension )
Update-AzVmss -ResourceGroupName $ResourceGroup.ResourceGroupName -VMScaleSetName $VMScaleSet.Name -VirtualMachineScaleSet $VMScaleSet

# create a rule - allow port 80
$paramNetworkSecurityRuleConfig = @{
    Name                     = 'vmssnsgrule'
    Protocol                 = 'Tcp'
    Direction                = 'Inbound'
    Priority                 = 200
    SourceAddressPrefix      = '*'
    SourcePortRange          = '*'
    DestinationAddressPrefix = '*'
    DestinationPortRange     = 80
    Access                   = 'Allow'
}
($nsgFrontendRule = New-AzNetworkSecurityRuleConfig @paramNetworkSecurityRuleConfig)

# create nsg and assign rule
$paramNetworkSecurityGroup = @{
    ResourceGroupName = $ResourceGroup.ResourceGroupName
    Name              = 'vmmnsg'
    Location          = $ResourceGroup.Location
    SecurityRules     = $nsgFrontendRule
}
($NsgFrontend = New-AzNetworkSecurityGroup @paramNetworkSecurityGroup)

$vnet = Get-AzVirtualNetwork -ResourceGroupName  $ResourceGroup.ResourceGroupName -Name 'webapp-vmss'
$frontendSubnet = $vnet.Subnets[0]

$paramVirtualNetworkSubnetConfig = @{
    VirtualNetwork       = $vnet
    Name                 = $frontendSubnet.Name
    AddressPrefix        = $frontendSubnet.AddressPrefix
    NetworkSecurityGroup = $nsgFrontend
}
($frontendSubnetConfig = Set-AzVirtualNetworkSubnetConfig @paramVirtualNetworkSubnetConfig)
Set-AzVirtualNetwork -VirtualNetwork $vnet

Start-Process "http://$((Get-AzPublicIpAddress -ResourceGroupName $ResourceGroup.ResourceGroupName).IpAddress)"







$UpdateSettings = @{
    "fileUris"         = (, "https://raw.githubusercontent.com/MateuszNad/ArchitectAzure/master/04_Migracja/vmss-deploy-web.ps1");
    "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File vmss-deploy-web.ps1 -Build ''0.0.2"
}

$VmScaleSet = Get-AzVmss -ResourceGroupName 'webapp-rg2' -VMScaleSetName 'webapp-vmss'
$VMScaleSet.VirtualMachineProfile.ExtensionProfile.Extensions[0].Settings = $UpdateSettings

Update-AzVmss -ResourceGroupName 'webapp-rg2' -VirtualMachineScaleSet $VMScaleSet -VMScaleSetName 'webapp-vmss'
