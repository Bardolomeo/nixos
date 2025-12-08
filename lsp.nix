{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qt
		typescript-language-server 
	];
}
