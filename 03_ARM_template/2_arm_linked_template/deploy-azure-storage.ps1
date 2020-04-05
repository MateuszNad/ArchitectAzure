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

# Create a storage account
$storageAccountParam = @{
    ResourceGroupName = $NewRG.ResourceGroupName
    Name              = 'armtstorage'
    Location          = $NewRG.Location
    SkuName           = "Standard_LRS"
}
($storageAccount = New-AzStorageAccount @storageAccountParam)

# Create a container
$containerName = 'armtemplates'
$storageAccount | New-AzRmStorageContainer -Name $containerName

# Upload the linked template
$StorageContentParam = @{
    Container = $containerName
    File      = '.\03_ARM_template\2_arm_linked_template\linked-vm-template.json'
    Blob      = 'linked-vm-template.json'
    Context   = $storageAccount.Context
}
Set-AzStorageBlobContent @StorageContentParam

# Generate a SAS token
$BlobSasTokenParam = @{
    Context    = $storageAccount.Context
    Container  = $containerName
    Blob       = (Split-Path $StorageContentParam.File -Leaf)
    Permission = 'r'
    ExpiryTime = (Get-Date).AddHours(1.0)
    FullUri    = $true
}
($templateURI = New-AzStorageBlobSASToken @BlobSasTokenParam)

# Clip - podmienić w main-vm-template.json -> templateLink -> uri
$templateURI | Clip

$paramDeployment = @{
    ResourceGroupName     = $NewRG.ResourceGroupName
    TemplateFile          = '.\03_ARM_template\2_arm_linked_template\main-vm-template.json'
    TemplateParameterFile = '.\03_ARM_template\2_arm_linked_template\main-vm-template.parameters.json'
    Name                  = 'tydzien3.2-az-storage'
}
New-AzResourceGroupDeployment @paramDeployment -WhatIf:$false

# Clean all
# Remove-AzResourceGroup -Name $NewRG.ResourceGroupName -Force
