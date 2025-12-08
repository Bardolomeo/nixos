{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		tailwindcss-language-server
		python3-python-lsp-server
		clangd
		cssls
		qt6.qtdeclarative
		typescript-language-server 
	];
}
