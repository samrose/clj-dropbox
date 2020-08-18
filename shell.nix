{ pkgs ? import ./pkgs.nix { } }:
with pkgs;
let
  inherit (perlPackages) vidir;
  clj2nix =
    pkgs.callPackage
      (
        pkgs.fetchFromGitHub {
          owner = "hlolli";
          repo = "clj2nix";
          rev = "3ab3480a25e850b35d1f532a5e4e7b3202232383";
          sha256 = "0bsq0b0plh6957zy9gl2g6hq8nhjkln4sn9lgf3yqbwz8i1z5a4a";
        }
      ) { };
  neovim-with-config = neovim.override {
    configure = {
      customRC = ''
        set title
        set nu
        let g:rainbow_active = 1
      '';
      packages.package.start = with vimPlugins; [
        fzf
        rainbow
        vim-clojure-highlight
        vim-clojure-static
        vim-fireplace
        vim-nix
        vim-parinfer
      ];
    };

    viAlias = true;

  };
in
mkShell {


  buildInputs = [
    clojure
    clj2nix
    git
    joker
    leiningen
    nixpkgs-fmt
    neovim-with-config
    python3
  ];

}
