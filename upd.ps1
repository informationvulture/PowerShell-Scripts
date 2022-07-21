# Update script

Write-Host "Pip version: " -ForegroundColor Blue -NoNewline
pip --version

Write-Output " "
Write-Host "Git version: " -ForegroundColor Green -NoNewline
git --version

Write-Output " "

git update-git-for-windows
py -m pip install --upgrade pip

Write-Output " "

$LastUpdate = Get-Content C:\scriptfiles\lstupd.txt

Write-Host "The last update was done on:" -NoNewline
if ((Get-Date -format "yyyy-MM-dd") -eq $LastUpdate)
{
    Write-Host " $LastUpdate" -ForegroundColor DarkGreen
    Write-Output " "
    Write-Host "No update is needed." -ForegroundColor Magenta
}
else
{
    Write-Host " $LastUpdate" -ForegroundColor DarkRed
    Write-Output " "
    
    $ans = Read-Host "Do you want to update the date? (y/n)"
    if ($ans -eq "y")
    {
        Write-Host "Updating date..." -ForegroundColor DarkYellow
        $new_date = (Get-Date -format "yyyy-MM-dd")
        Set-Content C:\scriptfiles\lstupd.txt $new_date
        Write-Host "UPDATED ON" -NoNewline
        Write-Host " $new_date" -ForegroundColor DarkGreen
    }
    else
    {
        Write-Host "Not updating date." -ForegroundColor DarkYellow
    }
}


