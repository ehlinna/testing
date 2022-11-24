$HostFile = 'C:\Windows\System32\drivers\etc\hosts'
$File = Get-Content $HostFile

foreach ($HostFileEntry in $Hosts)
{    
    if ($File -contains "127.0.0.1") {
        Write-Host "Host File Entry already exist"
    }
    else{
        Write-host "Adding Host File Entry for $HostFileEntry"
        Add-HostsEntry -Hostname "test.local" -Address "127.0.0.1"
    }
}