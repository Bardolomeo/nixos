{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		typescript-language-server 
	];
}
