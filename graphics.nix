{config, pkgs, ...} :
{

	environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

	xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
    config.common.default = "*";
  };

	programs.wayland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};
	
}
