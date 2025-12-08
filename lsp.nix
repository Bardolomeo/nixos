{ config, pkgs, lib, home, ...} :
{

	home.kdePackages.qtedeclarative.enbale = true;
	home.packages = with pkgs; [ 
		nil
		typescript-language-server 
	];
}
