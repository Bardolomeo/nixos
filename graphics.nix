{config, pkgs, lib, ...} :

{
	environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

	xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
    config.common.default = "*";
  };

  xdg.configFile."quickshell/".source = config.lib.file.mkOutOfStoreSymddlink ./dotfiles/nvim;

  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
  	quickshell
	];

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
};
	
	
}
