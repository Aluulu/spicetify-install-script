# Note: You may need to apply permissions for this script in order to run it.
# To do so, use this command in a terminal:
# chmod u+x /Location/To/Script/InstallSpicetifyForFlatpak.sh

# Use this command to run the latest version of this script from GitHub:
# curl -fsSL https://raw.githubusercontent.com/Aluulu/spicetify-dribblish-script-install/main/InstallSpicetifyForFlatpak.sh | sh

# Check if the configuration file exists. If it does, then spicetify must be installed already
if [ -f $HOME/.config/spicetify/config-xpui.ini ];
then
	sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
	sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

	spicetify backup apply
else # If spicetify isn't installed, it will install it
	curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh

	# Runs spotify so that it is initialised and then kills it 5 seconds after. (Note, this may count as a crash)
	flatpak run com.spotify.Client

	sleep 5  # Waits 5 seconds.

	killall spotify

	# Changes the configuration to be correct
	# Changes line 2 and line 8
	sed -i '2 c\spotify_path            = /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/' $HOME/.config/spicetify/config-xpui.ini
	sed -i '8 c\spotify_path            = prefs_path              = '$HOME'/.var/app/com.spotify.Client/config/spotify/prefs' $HOME/.config/spicetify/config-xpui.ini

	# Enables read and write permissions for Spicetify since Flatpak limits permissions
	sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
	sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

	# Backs up Spicetify
	spicetify backup

	# Applies Spicetify onto spotify
	spicetify apply

	# Copies the extensions from the spicetify folder to the configuration folder
	cp ~/.spicetify/Extensions/* ~/.config/spicetify/Extensions

	# Enables the extensions
	spicetify config extensions fullAppDisplay.js

	# Runs Spotify so that you can see if the changes have worked
	flatpak run com.spotify.Client
fi