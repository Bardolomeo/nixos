{pkgs, ...} :
{
	home.packages = with pkgs; [
		hyprland	
	];

	programs.hyprland = {
		enable = true;
	};
}
