{
  description = "Minimal flake for {{ cookiecutter.project_slug }}.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

    outputs = { nixpkgs, self, ... } @ inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
        perSystem = { system, pkgs, lib, ... }:
        let
            pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in {
            devShells.default =
                pkgs.mkShell rec {
                    buildInputs = with pkgs; [
                        uv
                        python312
                    ];

                    shellHook = ''
                        # Specify settings.env file
                        set -a
                        source .env
                        set +a

                        # Setup pre-commit
                        pre-commit install
                    '';
                };
        };
        flake = { };
        systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    };
}