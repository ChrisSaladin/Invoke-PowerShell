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