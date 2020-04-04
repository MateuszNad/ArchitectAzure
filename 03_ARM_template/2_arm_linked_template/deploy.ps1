# Import-Module Az
# Login-AzAccount

# Get-AzLocation | Where-Object Location -Like *europe*

# creating new resource group
$ResourceGroupParam = @{
    Name     = 'rg-bpm-s'
    Location = 'westeurope'
    Tag      = @{
        System = 'bpm'
        Env    = 'support'
        wb     = 'mateusznadobnik'
    }
}
($NewRG = New-AzResourceGroup @ResourceGroupParam)

$DeployParam = @{
    Name              = 'tydzien3.2'
    ResourceGroupName = $NewRG.ResourceGroupName
    #  TemplateParameterFile = '.\03_ARM_template\2_arm_linked_template\parameter.json'
    TemplateFile      = '.\03_ARM_template\2_arm_linked_template\main_template.json'
}
New-AzResourceGroupDeployment @DeployParam -Debug -WhatIf:$false
