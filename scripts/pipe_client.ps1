$pipeName = 'mypipe123'
$pipeServer = New-Object System. IO. Pipes. NamedPipeServerStream($pipeName)
Write-Host "Waiting for connection on pipe: $pipeName ... "
$pipeServer.WaitForConnection()
Write-Host "Client connected!"
