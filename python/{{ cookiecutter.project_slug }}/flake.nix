{
  description = "Minimal flake for {{ cookiecutter.project_slug }}.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
    devShells.default = import nixpkgs {
      system = "x86_64-linux";
      config = {};
    }.mkShell {
      packages = [
        nixpkgs.pre-commit
        nixpkgs.poetry
        nixpkgs.google-cloud-sdk
      ];
    };
  };
}
