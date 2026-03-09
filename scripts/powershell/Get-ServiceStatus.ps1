Param(
  [string]$ServiceName = "sample-app"
)

$status = (Get-Service -Name $ServiceName -ErrorAction SilentlyContinue)
if (!$status) {
  Write-Output "Service $ServiceName not found"
  exit 1
}
Write-Output ("{0} - {1}" -f $status.Name, $status.Status)
