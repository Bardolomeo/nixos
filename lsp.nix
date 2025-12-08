{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		tailwind-language-server
		pylsp
		clangd
		cssls
		qt6.qtdeclarative
		typescript-language-server 
	];
}
