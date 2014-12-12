$platformPackageName = 'resharper-platform'
$platformPackageVersion = '1.0'
$packageName = 'TeamCityAddin'

try {

  $scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))

  $installPath = Join-Path  (Join-Path $commonPath $platformPackageName'.'$platformPackageVersion) 'ReSharperAndToolsPacked01.exe'

  Start-ChocolateyProcessAsAdmin '/SpecificProductNames=TeamCityAddin /Silent=True' $installPath

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}