{ config, pkgs, lib, home, ...} :
let

	pypackages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      pandas
      requests
    ]))
  ];
in
{
	
	
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
