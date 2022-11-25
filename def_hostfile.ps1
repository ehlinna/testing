#region forsøk1
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
#endregion functions
<#
#region forsøk2
$HostFile = 'C:\Windows\System32\drivers\etc\hosts'
$File = Get-Content $HostFile

function new_hostEntry($HostFile, $File){
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

function delete_Entry {
    $delete=Read-host "IP/DNS wanted deleted(eks. 10.10.10.10 test.local): "
    Clear-Content -Path $HostFile -include "$delete"  
    Write-Host "deleting host entry.."
}

function edit_Entry ($HostFile, $File){
    $HostFile = 'C:\Windows\System32\drivers\etc\hosts'
    $change_From=Read-host "IP/DNS wanted changed from(eks. 10.10.10.10 test.local): "
    $change_To=Read-host "IP/DNS wanted changed to(eks. 10.10.10.10 test.local): "
    try{
        Set-Content -Path $HostFile -include "$change_From" -Value $change_To
    }
    catch{"Error"}  
    if(!error){
        Write-Host "Changing host entry.."
    }
}


# -- Main --
#for forsøk2
new_hostEntry
delete_Entry
edit_Entry
#endregion functions
#>

function print_Entry ($HostFile, $File){
    $regex = Read-host "Host entry "

    foreach($line in [System.IO.File]::ReadLines("C:\Windows\System32\drivers\etc\hosts")){
        Select-String -path "C:\Windows\System32\drivers\etc\hosts" -pattern $regex -SimpleMatch
    }
}


function add_Entry ($HostFile, $File){
    $ip = Read-host "IP of host entry "
    $DNS = Read-host "DNS of host entry "
    foreach($line in [System.IO.File]::ReadLines("C:\Windows\System32\drivers\etc\hosts")){
    if($line -contains $ip -or $line -contains $DNS){
        Write-Output "Already added"
        Stop-Process
    }
    else{
        try{
            Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "$ip + $DNS"
            Write-host "Adding Host File Entry"
        }catch{
            Write-host "Error"
        }
   }

}
}

# -- Main --
#for forsøk3
print_Entry
add_Entry
    
