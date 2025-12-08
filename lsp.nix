{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		qmlls
		typescript-language-server 
	];
}
