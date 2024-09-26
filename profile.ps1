New-Alias -Name "gs" Get-GitStatus
New-Alias -Name "gcom" Set-GitCommit
New-Alias -Name "g" Set-Git

Import-Module CompletionPredictor
Import-Module PoshColor
Import-Module posh-git

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView 

Set-PSReadLineKeyHandler -Key Ctrl+d -Function SelectForwardWord
Set-PSReadLineKeyHandler -Key Ctrl+d -Function SelectBackwardWord

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

# function time {
#   $v = (Invoke-Expression "$args")
#   Measure-Command { $v |  Out-Default }
# }


function time($block) {
  $sw = [Diagnostics.Stopwatch]::StartNew()
  &$block @args
  $sw.Stop()
  $sw.Elapsed
}

function which($block) {
    (Get-Command $block).Path
}

Set-PSReadLineKeyHandler -Key '(', '{', '[' `
  -BriefDescription InsertPairedBraces `
  -LongDescription "Insert matching braces" `
  -ScriptBlock {
  param($key, $arg)

  $closeChar = switch ($key.KeyChar) {
    <#case#> '(' { [char]')'; break }
    <#case#> '{' { [char]'}'; break }
    <#case#> '[' { [char]']'; break }
  }

  $selectionStart = $null
  $selectionLength = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)

  $line = $null
  $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    
  if ($selectionStart -ne -1) {
    # Text is selected, wrap it in brackets
    [Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, $key.KeyChar + $line.SubString($selectionStart, $selectionLength) + $closeChar)
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
  }
  else {
    # No text is selected, insert a pair
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)$closeChar")
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
  }
}

Set-PSReadLineKeyHandler -Key ')', ']', '}' `
  -BriefDescription SmartCloseBraces `
  -LongDescription "Insert closing brace or skip" `
  -ScriptBlock {
  param($key, $arg)

  $line = $null
  $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

  if ($line[$cursor] -eq $key.KeyChar) {
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
  }
  else {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)")
  }
}

oh-my-posh init pwsh --config "https://raw.githubusercontent.com/vilhei/Configs/main/ohmyposh.omp.json" | Invoke-Expression

