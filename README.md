![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)![Spotify](https://img.shields.io/badge/Spotify-1ED760?style=for-the-badge&logo=spotify&logoColor=white)![Linux](https://img.shields.io/badge/Linux-0078D6?style=for-the-badge&logo=linux&logoColor=white)

# spicetify-install-script
This is a one-click, automatic set-up, one size fits all script that installs and configures [Spicetify](https://github.com/khanhas/spicetify-cli) and [extensions](https://github.com/khanhas/spicetify-cli/wiki/Extensions).

Open **PowerShell/Terminal** and paste the following commands.  
This will run the scripts from GitHub without having to download them:

**Windows (PowerShell):**  
```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Aluulu/spicetify-install-script/main/InstallSpicetifyForWindows.ps1'))
```  
**Flatpak:**  
```
curl -fsSL https://raw.githubusercontent.com/Aluulu/spicetify-install-script/main/InstallSpicetifyForFlatpak.sh | sh
```


## How the script works
### Installation of Spicetify
The script works by utilising the installation script found on the offical Spicetify website. This downloads and installs spicetify to your system.  
The script for Windows is: https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1  
The script for Flatpak is: https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh  
The home page of said script here found here: https://spicetify.app/docs/advanced-usage/installation

Afterwards the script will configure any nessesary settings. For example, setting the preference path in Flatpak, or configuring the Spicetify colour.

### Installation of Extensions
The extensions this script will install are: [FullAppDisplay](https://github.com/khanhas/spicetify-cli/wiki/Extensions#full-app-display), [Reddit](https://github.com/khanhas/spicetify-cli/wiki/Custom-Apps#reddit), and [Lyrics Plus](https://github.com/khanhas/spicetify-cli/wiki/Custom-Apps#lyrics-plus).  
**FullAppDisplay** is an extension that adds an button to fully display Spotify with a minimal album cover art display with a beautiful blur effect background.
![FullAppDisplay extension example image](https://camo.githubusercontent.com/2ef61d7d70cb83ae6016b0ac1cf0861447569a693c1103fc715e45fc8cb0fa8f/68747470733a2f2f692e696d6775722e636f6d2f533743505132732e706e67)
The **Reddit** app fetches posts from any Spotify link sharing subreddit and puts them in a simple and easy to use method of browsing.
![The Reddit App extension example image](https://camo.githubusercontent.com/ffcfad471d34d328fc185bbf74be67981858b8c66c21b468d14a0dfe0b59caa5/68747470733a2f2f692e696d6775722e636f6d2f4d433374704e5a2e706e67) 
**Lyrics Plus** is an extentsion that provides real-time lyrics to your favourite songs.
![Lyrics Plus applcation extention image](https://camo.githubusercontent.com/aeeb02c69af74c048fe4e3c72a33f7969bb7b28f47e904394300d0137aa6ece6/68747470733a2f2f692e696d6775722e636f6d2f577444303830412e706e67)

## Additional notes
Have any questions? Message me here on GitHub.  
Have an issue with the script? Open a ticket [here:](https://github.com/Aluulu/spicetify-dribblish-script-install/issues)  
Have a way to improve this script? Why not contribute [here:](https://github.com/Aluulu/spicetify-dribblish-script-install/pulls)  
