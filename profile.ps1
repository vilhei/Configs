New-Alias -Name "gs" Get-GitStatus
New-Alias -Name "gcom" Set-GitCommit
New-Alias -Name "g" Set-Git

Import-Module CompletionPredictor
Import-Module PoshColor
Import-Module posh-git

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView 

function cwd {
  Set-Clipboard (Get-Location)
}

function Get-GitStatus {
  git status $args
}

function Set-GitCommit {
  git commit $args
}

function Set-Git {
  git  $args
}

function time($block) {
    $sw = [Diagnostics.Stopwatch]::StartNew()
    &$block @args
    $sw.Stop()
    $sw.Elapsed
}

oh-my-posh init pwsh --config "https://raw.githubusercontent.com/vilhei/Configs/main/ohmyposh.omp.json" | Invoke-Expression
