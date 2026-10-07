# GPU Tweak III — Instalador da tradução PT-BR
param()

$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$translation = Join-Path $scriptDir 'aseng.xml'
$defaultDir = 'C:\Program Files (x86)\ASUS\GPUTweakIII'

$principal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptPath = $MyInvocation.MyCommand.Path.Replace('"','""')
    $arguments = '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -STA -File "' + $scriptPath + '"'
    Start-Process -FilePath 'powershell.exe' -Verb RunAs -WindowStyle Hidden -ArgumentList $arguments
    exit
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$script:gameDirectory = $null
$form = New-Object System.Windows.Forms.Form
$form.Text = 'GPU Tweak III — Tradução PT-BR'
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.MinimizeBox = $true
$form.ClientSize = New-Object System.Drawing.Size(660, 430)
$form.BackColor = [System.Drawing.Color]::FromArgb(245, 246, 249)
$form.ForeColor = [System.Drawing.Color]::FromArgb(35, 38, 48)
$form.Font = New-Object System.Drawing.Font('Segoe UI', 10)

$header = New-Object System.Windows.Forms.Panel
$header.Location = New-Object System.Drawing.Point(0, 0)
$header.Size = New-Object System.Drawing.Size(660, 124)
$header.BackColor = [System.Drawing.Color]::FromArgb(28, 24, 34)
$form.Controls.Add($header)

$accent = New-Object System.Windows.Forms.Panel
$accent.Location = New-Object System.Drawing.Point(0, 0)
$accent.Size = New-Object System.Drawing.Size(7, 124)
$accent.BackColor = [System.Drawing.Color]::FromArgb(229, 0, 70)
$header.Controls.Add($accent)

