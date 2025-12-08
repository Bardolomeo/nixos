{ config, pkgs, lib, home, ...} :
{

	home.kdePackages.qtedeclarative;
	home.packages = with pkgs; [ 
		nil
		typescript-language-server 
	];
}
