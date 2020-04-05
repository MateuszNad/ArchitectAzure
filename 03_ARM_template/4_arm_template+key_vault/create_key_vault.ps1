Login-AzAccount
# Create new resource group
$ResourceGroupParam = @{
    Name     = 'rg-keyvault'
    Location = 'westeurope'
    Tag      = @{
        System = 'it'
        Env    = 'prod'
        wb     = 'mateusznadobnik'
    }
}
New-AzResourceGroup @ResourceGroupParam

# Create Azure KeyVault
$KeyVaultParam = @{
    VaultName                    = 'itpkeyvault'
    resourceGroupName            = $ResourceGroupParam.Name
    Location                     = $ResourceGroupParam.Location
    EnabledForTemplateDeployment = $true
}
New-AzKeyVault @KeyVaultParam

# Add new secret
$secretvalue = Read-Host -AsSecureString -Prompt 'Password'
$secret = Set-AzKeyVaultSecret -VaultName $KeyVaultParam.VaultName -Name 'adminUsername' -SecretValue $secretvalue
$secret
