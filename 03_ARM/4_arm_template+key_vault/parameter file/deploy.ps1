$resourceGroupName = ''
New-AzResourceGroup -Name $resourceGroupName -Location $location

$param = @{
    ResourceGroupName     = $resourceGroupName
    TemplateFile          = 'C:\Users\Lenovo\Documents\Projekty\02_CloudAzure\ArchitectAzure\03_ARM\2_arm_linked_template\2_arm.json'
    TemplateParameterFile = 'C:\Users\Lenovo\Documents\Projekty\02_CloudAzure\ArchitectAzure\03_ARM\4_arm_template+key_vault\parameter file\parameters.json'
}
New-AzureRmResourceGroupDeployment @param
