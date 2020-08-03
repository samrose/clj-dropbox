{ pkgs ? import ./pkgs.nix { } }:
let
  clj2nix = pkgs.callPackage
    (pkgs.fetchFromGitHub {
      owner = "hlolli";
      repo = "clj2nix";
      rev = "3ab3480a25e850b35d1f532a5e4e7b3202232383";
      sha256 = "1lry026mlpxp1j563qs13nhxf37i2zpl7lh0lgfdwc44afybqka6";
    }) { };
  cljdeps = pkgs.callPackage ./deps.nix { };
  classp = cljdeps.makeClasspaths { };
  execName = "dbx";

in
pkgs.stdenv.mkDerivation {
  name = execName;

  nativeBuildInputs = [ clj2nix pkgs.jre pkgs.makeWrapper pkgs.clojure pkgs.nix-bundle ];

  buildInputs = map (x: x.path) cljdeps.packages;

  src = ./src;

  phases = [ "unpackPhase" "installPhase" ];


  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/clojure
    cp clj_dropbox/core.clj $out/share/clojure/core.clj
    makeWrapper ${pkgs.jre}/bin/java $out/bin/${execName} \
      --add-flags "-cp ${classp}:${pkgs.clojure}/libexec/* clojure.main $out/share/clojure/core.clj"
  '';
}
