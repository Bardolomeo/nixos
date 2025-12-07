{ config, pkgs, system,  

... }:
{

  
  # TODO  please change the username & home directory to your own
  home.username = "magigraph";
  home.homeDirectory = "/home/magigraph";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 64;
  };


  xdg.configFile."nvim/".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim;

 
  # alternatively, one could write the configuration inline as follows
  # xdg.configFile."neofetch/config.conf".text = '' #content here '';


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    home-manager
    quickshell
    neofetch
    nnn # terminal file manager
    ranger

    # archives
    zip
    xz
    unzip

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

			# nix related
			#
			# it provides the command `nom` works just like `nix`
			# with more details log output
			nix-output-monitor

			# productivity
			hugo # static site generator
			glow # markdown previewer in terminal

			btop  # replacement of htop/nmon
			iotop # io monitoring
			iftop # network monitoring

			# system call monitoring

			# system tools

			nix-fast-build
			nix-eval-jobs
			
			# git

			lazygit
			nix-fast-build
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
		
		wayland.windowManager.sway = {
			enable = true;
			wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
			config = rec {
				modifier = "Mod4";
				# Use kitty as default terminal
				terminal = "kitty"; 
				input."*".xkb_layout = "it";
				startup = [
					# Launch Firefox on start
					{command = "exec sleep 5; systemctl --user start kanshi.service";}
				];
			};
		};

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
			nix-git = "git add && git commit -m '.' && git push && sudo nixos-rebuild --flake 'github:Bardolomeo/nixos#nightqu33n'";
		};
		bashrcExtra = "#DIOPORCO";
		extra
    # TODO add your custom bashrc here

  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
