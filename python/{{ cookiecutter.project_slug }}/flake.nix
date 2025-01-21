{
  description = "Minimal flake for {{ cookiecutter.project_slug }}.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.mkShell {
        packages = [
          pkgs.pre-commit
          pkgs.poetry
          pkgs.google-cloud-sdk
        ];
      };
      default = self.devShells.x86_64-linux;
    };
  };
}
