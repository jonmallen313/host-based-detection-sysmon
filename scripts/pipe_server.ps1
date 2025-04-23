Start-Sleep -Seconds 2 #wait a bit so server starts first
$pipeName = 'mypipe123'
$pipeClient = New-object System. IO. Pipes. NamedPipeClientStream('.', $pipeName,
[System. IO. Pipes. PipeDirection] : : Out)
