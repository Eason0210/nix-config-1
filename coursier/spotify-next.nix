{ coursier-tools }:

let
  version = "1.3.5";
in
coursier-tools.coursierBootstrap {
  name = "spotify-next";
  inherit version;
  artifact = "com.kubukoz:spotify-next_2.13:${version}";
}