$title = New-Object System.Windows.Forms.Label
$title.Text = 'GPU TWEAK III'
$title.Location = New-Object System.Drawing.Point(30, 20)
$title.AutoSize = $true
$title.Font = New-Object System.Drawing.Font('Segoe UI Semibold', 19, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::White
$header.Controls.Add($title)

$subtitle = New-Object System.Windows.Forms.Label
$subtitle.Text = 'Instalador da tradução • Português do Brasil'
$subtitle.Location = New-Object System.Drawing.Point(33, 60)
$subtitle.AutoSize = $true
$subtitle.Font = New-Object System.Drawing.Font('Segoe UI', 11)
$subtitle.ForeColor = [System.Drawing.Color]::FromArgb(220, 218, 225)
$header.Controls.Add($subtitle)

$session = New-Object System.Windows.Forms.Label
$session.Text = 'Sessão iniciada: ' + (Get-Date -Format 'dd/MM/yyyy  HH:mm:ss')
$session.Location = New-Object System.Drawing.Point(34, 94)
$session.AutoSize = $true
$session.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$session.ForeColor = [System.Drawing.Color]::FromArgb(190, 187, 199)
$header.Controls.Add($session)

$intro = New-Object System.Windows.Forms.Label
$intro.Text = 'Escolha uma ação. O arquivo inglês original será guardado na pasta do jogo.'
$intro.Location = New-Object System.Drawing.Point(30, 147)
$intro.Size = New-Object System.Drawing.Size(600, 25)
$intro.Font = New-Object System.Drawing.Font('Segoe UI Semibold', 10, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($intro)

$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = 'INSTALAR TRADUÇÃO PT-BR'
$installButton.Location = New-Object System.Drawing.Point(32, 190)
$installButton.Size = New-Object System.Drawing.Size(286, 68)
$installButton.FlatStyle = 'Flat'
$installButton.FlatAppearance.BorderSize = 0
$installButton.BackColor = [System.Drawing.Color]::FromArgb(222, 0, 68)
$installButton.ForeColor = [System.Drawing.Color]::White
$installButton.Font = New-Object System.Drawing.Font('Segoe UI Semibold', 11, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($installButton)

$restoreButton = New-Object System.Windows.Forms.Button
$restoreButton.Text = 'RESTAURAR INGLÊS ORIGINAL'
$restoreButton.Location = New-Object System.Drawing.Point(340, 190)
$restoreButton.Size = New-Object System.Drawing.Size(286, 68)
$restoreButton.FlatStyle = 'Flat'
$restoreButton.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(210, 211, 218)
$restoreButton.FlatAppearance.BorderSize = 1
$restoreButton.BackColor = [System.Drawing.Color]::White
$restoreButton.ForeColor = [System.Drawing.Color]::FromArgb(48, 48, 58)
$restoreButton.Font = New-Object System.Drawing.Font('Segoe UI Semibold', 11, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($restoreButton)

$folderButton = New-Object System.Windows.Forms.Button
$folderButton.Text = 'Selecionar pasta do GPU Tweak III…'
$folderButton.Location = New-Object System.Drawing.Point(32, 278)
$folderButton.Size = New-Object System.Drawing.Size(594, 38)
$folderButton.FlatStyle = 'Flat'
$folderButton.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(210, 211, 218)
$folderButton.BackColor = [System.Drawing.Color]::FromArgb(250, 250, 252)
$folderButton.ForeColor = [System.Drawing.Color]::FromArgb(65, 67, 76)
$folderButton.Font = New-Object System.Drawing.Font('Segoe UI', 9.5)
$form.Controls.Add($folderButton)

$pathLabel = New-Object System.Windows.Forms.Label
$pathLabel.Text = 'Pasta padrão: ' + $defaultDir
$pathLabel.Location = New-Object System.Drawing.Point(34, 329)
$pathLabel.Size = New-Object System.Drawing.Size(590, 22)
$pathLabel.ForeColor = [System.Drawing.Color]::FromArgb(94, 97, 108)
$pathLabel.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$form.Controls.Add($pathLabel)

$status = New-Object System.Windows.Forms.Label
$status.Text = 'Pronto para instalar ou restaurar.'
$status.Location = New-Object System.Drawing.Point(34, 372)
$status.Size = New-Object System.Drawing.Size(590, 24)
$status.ForeColor = [System.Drawing.Color]::FromArgb(92, 95, 105)
$status.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$form.Controls.Add($status)

function Get-GameDirectory {
    if ($script:gameDirectory -and (Test-Path -LiteralPath $script:gameDirectory)) { return $script:gameDirectory }
    if ((Test-Path -LiteralPath (Join-Path $defaultDir 'aseng.xml')) -or (Test-Path -LiteralPath (Join-Path $defaultDir '_aseng.xml'))) {
        $script:gameDirectory = $defaultDir
        return $script:gameDirectory
    }
    $picker = New-Object System.Windows.Forms.FolderBrowserDialog
    $picker.Description = 'Selecione a pasta de instalação do GPU Tweak III.'
    $picker.ShowNewFolderButton = $false
    if ($picker.ShowDialog($form) -ne [System.Windows.Forms.DialogResult]::OK) { return $null }
    $script:gameDirectory = $picker.SelectedPath
    $pathLabel.Text = 'Pasta selecionada: ' + $script:gameDirectory
    return $script:gameDirectory
}

function Show-Result([string]$message, [System.Windows.Forms.MessageBoxIcon]$icon) {
    [void][System.Windows.Forms.MessageBox]::Show($form, $message, 'GPU Tweak III — Tradução PT-BR', [System.Windows.Forms.MessageBoxButtons]::OK, $icon)
}

function Stop-Game([string]$directory) {
    $exe = Join-Path $directory 'GPU Tweak III.exe'
    $running = @(Get-Process -Name 'GPU Tweak III' -ErrorAction SilentlyContinue | Where-Object {
        try { $_.Path -eq $exe } catch { $false }
    })
    foreach ($process in $running) { [void]$process.CloseMainWindow() }
    $limit = (Get-Date).AddSeconds(15)
    do {
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 200
        $remaining = @(Get-Process -Name 'GPU Tweak III' -ErrorAction SilentlyContinue | Where-Object {
            try { $_.Path -eq $exe } catch { $false }
        })
        if ($remaining.Count -eq 0) { return $true }
    } while ((Get-Date) -lt $limit)
    return $false
}

function Start-Game([string]$directory) {
    $exe = Join-Path $directory 'GPU Tweak III.exe'
    if (Test-Path -LiteralPath $exe) {
        # Use Explorer so the application starts in the user's normal desktop session.
        Start-Process -FilePath 'explorer.exe' -ArgumentList ('"' + $exe + '"')
        return $true
    }
    return $false
}

function Ask-StartGame {
    $dialog = New-Object System.Windows.Forms.Form
    $dialog.Text = 'GPU Tweak III — Tradução PT-BR'
    $dialog.StartPosition = 'CenterParent'
    $dialog.FormBorderStyle = 'FixedDialog'
    $dialog.ClientSize = New-Object System.Drawing.Size(430, 160)
    $dialog.MaximizeBox = $false
    $dialog.MinimizeBox = $false
    $dialog.ShowInTaskbar = $false
    $dialog.BackColor = [System.Drawing.Color]::FromArgb(245, 246, 249)
    $dialog.Font = New-Object System.Drawing.Font('Segoe UI', 10)
    $question = New-Object System.Windows.Forms.Label
    $question.Text = 'Deseja iniciar o GPU Tweak III agora?'
    $question.Location = New-Object System.Drawing.Point(20, 24)
    $question.Size = New-Object System.Drawing.Size(390, 42)
    $dialog.Controls.Add($question)
    $yes = New-Object System.Windows.Forms.Button
    $yes.Text = 'Sim (S)'
    $yes.Location = New-Object System.Drawing.Point(170, 94)
    $yes.Size = New-Object System.Drawing.Size(105, 38)
    $yes.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $yes.BackColor = [System.Drawing.Color]::FromArgb(222, 0, 68)
    $yes.ForeColor = [System.Drawing.Color]::White
    $yes.FlatStyle = 'Flat'
    $dialog.Controls.Add($yes)
    $no = New-Object System.Windows.Forms.Button
    $no.Text = 'Não (N)'
    $no.Location = New-Object System.Drawing.Point(290, 94)
    $no.Size = New-Object System.Drawing.Size(105, 38)
    $no.DialogResult = [System.Windows.Forms.DialogResult]::No
    $no.FlatStyle = 'Flat'
    $dialog.Controls.Add($no)
    $dialog.AcceptButton = $yes
    $dialog.CancelButton = $no
    $dialog.KeyPreview = $true
    $dialog.Add_KeyDown({
        if ($_.KeyCode -eq [System.Windows.Forms.Keys]::S) {
            $dialog.DialogResult = [System.Windows.Forms.DialogResult]::Yes
            $dialog.Close()
        } elseif ($_.KeyCode -eq [System.Windows.Forms.Keys]::N -or $_.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
            $dialog.DialogResult = [System.Windows.Forms.DialogResult]::No
            $dialog.Close()
        }
    })
    return ($dialog.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::Yes)
}

$folderButton.Add_Click({
    $script:gameDirectory = $null
    $directory = Get-GameDirectory
    if ($directory) { $status.Text = 'Pasta do jogo selecionada.' }
})

$installButton.Add_Click({
    try {
        if (-not (Test-Path -LiteralPath $translation)) { throw 'Tradução não localizada. Coloque o arquivo aseng.xml no mesmo diretório do script.' }
        $directory = Get-GameDirectory
        if (-not $directory) { return }
        $target = Join-Path $directory 'aseng.xml'
        $original = Join-Path $directory '_aseng.xml'
        if (-not (Test-Path -LiteralPath $target)) { throw 'Não encontrei aseng.xml na pasta selecionada.' }
        $status.Text = 'Fechando o GPU Tweak III…'
        if (-not (Stop-Game $directory)) { throw 'O GPU Tweak III não fechou. Feche o programa e tente novamente; o arquivo não foi substituído.' }
        $currentFile = [IO.File]::ReadAllText($target)
        $isEnglishFile = $currentFile.Contains('En="Live Update connection failed.')
        if (-not (Test-Path -LiteralPath $original) -or $isEnglishFile) {
            Copy-Item -LiteralPath $target -Destination $original -Force
        }
        $temporary = Join-Path $directory 'aseng.xml.ptbr.tmp'
        Copy-Item -LiteralPath $translation -Destination $temporary -Force
        Move-Item -LiteralPath $temporary -Destination $target -Force
        $pathLabel.Text = 'Pasta do jogo: ' + $directory
        $status.Text = 'Tradução instalada. O backup inglês está salvo como _aseng.xml.'
        $status.ForeColor = [System.Drawing.Color]::FromArgb(25, 132, 80)
        if (Ask-StartGame) {
            if (-not (Start-Game $directory)) { throw 'Não encontrei GPU Tweak III.exe para iniciar o programa.' }
        }
        $form.Close()
    } catch {
        $status.Text = 'Não foi possível instalar a tradução.'
        $status.ForeColor = [System.Drawing.Color]::FromArgb(190, 35, 55)
        Show-Result $_.Exception.Message ([System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$restoreButton.Add_Click({
    try {
        $directory = Get-GameDirectory
        if (-not $directory) { return }
        $original = Join-Path $directory '_aseng.xml'
        if (-not (Test-Path -LiteralPath $original)) { throw 'O backup _aseng.xml não foi encontrado. Instale a tradução primeiro para criá-lo.' }
        $status.Text = 'Fechando o GPU Tweak III…'
        if (-not (Stop-Game $directory)) { throw 'O GPU Tweak III não fechou. Feche o programa e tente novamente; o arquivo não foi substituído.' }
        Copy-Item -LiteralPath $original -Destination (Join-Path $directory 'aseng.xml') -Force
        $pathLabel.Text = 'Pasta do jogo: ' + $directory
        $status.Text = 'Arquivo inglês original restaurado.'
        $status.ForeColor = [System.Drawing.Color]::FromArgb(25, 132, 80)
        if (Ask-StartGame) {
            if (-not (Start-Game $directory)) { throw 'Não encontrei GPU Tweak III.exe para iniciar o programa.' }
        }
        $form.Close()
    } catch {
        $status.Text = 'Não foi possível restaurar o arquivo original.'
        $status.ForeColor = [System.Drawing.Color]::FromArgb(190, 35, 55)
        Show-Result $_.Exception.Message ([System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

[void]$form.ShowDialog()
