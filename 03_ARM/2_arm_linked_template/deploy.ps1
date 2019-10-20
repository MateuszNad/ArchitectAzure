# linked template z musi zostać umieszczone w "sieci" aby main template miał do niego dostęp.
# opcją jest github lub azure storage

$projectNamePrefix = "clouddb"
$location = 'westeurope'
$TemplateFilePath = "C:\Users\Lenovo\Documents\Projekty\02_CloudAzure\ArchitectAzure\03_ARM\2_arm_linked_template\2_linked_template_arm.json"

$resourceGroupName = $projectNamePrefix + "rg"
$storageAccountName = $projectNamePrefix + "store00"
$containerName = "linkedtemplates" # The name of the Blob container to be created.

# Create a resource group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
$storageAccount = New-AzureRmStorageAccount `
    -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS"

$context = $storageAccount.Context

# Create a container
$storageAccount | New-AzureRmStorageContainer -Name $containerName

# Upload the linked template
Set-AzureStorageBlobContent `
    -Container $containerName `
    -File $TemplateFilePath `
    -Blob $fileName `
    -Context $context

# Generate a SAS token
$templateURI = New-AzureStorageBlobSASToken `
    -Context $context `
    -Container $containerName `
    -Blob (Split-Path $TemplateFilePath -Leaf) `
    -Permission r `
    -ExpiryTime (Get-Date).AddHours(24.0) `
    -FullUri

# Clip - wkelić do 2_arm.json do templateLink -> uri
$templateURI | Clip

$paramDeployment = @{
    ResourceGroupName = $resourceGroupName
    TemplateFile      = 'C:\Users\Lenovo\Documents\Projekty\02_CloudAzure\ArchitectAzure\03_ARM\2_arm_linked_template\2_arm.json'
}
New-AzureRmResourceGroupDeployment  @paramDeployment -WhatIf:$false

# Clean all
Remove-AzureRmResourceGroup -Name $resourceGroupName -Force
