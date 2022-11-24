<#
$HostFile = 'C:\Windows\System32\drivers\etc\hosts'
$File = Get-Content $HostFile
$valg=Read-Host "Hvilke av valgene ønsker du å gjøre? 1)Legge til en Host entry 2)Fjerne host entry 3)Endre en host entry "
if ($valg -eq '1'){
    $ip=Read-host "IP for nye host entry: "
    $DNS=Read-host "DNS for nye host entry: "
        if ($File -contains $ip -or $File -contains $DNS) {
            Write-Host "Host File Entry for already exists."
        }
        else{
            Write-host "Adding Host File Entry"
            Add-Content -Path $HostFile -Value "$ip $dns"
        }
    }
if ($valg -eq '2'){
    write-host $File
    $remove_entry=Read-host "Hvilke IP/DSN vil du fjerne (eks. 127.0.0.1 test.local): "

}
#>

function new_hostEntry{
    $HostFile = 'C:\Windows\System32\drivers\etc\hosts'
    $File = Get-Content $HostFile
    $ip=Read-host "IP for nye host entry: "
    $DNS=Read-host "DNS for nye host entry: "
        if ($File -contains $ip -or $File -contains $DNS) {
            Write-Host "Host File Entry for already exists."
        }
        else{
            Write-host "Adding Host File Entry"
            Add-Content -Path $HostFile -Value "$ip $dns"
        }
    }
new_hostEntry

function delete_Entry{
    $HostFile = 'C:\Windows\System32\drivers\etc\hosts'
    $File = Get-Content $HostFile
    $delete=Read-host "IP/DNS wanted deleted(eks. 10.10.10.10 test.local): "
    Clear-Content -Path $HostFile -Filter "$delete"  
    Write-Host "deleting host entry.."
    }
delete_Entry

function edit_Entry{
    $HostFile = 'C:\Windows\System32\drivers\etc\hosts'
    $change_From=Read-host "IP/DNS wanted changed from(eks. 10.10.10.10 test.local): "
    $change_To=Read-host "IP/DNS wanted changed to(eks. 10.10.10.10 test.local): "
    Set-Content -Path $HostFile -Filter "$change_From" -Value $change_To  
    Write-Host "Changing host entry.."
}
edit_Entry
