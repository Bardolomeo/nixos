{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		nil
		tailwindcss-language-server
		"python3.12-python-lsp-server"
		libclang
		vscode-css-languageserver
		qt6.qtdeclarative
		typescript-language-server 
	];
}
