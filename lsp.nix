{ config, pkgs, lib, home, ...} :
{

 	home.packages = with pkgs; [ 
		nil
		tailwindcss-language-server
		libclang
		vscode-css-languageserver
		qt6.qtdeclarative
		typescript-language-server 
		python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
			python-lsp-server
    ])
	];
}
