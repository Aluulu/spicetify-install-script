$ErrorActionPreference = 'Stop'

function RemoveOldSpicetifyInstall {
Try {
    Remove-Item "$home\.spicetify" -Recurse
} Catch {
    Write-Host "Unable to remove ~\.spicetify"
}

Try {
    Remove-Item "$home\spicetify-cli" -Recurse
} Catch {
    Write-Host "Unable to remove ~\spicetify-cli"
}
} # End of function RemoveOldSpicetifyInstall

function DownloadSpicetifyScript {
    Try {
        # The try function will try to run the following code, and then catch any errors. 
        Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
    }
    Catch {
        Write-Host "Unable to download and run the script from GitHub" # The catch function will catch any specificied error codes. If left blank it will catch ALL errors.
    }
} # End of function DownloadSpicetifyScript

function DownloadDribblishScript {
    Try {
        # The try function will try to run the following code, and then catch any errors. 
        Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/morpheusthewhite/spicetify-themes/master/Dribbblish/install.ps1" | Invoke-Expression
    }
    Catch {
        # The catch function will catch any specificied error codes. If left blank it will catch ALL errors.
    }
} # End of function DownloadDribblishScript

function ConfigureSpotify {
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
} # End of function ConfigureSpotify

RemoveOldSpicetifyInstall
DownloadSpicetifyScript
DownloadDribblishScript
ConfigureSpotify