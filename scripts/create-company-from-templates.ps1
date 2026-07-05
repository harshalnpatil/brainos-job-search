param(
  [string]$OutputRoot = (Join-Path (Split-Path $PSScriptRoot -Parent) 'companies'),
  [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
  [string[]]$CompanyNameParts
)

$OutputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$CompanyName = ($CompanyNameParts -join ' ').Trim()
if ([string]::IsNullOrWhiteSpace($CompanyName)) {
  throw "Company name is required."
}

# Slugify: lower-case, spaces -> underscores, other non [a-z0-9_] -> underscores.
$CompanySlug = $CompanyName.ToLower()
$CompanySlug = ($CompanySlug -replace '\s+', '_')
$CompanySlug = ($CompanySlug -replace '[^a-z0-9_]+', '_')
$CompanySlug = ($CompanySlug -replace '_+', '_')
$CompanySlug = ($CompanySlug -replace '^_+|_+$', '')
if ([string]::IsNullOrWhiteSpace($CompanySlug)) {
  throw "Company name slug resolved to empty (input was: '$CompanyName')."
}

$DatePart = (Get-Date).ToString('yyyy_MM_dd')

$RepoRoot = Split-Path $PSScriptRoot -Parent
$TemplatesRoot = Join-Path $RepoRoot 'templates'
$DestinationRoot = Join-Path $OutputRoot "${DatePart}_${CompanySlug}"

if (-not (Test-Path -LiteralPath $TemplatesRoot)) {
  throw "Templates folder not found: $TemplatesRoot"
}

if (Test-Path -LiteralPath $DestinationRoot) {
  throw "Destination already exists: $DestinationRoot"
}

New-Item -ItemType Directory -Path $DestinationRoot -Force | Out-Null

# Copy templates into the new company folder (markdown scaffolds only).
$Items = Get-ChildItem -LiteralPath $TemplatesRoot -Force -File
foreach ($item in $Items) {
  if ($item.Extension -ine '.md') { continue }
  $destPath = Join-Path $DestinationRoot $item.Name
  Copy-Item -LiteralPath $item.FullName -Destination $destPath -Force
}

# Rename placeholder files from CompanyName_* -> <slug>_*
$PlaceholderPrefix = 'CompanyName_'
$Descendants = Get-ChildItem -LiteralPath $DestinationRoot -Recurse -Force |
  Sort-Object FullName -Descending

foreach ($d in $Descendants) {
  if (-not ($d.Name -like "${PlaceholderPrefix}*")) { continue }

  $NewName = ($d.Name -replace '^CompanyName_', "${CompanySlug}_")
  Rename-Item -LiteralPath $d.FullName -NewName $NewName -Force
}

Write-Host "Created: $DestinationRoot"
