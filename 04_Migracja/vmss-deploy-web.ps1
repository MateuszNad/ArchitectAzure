$Build = '0.0.2'

# add IIS
Add-WindowsFeature Web-Server

# create content
$Contnet = "<h1>VMSS Website</h1>
<p>$env:COMPUTERNAME</p>
<script language=`javaScript`>
function name(){
alert(nametop.location.host);
}
</script>
<p>$Build</p>
"
Set-Content -Value $Contnet -Path 'C:\inetpub\wwwroot\Default.htm'
