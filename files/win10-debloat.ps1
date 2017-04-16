Get-AppxPackage -AllUsers | where {$_.name -notlike "*calc*" -AND
    $_.name -notlike "*store*" -AND $_.name -notlike "*onenote*" -AND
    $_.name -notlike "*NET.*" -AND $_.name -notlike "*VCLibs*" -AND
    $_.name -notlike "*Host*" -AND $_.name -notlike "*AccountsControl*"} | Remove-AppxPackage
