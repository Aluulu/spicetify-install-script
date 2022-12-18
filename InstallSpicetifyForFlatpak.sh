# Note: You may need to apply permissions for this script in order to run it.
# To do so, use this command in a terminal:
# chmod u+x /Location/To/Script/InstallSpicetifyForFlatpak.sh

# Use this command to run the latest version of this script from GitHub:
# curl -fsSL https://raw.githubusercontent.com/Aluulu/spicetify-install-script/main/InstallSpicetifyForFlatpak.sh | sh

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
	
	# Check if the config file exists
	# Set the file location and name as a variable
	filename=$HOME/.config/spicetify/config-xpui.ini

	# Create variable to be used as a flag to indicate if the file exists
	filefound=0

	# Create a while loop to loop through until the file is found
	while [ $filefound -eq 0 ]
	do

		# Check if the file exists
		if [ -f "$filename" ];

		# If the file exists, then set the flag to 1 and exit the loop
		then
			filefound=1

		# If the file doesn't exist, then wait 1 second and check again
		else
			printf "%s not found. Waiting 1 second and checking again.\n" "$filename"
			sleep 1

		fi
	done

	# Changes the configuration to be correct
	# Changes spotify_path to /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/
	# Changes prefs_path to /home/$NameHere/.var/app/com.spotify.Client/config/spotify/prefs

	# Set the target word and replacement text
	TWord="spotify_path"
	RText="spotify_path            = /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/"

	# https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/
	# sed finds the target word and replaces it with the replacement text
	# -i is used to edit the file in place
	# s is used to substitute
	# | is used to separate the target word and replacement text
	# .* is used to match any character 0 or more times, so .* before and after the target word is used to match the entire line
	# This will replace the entire line with the replacement text
	sed -i "s|.*$TWord.*|$RText|" "$filename"

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
    spicetify config custom_apps reddit
    spicetify config custom_apps lyrics-plus

	# Runs Spotify so that you can see if the changes have worked
	flatpak run com.spotify.Client
fi