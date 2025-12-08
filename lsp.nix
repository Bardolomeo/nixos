{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qt5
		qtcreator
		typescript-language-server 
	];
}
