function Get-EmailAddress {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$FirstName,

        [Parameter(Mandatory)]
        [string]$LastName,

        [string]$Domain = 'contoso.com'
    )

    $initial = $FirstName.Trim().Substring(0, 1)
    $last    = $LastName.Trim()

    "$initial$last@$Domain".ToLower()
}