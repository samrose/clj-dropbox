# generated by clj2nix-1.0.4
{ pkgs ? import <nixpkgs> {} }:
  
  let repos = [
        "https://repo.clojars.org/"
        "https://repo1.maven.org/"
        "http://central.maven.org/maven2/"
        "http://oss.sonatype.org/content/repositories/releases/"
        "http://oss.sonatype.org/content/repositories/public/"
        "http://repo.typesafe.com/typesafe/releases/"
      ];

  in rec {
      makePaths = {extraClasspaths ? []}: (builtins.map (dep: if builtins.hasAttr "jar" dep.path then dep.path.jar else dep.path) packages) ++ extraClasspaths;
      makeClasspaths = {extraClasspaths ? []}: builtins.concatStringsSep ":" (makePaths {inherit extraClasspaths;});

      packages = [
  {
    name = "org.clojure/clojure";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "clojure";
      groupId = "org.clojure";
      sha512 = "bab9deab02b1a6d37c1ea83d347923a9d3a1340921d32f2e20410b2bcc1d8843f0a43caee6fc412db9edcc617479c9910c5659585cb5570834ef8f4e250e2f16";
      version = "1.5.1";
    };
  }

  {
    name = "joda-time/joda-time";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "joda-time";
      groupId = "joda-time";
      sha512 = "bca589aa4c3ddffa5570923e3e016b282775282e7d1f6dc607b38d74a824bfe44303c02d1cc2bfba3f6611559a84e1d248254dc53b572d09b04c38561ba52e17";
      version = "2.3";
    };
  }

  {
    name = "commons-codec/commons-codec";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "commons-codec";
      groupId = "commons-codec";
      sha512 = "b65531ead8500493e3dd14a860224851b80f438fc53bf8868b443a0557d839a2b0c868e4fedcf99579ae04b6b2bbd8cdb37f9921ad785983c37569aa9d2e8102";
      version = "1.9";
    };
  }

  {
    name = "org.clojure/tools.cli";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "tools.cli";
      groupId = "org.clojure";
      sha512 = "55d8ed3400c80636f5b57140172f9969b8578af8eae6f6908b02bf1d0529c322097db120c5124528fb8e60d1055c29a0968e37b7e808df489a8318019c32abaa";
      version = "0.3.1";
    };
  }

  {
    name = "clj-time";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "clj-time";
      groupId = "clj-time";
      sha512 = "d4df46c71e791f37687403ec7fa7e9327a258cdc2e6c47a50183739a881f47a151723ca2f232931b64c927d2f3344cfa18d42ef1bb2437c3cca11c4a73e3da29";
      version = "0.7.0";
    };
  }

  {
    name = "slingshot/slingshot";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "slingshot";
      groupId = "slingshot";
      sha512 = "b3197df8e7353d52aa22534a5fa0283ae95f3e8838fad4420c8d5265f8cbd7b9b7daf90ccf7c0b0317fac50075f4e8e5e1b6ffad04d8f6334e959f3d591d7569";
      version = "0.10.3";
    };
  }

  {
    name = "commons-io/commons-io";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "commons-io";
      groupId = "commons-io";
      sha512 = "957a438894a196e534af9ae1e61fb21e16f273952b55a81abb8faf0b139fc031ea940cf477f81704db417d1ce6ff2d9ddd4a2cbf316903b0e2dc1aeaef24f292";
      version = "2.4";
    };
  }

  {
    name = "com.fasterxml.jackson.core/jackson-core";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "jackson-core";
      groupId = "com.fasterxml.jackson.core";
      sha512 = "894f484aedfe610ba476c75be25bd6a40a5d953889e64f79fea135a9a7b6e6702da631229e8848e177c55ed3060b7fc28fae061e66438c3b57993b3d658ce51c";
      version = "2.3.1";
    };
  }

  {
    name = "cheshire";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "cheshire";
      groupId = "cheshire";
      sha512 = "c5aba421f28168ef08d249d328cf3f8a842f824f1257babcb69cc709c9baddddf1ee3c3e1060dbc81d9fe21ce924ad81dc4abeed60e26bad0fd984b9b26ea2dd";
      version = "5.3.1";
    };
  }

  {
    name = "org.apache.httpcomponents/httpcore";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "httpcore";
      groupId = "org.apache.httpcomponents";
      sha512 = "e2b26b256af812a6c142bf03c827adea145fb5f30084cd2acc7235b9ae8bee5f08afcdf975318f6ae8e1c2c1f6b7edf9426d61eb1812cc5debc24f7b1b92ee61";
      version = "4.3.2";
    };
  }

  {
    name = "clj-tuple/clj-tuple";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "clj-tuple";
      groupId = "clj-tuple";
      sha512 = "ca750fcec3abdfb5fcbc32bc389dc073023a69050a79245e0f72e93af9658e34815f29bec23e55d6dbbbbe78adef83bac9c92ac5f42ec190efcc2447563d9662";
      version = "0.1.2";
    };
  }

  {
    name = "crouton/crouton";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "crouton";
      groupId = "crouton";
      sha512 = "67d8712a024cd5dd5f3e576e73dc69a15dbd75c760c172af6331a3be8947d65bdcfd5f30b818ac2f98ef7de50f93399afff1a4b98f6d02c0c0abb2adcab3c051";
      version = "0.1.1";
    };
  }

  {
    name = "riddley/riddley";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "riddley";
      groupId = "riddley";
      sha512 = "a187aec35c73371aa3a2edc2b034951c95a7c2f51f5c5d179e6315c7ce01188c81a6df3a5f69f2d89dbc58c13539ea59f17d9dd7e76e7ee136605468c45893d5";
      version = "0.1.6";
    };
  }

  {
    name = "commons-logging/commons-logging";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "commons-logging";
      groupId = "commons-logging";
      sha512 = "e5d1fc8ec4544e1fa0f7c4aae8dbcca466c4987bc92fbbc430b054b10d646b745add4a754b1be9d50edd64330c798c53173a97289db57a966312e16f934e9d1f";
      version = "1.1.3";
    };
  }

  {
    name = "org.apache.httpcomponents/httpclient";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "httpclient";
      groupId = "org.apache.httpcomponents";
      sha512 = "62102c0463c93c18148cf188907841a1b95a548be9ba0398a50b4ebe275aeb77fc8dcab65694c5eda18378470f62b8792c8769ba55d6bd34bc1bb600e8563c42";
      version = "4.3.2";
    };
  }

  {
    name = "cheshire/cheshire";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "cheshire";
      groupId = "cheshire";
      sha512 = "c5aba421f28168ef08d249d328cf3f8a842f824f1257babcb69cc709c9baddddf1ee3c3e1060dbc81d9fe21ce924ad81dc4abeed60e26bad0fd984b9b26ea2dd";
      version = "5.3.1";
    };
  }

  {
    name = "tigris/tigris";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "tigris";
      groupId = "tigris";
      sha512 = "5393fe3f656521a6760d289d9549ffb9e9c1a8a72b69878205d53763802afa8778f1cb8bed6899e0b9721de231a79b8b1254cc601c84f5374467f1cc4780a987";
      version = "0.1.1";
    };
  }

  {
    name = "org.clojure/tools.reader";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "tools.reader";
      groupId = "org.clojure";
      sha512 = "0cd84fed9402d1665035f423a3f215a695795656edcb5ead99b8e3223c3e66a9a4aa0946c856907bf0ae5e430a49873042c7f56408a1923918665048f2130b47";
      version = "0.8.3";
    };
  }

  {
    name = "org.jsoup/jsoup";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "jsoup";
      groupId = "org.jsoup";
      sha512 = "85208c3fbb443bcc6992255e25ddff5e2feb81b7c72eb023e8e63654b656238853c1492057f7138c1599a92fe7258f08a2b92b188ffa5087b5ed58e52298a2c2";
      version = "1.7.1";
    };
  }

  {
    name = "clj-http";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "clj-http";
      groupId = "clj-http";
      sha512 = "fcd1487ead3286b1a052590fb5fbe394dbb67681d5414c7adcc8385b07a6fba6d29a5b49c4466e459fe797044be9324df2022304abde0cb1915d303c88b05f5f";
      version = "0.9.1";
    };
  }

  {
    name = "potemkin/potemkin";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "potemkin";
      groupId = "potemkin";
      sha512 = "1dcb5002ad78c60dedd1f00d091c849aa5e692dc6a907a50258b25a6e12187da91ae20484d093fa370f0de9318cbb618efce8de45cd63dc4a6f4a09c10a0ca35";
      version = "0.3.4";
    };
  }

  {
    name = "org.apache.httpcomponents/httpmime";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "httpmime";
      groupId = "org.apache.httpcomponents";
      sha512 = "70438894c9c84e491143d7f2fc6fb5c5975bae6e68526e3cb7c23a159d3fe0f393bb4aadad29bfa15bea71cab7ba78f05b4004b0ccc9f0fab909e7d129e6001a";
      version = "4.3.2";
    };
  }

  {
    name = "com.fasterxml.jackson.dataformat/jackson-dataformat-smile";
    path = pkgs.fetchMavenArtifact {
      inherit repos;
      artifactId = "jackson-dataformat-smile";
      groupId = "com.fasterxml.jackson.dataformat";
      sha512 = "042e8ce84fdc5fbc0713a5cd5bd69ffb70409a56570c0d0fe7ed8a49052923e3e71eb04e83ae56f4fdd748325ab5b18e062d865ff7ca689e4af320b111013f06";
      version = "2.3.1";
    };
  }

  ];
  }
  