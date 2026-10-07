# GPU Tweak III — Tradução PT-BR
param([ValidateSet('Menu','Install','Restore')][string]$Action = 'Menu')
$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$translation = Join-Path $scriptDir 'aseng.xml'
$defaultDir = 'C:\Program Files (x86)\ASUS\GPUTweakIII'

function Show-Header {
    Clear-Host
    Write-Host '============================================================' -ForegroundColor Cyan
    Write-Host '          GPU TWEAK III — TRADUÇÃO PT-BR' -ForegroundColor Cyan
    Write-Host '============================================================' -ForegroundColor Cyan
    Write-Host ("Sessão iniciada: {0}" -f (Get-Date -Format 'dd/MM/yyyy  HH:mm:ss')) -ForegroundColor Gray
    Write-Host ''
}
function Get-GameDirectory {
    if ((Test-Path -LiteralPath (Join-Path $defaultDir 'aseng.xml')) -or (Test-Path -LiteralPath (Join-Path $defaultDir '_aseng.xml'))) { return $defaultDir }
    Add-Type -AssemblyName System.Windows.Forms
    $picker = New-Object System.Windows.Forms.FolderBrowserDialog
    $picker.Description = 'Selecione a pasta do GPU Tweak III (onde está o aseng.xml)'
    if ($picker.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) { return $null }
    if (-not (Test-Path -LiteralPath (Join-Path $picker.SelectedPath 'aseng.xml')) -and -not (Test-Path -LiteralPath (Join-Path $picker.SelectedPath '_aseng.xml'))) {
        throw "Não encontrei aseng.xml nem _aseng.xml na pasta selecionada: $($picker.SelectedPath)"
    }
    return $picker.SelectedPath
}
function Test-Admin {
    $principal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}
function Apply-Translation {
    if (-not (Test-Path -LiteralPath $translation)) { throw "Arquivo de tradução ausente ao lado do script: $translation" }
    $gameDir = Get-GameDirectory
    if (-not $gameDir) { return }
    $target = Join-Path $gameDir 'aseng.xml'
    $original = Join-Path $gameDir '_aseng.xml'
    $currentFile = [IO.File]::ReadAllText($target)
    $isEnglishFile = $currentFile.Contains('En="Live Update connection failed.')
    if (-not (Test-Path -LiteralPath $original) -or $isEnglishFile) {
        Copy-Item -LiteralPath $target -Destination $original -Force
        Write-Host "Backup do inglês salvo/atualizado: $original" -ForegroundColor Yellow
    } else {
        Write-Host "Backup inglês existente preservado: $original" -ForegroundColor Yellow
    }
    $temp = Join-Path $gameDir 'aseng.xml.ptbr.tmp'
    Copy-Item -LiteralPath $translation -Destination $temp -Force
    Move-Item -LiteralPath $temp -Destination $target -Force
    Write-Host 'Tradução aplicada com sucesso.' -ForegroundColor Green
}
function Restore-English {
    $gameDir = Get-GameDirectory
    if (-not $gameDir) { return }
    $original = Join-Path $gameDir '_aseng.xml'
    if (-not (Test-Path -LiteralPath $original)) {
        Write-Host "Backup não encontrado: $original" -ForegroundColor Red
        Write-Host 'Aplique a tradução primeiro para criar o backup do arquivo inglês.' -ForegroundColor Yellow
        return
    }
    Copy-Item -LiteralPath $original -Destination (Join-Path $gameDir 'aseng.xml') -Force
    Write-Host 'Arquivo inglês original restaurado com sucesso.' -ForegroundColor Green
}

if (-not (Test-Admin)) {
    Start-Process -FilePath 'powershell.exe' -Verb RunAs -Wait -ArgumentList @('-NoProfile','-ExecutionPolicy','Bypass','-File',('"' + $MyInvocation.MyCommand.Path + '"'),'-Action',$Action)
    exit
}
if ($Action -eq 'Install') { Apply-Translation; exit }
if ($Action -eq 'Restore') { Restore-English; exit }
do {
    Show-Header
    Write-Host '1. Instalar tradução PT-BR' -ForegroundColor Green
    Write-Host '2. Restaurar inglês do backup (_aseng.xml)' -ForegroundColor Yellow
    Write-Host '0. Sair'
    Write-Host ''
    $choice = Read-Host 'Escolha uma opção'
    try {
        switch ($choice) {
            '1' { Apply-Translation }
            '2' { Restore-English }
            '0' { break }
            default { Write-Host 'Opção inválida.' -ForegroundColor Red }
        }
    } catch {
        Write-Host ("Erro: {0}" -f $_.Exception.Message) -ForegroundColor Red
    }
    if ($choice -ne '0') { [void](Read-Host 'Pressione Enter para voltar ao menu') }
} while ($choice -ne '0')
