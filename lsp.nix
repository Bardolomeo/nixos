{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qt5.full
		qtcreator
		typescript-language-server 
	];
}
