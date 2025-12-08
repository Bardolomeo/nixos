{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ 
		python3
		nil
		tailwindcss-language-server
		libclang
		vscode-css-languageserver
		qt6.qtdeclarative
		typescript-language-server 
	];
}
