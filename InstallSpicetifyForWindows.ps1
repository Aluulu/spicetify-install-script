# Use this command to run the latest version of this script from GitHub:
# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Aluulu/spicetify-install-script/main/InstallSpicetifyForWindows.ps1'))

$ErrorActionPreference = 'Stop'

$CheckIfSpicetifyIsInstalled = Test-Path -Path "$home\.spicetify"
if ($CheckIfSpicetifyIsInstalled -eq $True) {
    Spicetify backup apply
}
else {

    function RemoveOldSpicetifyInstall {
    Try {
        Remove-Item "$home\.spicetify" -Recurse
    } Catch {
        Write-Host "Unable to remove ~\.spicetify" -foreground Red
        Write-host "Error message is as followed: " -foreground Red
        $Error[0].exception
        $Error[0].Exception.GetType().FullName
    }

    Try {
        Remove-Item "$home\spicetify-cli" -Recurse
    } Catch {
        Write-Host "Unable to remove ~\spicetify-cli" -foreground Red
        Write-host "Error message is as followed: " -foreground Red
        $Error[0].exception
        $Error[0].Exception.GetType().FullName
    }
    } # End of function RemoveOldSpicetifyInstall

    function DownloadSpicetifyScript {
        Try {
            # The try function will try to run the following code, and then catch any errors. 
            Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
        }
        Catch {
            Write-Host "Unable to download and run the script from GitHub" -foreground Red # The catch function will catch any specificied error codes. If left blank it will catch ALL errors.
            Write-host "Error message is as followed: " -foreground Red
            $Error[0].exception
            $Error[0].Exception.GetType().FullName
        }
    } # End of function DownloadSpicetifyScript

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
    ConfigureSpotify
} # End if (if CheckIfSpicetifyIsInstalled) check