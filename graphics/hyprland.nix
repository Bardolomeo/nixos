{ pkgs, config, lib, ...} :
{

		

	home.packages = with pkgs; [
		foot
		grim
		slurp
		swww
		fish
		light
		swaylock-effects
		swayidle
		theme-sh
		xdg-desktop-portal-hyprland
	];

	wayland.windowManager.hyprland  = {
		enable = true;	
	};

	#	home.file."~/.config/hypr/hyprland.conf".text = ''
	#		source=./land/defaults.conf # this needs to be sourced before theme file
			# source=./land/nvidia.conf

			######################################################################################################
			# uncomment if using hyprtheme and remove any other source for hyprtheme.conf
			# source=/home/flicko/.config/hypr/themes/hyprtheme.conf

			######################################################################################################
			# MANUAL THEME SOURCE HERE

			# $yorha=$HERE/themes/yorha
			# source=$yorha/theme.conf

			######################################################################################################

	#		source=./land/general.conf
	#		source=./land/binds.conf
	#		source=./land/rules.conf
	#		source=./profiles/power.conf
#	'';

}
