{pkgs, ...} :
{
	home.programs = with pkgs; [
		hyprland	
	];

	programs.hyprland = {
		enable = true;
	};
}
