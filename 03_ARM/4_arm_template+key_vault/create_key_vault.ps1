Login-AzAccount

$Location = 'westeurope'
$ResourceGroupName = 'KeyVaultResource'
$KeyVaultName = 'CloudDBVault'

New-AzureRmResourceGroup -Name $resourceGroupName -Location $location
New-AzureRmKeyVault `
    -VaultName $keyVaultName `
    -resourceGroupName $resourceGroupName `
    -Location $location `
    -EnabledForTemplateDeployment

$secretvalue = Read-Host -AsSecureString -Prompt 'Password'
$secret = Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name 'CloudPassword' -SecretValue $secretvalue
$secret