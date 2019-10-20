Login-AzAccount

# Nowa rola
New-AzureRmRoleDefinition -InputFile .\ZD_3_custome_role\custom_rbac.json
Get-AzureRmRoleDefinition | Where-Object Name -like "*CloudDB*"

# Modyfikacja istniejącej (ważne jest id w pliku json)
Set-AzureRmRoleDefinition -InputFile .\ZD_3_custome_role\custom_rbac.json