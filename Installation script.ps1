$title = "File cannot be reached"
$msg = "The script was unable to download the specified installation script. Would you like to retry connecting to GitHub?"
$options = '&Yes', '&No'
$default = 1  # 0=Yes, 1=No
$error.Clear() # Clears the error log. Used to prevent old error logs from surfacing from repeat script runs.

Remove-Item "$home\.spicetify" -Recurse
Remove-Item "$home\spicetify-cli" -Recurse

function DownloadSpicetifyScript {
    Try {
        # The try function will try to run the following code, and then catch any errors. 
        Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
    }
    Catch {
        # The catch function will catch any specificied error codes. If left blank it will catch ALL errors.
    }
    if ($error) {
        # If the Try function catches a error, then run the following code:
        do {
            $response = $Host.UI.PromptForChoice($title, $msg, $options, $default)
            if ($response -eq 0) {
            }
        } until ($response -eq 1)
    }
    else {
        # If the Try function doesn't catch an error then run the following code:
    }
}
DownloadSpicetifyScript # Runs the function above

function DownloadDribblishScript {
    Try {
        # The try function will try to run the following code, and then catch any errors. 
        Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/morpheusthewhite/spicetify-themes/master/Dribbblish/install.ps1" | Invoke-Expression
    }
    Catch {
        # The catch function will catch any specificied error codes. If left blank it will catch ALL errors.
    }
    if ($error) {
        # If the Try function catches a error, then run the following code:
        do {
            $response = $Host.UI.PromptForChoice($title, $msg, $options, $default)
            if ($response -eq 0) {
            }
        } until ($response -eq 1)
    }
    else {
        # If the Try function doesn't catch an error then run the following code:
    }
}
DownloadDribblishScript # Runs the function above

Start-Sleep -Seconds 5 # pauses for 5 seconds to allow Spotify time to load

spicetify config color_scheme purple
# Applies the colour scheme. Change this to be the colour you want to be applied to the Spotify.
# Default is base (Green). Other options include purple, beach-sunset (red), dark (yellow), gruvbox (dark green), nord-dark (light blue), nord-light (light blue with white), and white
    
Start-Sleep -Seconds 3 # pauses for 3 seconds to allow Spotify time to load



spicetify config extensions fullAppDisplay.js

spicetify config custom_apps reddit

spicetify config custom_apps lyrics-plus

spicetify apply

Write-Output "The script has completed its operation. Please make sure to check that the theme is working, and that applications such as Lyrics and fullAppDisplay are being displayed."

PAUSE