{ config, pkgs, lib, home, ...} :

	
{
    
	home.packages = with pkgs; [ 
		nil
		tailwindcss-language-server
		libclang
		vscode-css-languageserver
		typescript-language-server 
		qt5.qtdeclarative
		(python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
			python-lsp-server
    ]))
	];
}
