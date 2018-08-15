

#set static IP address and DNS servers
$ipaddress = "10.0.1.117" 
$ipprefix = "24" 
$ipgw = "10.0.1.1" 
$ipdns = "10.0.1.117"
$ipdns2 = "8.8.8.8" 
$ipif = (Get-NetAdapter).ifIndex 

New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix ` 
-InterfaceIndex $ipif -DefaultGateway $ipgw 
Set-DnsClientServerAddress -InterfaceIndex $ipif -ServerAddresses ($ipdns, $ipdns2)


#rename the computer 
$newname = "DC1" 
Rename-Computer -NewName $newname -force 

#install features 
$featureLogPath = "c:\poshlog\featurelog.txt" 
New-Item $featureLogPath -ItemType file -Force 
$addsTools = "RSAT-AD-Tools" 
Add-WindowsFeature $addsTools 
Get-WindowsFeature | Where installed >>$featureLogPath 
#restart the computer 
Restart-Computer