# add IIS
Add-WindowsFeature Web-Server

# create content
$Build = '0.0.1'
$Contnet = "<h1>VMSS Website</h1>
<p>$env:COMPUTERNAME</p>
<script language=`javaScript`>
function name(){
alert(nametop.location.host);
}
</script>
<p>$Build</p>
"
Set-Content -Value $Contnet -Path 'C:\inetpub\wwwroot\index.htm'
