function ConvertTo-CleanName {
    param([string]$Name)

    $Name.Trim().Normalize('FormD') -replace '\p{Mn}', '' -replace '[^a-zA-Z]', ''
}

function Get-EmailAddress {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$FirstName,

        [Parameter(Mandatory)]
        [string]$LastName,

        [string]$Domain = 'contoso.com'
    )

    $cleanFirst = ConvertTo-CleanName $FirstName
    $cleanLast  = ConvertTo-CleanName $LastName

    if (-not $cleanFirst -or -not $cleanLast) {
        throw "First and last name must each contain at least one letter."
    }

    "$($cleanFirst.Substring(0, 1))$cleanLast@$Domain".ToLower()
}