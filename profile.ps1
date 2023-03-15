Import-Module Az.Tools.Predictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView 

Import-Module PoshColor
# Set-PoshColorTheme DefaultHighColor

# Change the prompt from showing the full path
function prompt {
  $p = "PS: " + ((Get-Location).drive.name) + "\...\" + (Split-Path -leaf -path (Get-Location))
  "$p> "
}

New-Alias -Name "codei" code-insiders
