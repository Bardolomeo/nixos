{ config, pkgs, lib, home, ...} :
{
	
	pypackages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      pandas
      requests
    ]))
  ];
	
	home.packages = with pkgs; [ 
		nil
		tailwindcss-language-server
		libclang
		vscode-css-languageserver
		qt6.qtdeclarative
		typescript-language-server 
		pypackages
	];
}
