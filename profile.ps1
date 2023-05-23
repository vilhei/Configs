New-Alias -Name "codei" code-insiders
New-Alias -Name "gs" Get-GitStatus
New-Alias -Name "gcom" Set-GitCommit

# Import-Module Az.Tools.Predictor
Import-Module CompletionPredictor
Import-Module PoshColor
Import-Module posh-git

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView 

# Set-PoshColorTheme DefaultHighColor

$GitPromptSettings.DefaultPromptPrefix.Text = ""
$GitPromptSettings.DefaultPromptSuffix.Text = ""
$GitPromptSettings.DefaultPromptPath = " "

# Change the prompt from showing the full path
function prompt {
  $p = Get-Location
  if ((Get-Location).path.split("\").count -gt 4) {
    <# Action to perform if the condition is true #>
    $p = ((Get-Location).drive.name) 
    $p += ":\...\" 
    $p += (Split-Path -path (Get-Location) -Parent) | Split-Path -leaf
    $p += "\"
    $p += Split-Path -path (Get-Location) -Leaf
    $p += & $GitPromptScriptBlock
  }
  "$p> "
  $Host.UI.RawUI.WindowTitle = (Split-Path -path $p -leaf)  
}

function cwd {
  Set-Clipboard (Get-Location)
}

function Get-GitStatus {
  git status $args
}

function Set-GitCommit {
  git commit $args
}
