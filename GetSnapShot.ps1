# This script runs in powershell5, but works better in powershell7
# https://raw.githubusercontent.com/ChrisSaladin/Invoke-PowerShell/main/GetSnapShot.ps1


# select the folder you want to create the snapshot of
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$FolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog
$FolderDialog.InitialDirectory = "C:\"
$FolderDialog.ShowDialog() | Out-Null

$mainfolder = $FolderDialog.SelectedPath

# file to write the snapshot to

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$SaveFileDialog.initialDirectory = "C:\"
$SaveFileDialog.Title = ""
$SaveFileDialog.FileName = "$name"
$SaveFileDialog.Filter = "PowerShell ScriptFile | .ps1"
$SaveFileDialog.ShowDialog() | out-null
$saveas = $SaveFileDialog.Filename

$recurse = Get-ChildItem $mainfolder -Recurse

$folders = foreach($item in $recurse)
{
    $path = $item | select-object Directory
    $path | out-string
}

$selected = foreach($item in $folders){
    $name = $item.split("---------")[-1].trim()
    if($name.contains(':')){
        $name
    }
}

$selected = $selected + $mainfolder

$Directories = New-Object System.Collections.Generic.List[System.Object]

for($i = 0; $i -lt $selected.count; $i++){
    $folder = $selected[$i]
    $j = $i+1
    if($selected[$j] -ne $folder){
    $Directories.Add($folder)
    }
}

# Every individual folder in the selected folder is now stored in the Variable $Directories

# get every unique file from the array

$files = $recurse | select FullName
$files = $files.FullName

# write code that can check if all the folders exist when run
# write output to the $saveas file

$null | out-file $saveas

foreach($Directory in $Directories)
{
    "#" | out-file $saveas -NoNewline -Append
    $Directory | Out-File $saveas -Append
    '' | out-file $saveas -Append
    '$folder = "' | out-file $saveas -NoNewline -Append
    $Directory | Out-File $saveas -NoNewline -Append
    '"' | out-file $saveas -Append
    'if(!(Test-Path $folder))
    {
        mkdir $folder | out-null
        write-output "Created $folder"
    }' | out-file $saveas -Append
    '' | out-file $saveas -Append
    '' | out-file $saveas -Append
}

# now write the code on a per-file basis

foreach($file in $files)
{
    # for every file
    if(Test-path $file -PathType Container)
    {
        # skip the file - it's a folder not a file
    }else
    {
    # if it's not a folder
    #get the base64 version of it's contents
    $base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($file))
    $hash = (Get-FileHash $file).Hash

    # write the code to the saveas file

    # header
    "#" | out-file $saveas -NoNewline -Append
    $file | out-file $saveas -NoNewline -Append
    '' | out-file $saveas -Append
    # define the file
    '$file = "' | out-file $saveas -NoNewline -Append
    $file | out-file $saveas -NoNewline -Append
    '"' | out-file $saveas -Append

    # define the encoded string
    '$encoded = ' | out-file $saveas -NoNewLine -Append
    "'" | out-file $saveas -NoNewLine -Append
    $base64 | out-file $saveas -NoNewLine -Append
    "'" | out-file $saveas -NoNewLine -Append
    '' | out-file $saveas -Append
    '$hash = "' | out-file $saveas -NoNewLine -Append
    $hash | out-file $saveas -NoNewLine -Append
    '"' | out-file $saveas -Append
    '' | out-file $saveas -Append
    '' | out-file $saveas -Append

    #write the logic to the saveas file
    'if(!(Test-Path $file))
    {
        # file path does not exist - create it
        $null | out-file $file | Out-Null
        Write-output "$file was missing."
    }
    
    if((Get-FileHash $file).hash -ne $hash)
    {
        # if the hashes do not match
        [IO.File]::WriteAllBytes($file, [Convert]::FromBase64String($encoded))
        write-output "Fixed errors in $file"
    }' | out-file $saveas -Append
    '' | out-file $saveas -Append
    }

}
