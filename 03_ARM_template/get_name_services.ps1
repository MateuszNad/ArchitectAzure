$Services = Invoke-WebRequest -Uri https://azure.microsoft.com/en-in/services/
$NameOfServices = ($Services.Links | Where-Object { $_.href -like '*en-in/services/*' -and $null -ne $_.title -and $_.title -notmatch 'See more|See all products' }) | Select href, title

$NameOfServices.Title | Foreach {
    $_
    $_ -split ' ' | Foreach {
        ($_).Substring(0,2)
    }
}

