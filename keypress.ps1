# detects when any keyboard key is being pressed
# runs in powershell5 and 7 just fine
# run this command anywhere
# pwsh.exe -command "Invoke-expression (invoke-webrequest https://raw.githubusercontent.com/ChrisSaladin/Invoke-PowerShell/main/keypress.ps1 -usebasicparsing).content"
# powershell.exe -command "Invoke-expression (invoke-webrequest https://raw.githubusercontent.com/ChrisSaladin/Invoke-PowerShell/main/keypress.ps1 -usebasicparsing).content"

$key  = [Byte][Char]'A'
$key2  = [Byte][Char]'B'
$key3  = [Byte][Char]'C'
$key4  = [Byte][Char]'D'
$key5  = [Byte][Char]'E'
$key6  = [Byte][Char]'F'
$key7  = [Byte][Char]'G'
$key8  = [Byte][Char]'H'
$key9  = [Byte][Char]'I'
$key10  = [Byte][Char]'J'
$key11  = [Byte][Char]'K'
$key12  = [Byte][Char]'L'
$key13  = [Byte][Char]'M'
$key14  = [Byte][Char]'N'
$key15  = [Byte][Char]'O'
$key16  = [Byte][Char]'P'
$key17  = [Byte][Char]'Q'
$key18  = [Byte][Char]'R'
$key19  = [Byte][Char]'S'
$key20  = [Byte][Char]'T'
$key21  = [Byte][Char]'U'
$key22  = [Byte][Char]'V'
$key23  = [Byte][Char]'W'
$key24  = [Byte][Char]'X'
$key25  = [Byte][Char]'Y'
$key26  = [Byte][Char]'Z'
$key27 = '0x11' ## Ctrl
$key28 = '0x12' ## Alt 
$key29 = '0x2E' ## Del
$key30 = '0x01' ## LeftMouse
$key31 = '0x08' ## Backspace
$key32 = '0x0D' ## ENTER
$key33 = '0x03' ## Control-break processing
$key34 = '0x09' ## Tab
$key35 = '0x10' ## Shift
$key36 = '0x13' ## Pause
$key37 = '0x1B' ## ESC
$key38 = '0x23' ## END
$key39 = '0x30'
$key40 = '0x31'
$key41 = '0x32'
$key42 = '0x33'
$key43 = '0x34'
$key44 = '0x35'
$key45 = '0x36'
$key46 = '0x37'
$key47 = '0x38'
$key48 = '0x39'
$key49 = '0x5B'
$key50 = '0x5C'
$key51 = '0x5F'
$key52 = '0x60'
$key53 = '0x61'
$key54 = '0x62'
$key55 = '0x63'
$key56 = '0x64'
$key57 = '0x65'
$key58 = '0x66'
$key59 = '0x67'
$key60 = '0x68'
$key61 = '0x69'
$key62 = '0x6B'
$key63 = '0x6D'
$key64 = '0x6E'
$key65 = '0x70'
$key66 = '0x71'
$key67 = '0x72'
$key68 = '0x73'
$key69 = '0x74'
$key70 = '0x75'
$key71 = '0x76'
$key72 = '0x77'
$key73 = '0x78'
$key74 = '0x79'
$key75 = '0x7A'
$key76 = '0x7B'
$key77 = '0x7C'
$key78 = '0x7D'
$key79 = '0x7F'
$key80 = '0x80'
$key81 = '0x81'
$key82 = '0x82'
$key83 = '0x83'
$key84 = '0x84'
$key85 = '0x85'
$key86 = '0x86'
$key87 = '0x87'
$key88 = '0x90'
$key89 = '0xA6'
$key90 = '0xA7'
$key91 = '0xA8'
$key92 = '0xA9'

$Signature = @'
    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
    public static extern short GetAsyncKeyState(int virtualKeyCode); 
'@
Add-Type -MemberDefinition $Signature -Name Keyboard -Namespace PsOneApi
do
{   If( [bool]([PsOneApi.Keyboard]::GetAsyncKeyState($key) -eq -32767 -or 
[PsOneApi.Keyboard]::GetAsyncKeyState($key2) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key0) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key3) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key4) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key5) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key6) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key7) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key8) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key9) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key10) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key11) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key12) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key13) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key14) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key15) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key16) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key17) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key18) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key19) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key20) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key21) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key22) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key23) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key24) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key25) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key26) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key27) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key29) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key30) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key30) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key31) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key32) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key33) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key34) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key35) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key36) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key37) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key38) -eq -32767 -or
[PsOneApi.Keyboard]::GetAsyncKeyState($key28) -eq -32767))
        { 
write-output "key press detected"
        }
    
      Start-Sleep -Milliseconds 50

} while($true)
