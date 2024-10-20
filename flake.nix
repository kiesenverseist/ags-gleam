{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        # gleam & deps
        pkgs.gleam
        pkgs.erlang_27
        pkgs.rebar3

        # build & util
        pkgs.inotify-tools
        pkgs.watchexec
        pkgs.just

        # ags stuff
        pkgs.ags
      ];
    };
  };
}
