{
  description = "Minimal flake for {{ cookiecutter.project_slug }}.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = import nixpkgs {
        system = "x86_64-linux";
      }.mkShell {
        packages = [
          pkgs.pre-commit
          pkgs.poetry
          pkgs.google-cloud-sdk
        ];
      };
    };
}
