{
  inputs = { };

  outputs = {nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.gleam
        pkgs.erlang_27
        pkgs.rebar3
        pkgs.inotify-tools
        pkgs.watchexec
        pkgs.just
      ];
    };
  };
}
