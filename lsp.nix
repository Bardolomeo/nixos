{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qtdeclarative
		typescript-language-server 
	];
}
