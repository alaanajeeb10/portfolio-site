$ErrorActionPreference = "Stop"

$indexPath = "src/index.html"
if (!(Test-Path $indexPath)) {
  throw "Missing file: $indexPath"
}

$content = Get-Content $indexPath -Raw

if ($content -notmatch "<!doctype html>" -and $content -notmatch "<!DOCTYPE html>") {
  throw "index.html does not look like an HTML document"
}

if ($content -match "׳") {
  throw "Detected encoding garbage (׳). Save index.html as UTF-8."
}

Write-Host "OK: basic checks passed"