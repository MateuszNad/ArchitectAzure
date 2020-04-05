# Create new role
New-AzRoleDefinition -InputFile '.\3_custome_role\custom_rbac.json'
Get-AzRoleDefinition | Where-Object Name -like "*CloudDB*"

# Change existing (important is id)
Set-AzRoleDefinition -InputFile '.\3_custome_role\custom_rbac.json'
