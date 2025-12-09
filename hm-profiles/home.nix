{ config, pkgs, lib,  ...}:
let
		swayPath = /home/magigraph/nixos/dotfiles/sway;
		quickshellPath = /home/magigraph/nixos/dotfiles/quickshell;
in
{

  # TODO  please change the username & home directory to your own
  home.username = "magigraph";
  home.homeDirectory = "/home/magigraph";

	imports = [
		../system/lsp.nix
	]; 
	
  xresources.properties = {
    "Xcursor.size" = 64;
  };

	xdg.configFile."hypr/".source = config.lib.file.mkOutOfStoreSymlink /home/magigraph/nixos/dotfiles/hypr;
	xdg.configFile."hypr/".force = true;
  xdg.configFile."nvim/".source = config.lib.file.mkOutOfStoreSymlink /home/magigraph/nixos/dotfiles/nvim;
  xdg.configFile."quickshell/".source = config.lib.file.mkOutOfStoreSymlink quickshellPath;
	xdg.configFile."sway/".source = lib.mkForce swayPath;
  xdg.configFile."rofi/".source = config.lib.file.mkOutOfStoreSymlink /home/magigraph/nixos/dotfiles/rofi;
  xdg.configFile."waybar/".source = config.lib.file.mkOutOfStoreSymlink /home/magigraph/nixos/dotfiles/waybar;


	programs.neovim = {
		enable = true;
	};

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    hyprland
		home-manager
    quickshell
    neofetch
    nnn # terminal file manager
    ranger
		rustc
		cargo

    # archives
    zip
    xz
    unzip
		prettier

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor

    # networking tools
    dnsutils  # `dig` + `nslookup`
    socat # replacement of openbsd-netcat
		nmap # A utility for network discovery and security auditing
		ipcalc  # it is a calculator for the IPv4/v6 addresses

			# misc
		cowsay
		file
		which
		tree

			# productivity
		glow # markdown previewer in terminal

		btop  # replacement of htop/nmon
		lazygit
		rofi
		waybar
		gcc
	]; 


		programs.brave = {
			enable = true;
			package = pkgs.brave;
			extensions = [
				# GET THEM FROM CHROME STORE URL
				"eimadpbcbfnmbkopoojfekhnkhdbieeh"  #dark reader
				"cjpalhdlnbpafiamejdnhcphjbkeiagm"  # ublock origin
				"dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
				"nngceckbapebfimnlniiiahkandclblb" # bitwarden
				"bmdglhpmdgdibibdlmapblpjbandmpga" # AC Theme
				"hnlkiofnhhoahaiimdicppgemmmomijo" # qwant
			];
		};

		# basic configuration of git, please change to your own
		programs.git = {
			enable = true;
			settings.user.name = "Bardolomeo";
			settings.user.email = "sapiobard@gmail.com";
		};

		# alacritty - a cross-platform, GPU-accelerated terminal emulator
		programs.kitty= {
			enable = true;
			# custom settings
		};

			services.gnome-keyring.enable = true;
		
	#	wayland.windowManager.sway = { 
	#		wrapperFeatures.gtk = true;
	#		enable = true; 
	#		systemd.variables = ["--all"];
	#	};

		# ouput configuration daemon for displays (Sway)
		systemd.user.services.kanshi = {
			environment = {
				WAYLAND_DISPLAY="wayland-1";
				DISPLAY = ":0";
			}; 
			serviceConfig = {
				Type = "simple";
				ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
			};
		};

		programs.bash = {
    enable = true;
    enableCompletion = true;
		shellAliases = {
			nix-git = "git add . && git commit -m '.' ; git push && sudo nixos-rebuild switch --flake .#nightqu33n --impure";
		};
		bashrcExtra = "";

  };

  home.stateVersion = "25.11";
}
