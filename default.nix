{ pkgs ? import ./pkgs.nix {} }:
let
  clj2nix = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "hlolli";
    repo = "clj2nix";
    rev = "de55ca72391bdadcdcbdf40337425d94e55162cb";
    sha256 = "0bsq0b0plh6957zy9gl2g6hq8nhjkln4sn9lgf3yqbwz8i1z5a4a";
  }) {};
  cljdeps = pkgs.callPackage ./deps.nix { };
  classp = cljdeps.makeClasspaths { };
  execName = "dbx";

in pkgs.stdenv.mkDerivation {
  name = execName;

  nativeBuildInputs = [ clj2nix pkgs.jdk pkgs.makeWrapper pkgs.clojure pkgs.nix-bundle ];

  buildInputs = map (x: x.path) cljdeps.packages;

  src = ./src;

  phases = [ "unpackPhase" "installPhase" ];


  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/clojure
    cp clj_dropbox/core.clj $out/share/clojure/core.clj
    makeWrapper ${pkgs.jdk}/bin/java $out/bin/${execName} \
      --add-flags "-cp ${classp}:${pkgs.clojure}/libexec/* clojure.main $out/share/clojure/core.clj"
  '';
}
