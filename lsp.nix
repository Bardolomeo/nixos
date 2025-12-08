{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qt6.qtdeclarative
		typescript-language-server 
	];
}
