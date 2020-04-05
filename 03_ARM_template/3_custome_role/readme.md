# Custom RBAC

[Get-AzProviderOperation](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azprovideroperation) - przydatne polecenie do sprawdzania operacji dla wskazanego providera.

```ps
Get-AzProviderOperation Microsoft.Compute/virtualMachines/* | Select Operation, Description

<#
Operation                                                        Description
---------                                                        -----------
Microsoft.Compute/virtualMachines/read                           Get the properties of a virtual machine
Microsoft.Compute/virtualMachines/write                          Creates a new virtual machine or updates an existin...
Microsoft.Compute/virtualMachines/delete                         Deletes the virtual machine
Microsoft.Compute/virtualMachines/start/action                   Starts the virtual machine
Microsoft.Compute/virtualMachines/powerOff/action                Powers off the virtual machine. Note that the virtu...
Microsoft.Compute/virtualMachines/redeploy/action                Redeploys virtual machine
Microsoft.Compute/virtualMachines/restart/action                 Restarts the virtual

#>
```
