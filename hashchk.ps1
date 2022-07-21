# Documentation: This script takes a file name, calcultes the SHA256 hash of the file, 
# and then compares it to the hash passed to the script. If the hashes match, the
# file is assumed to be authentic.


# Get the file hashes
$hashDest = Read-Host "Enter the hash of the source file: ";
$fileSrc = $args;
$hashSrc = Get-FileHash $fileSrc -Algorithm SHA256 | ForEach-Object{$_.Hash};

# Compare the hashes
If ($hashSrc -ne $hashDest)
{
    Write-Output ""
    Write-Output "Hashes do not match"
    Write-Output ""
    Write-Output $hashSrc
    Write-Output $hashDest
}

else {
    Write-Output ""
    Write-Output "Hashes match"
    Write-Output ""
    Write-Output $hashSrc
    Write-Output $hashDest
}