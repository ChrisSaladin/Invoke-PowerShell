# simple yes / no selector to add to scripts. 
# OP of this was found here: https://stackoverflow.com/questions/65454348/how-can-i-allow-only-y-n-to-be-input-in-read-host-without-having-to-press-enter
# works in pwsh and powershell5
# powershell.exe -command "Invoke-expression (invoke-webrequest https://raw.githubusercontent.com/ChrisSaladin/Invoke-PowerShell/main/Yes%20No%20selector.ps1 -usebasicparsing).content"
# pwsh.exe -command "Invoke-expression (invoke-webrequest https://raw.githubusercontent.com/ChrisSaladin/Invoke-PowerShell/main/Yes%20No%20selector.ps1 -usebasicparsing).content"

# Yes or No checker

Write-output "Continue? Y/N"

:prompt while ($true) {
    switch ([console]::ReadKey($true).Key) {
        { $_ -eq [System.ConsoleKey]::Y } { break prompt }
        { $_ -eq [System.ConsoleKey]::N } { Exit }
        default { Write-Error "Only 'Y' or 'N' allowed!" }
    }
}
write-host 'Yes' -ForegroundColor Green
