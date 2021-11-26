Remove-Item "$home\.spicetify" -Recurse
Remove-Item "$home\spicetify-cli" -Recurse

Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression


Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/morpheusthewhite/spicetify-themes/master/Dribbblish/install.ps1" | Invoke-Expression

Start-Sleep -Seconds 5

spicetify config color_scheme purple

Start-Sleep -Seconds 3



spicetify config extensions fullAppDisplay.js

spicetify config custom_apps reddit

spicetify config custom_apps lyrics-plus

spicetify apply

Write-Output "The script has completed its operation. Please make sure to check that the theme is working, and that applications such as Lyrics and fullAppDisplay are being displayed."

PAUSE