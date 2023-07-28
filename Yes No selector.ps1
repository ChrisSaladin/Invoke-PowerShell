# simple yes / no selector to add to scripts. 
# OP of this was found here: https://stackoverflow.com/questions/65454348/how-can-i-allow-only-y-n-to-be-input-in-read-host-without-having-to-press-enter

# Yes or No checker

Write-output "Continue? Y/N"

:prompt while ($true) {
    switch ([console]::ReadKey($true).Key) {
        { $_ -eq [System.ConsoleKey]::Y } { break prompt }
        { $_ -eq [System.ConsoleKey]::N } { return }
        default { Write-Error "Only 'Y' or 'N' allowed!" }
    }
}
write-host 'Yes' -ForegroundColor Green
