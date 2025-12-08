{ config, pkgs, lib, home, ...} :
{

	home.packages = with pkgs; [ typescript-language-server ];
}
