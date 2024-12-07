{
  description = "A flake with Proxmox VE enabled";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
  };
    outputs = { self, nixpkgs, proxmox-nixos, ...}: 
  let 
    system = "x86_64-linux";
  in {
      nixosConfigurations = rec {
        inherit system;
        proxmox = nixpkgs.lib.nixosSystem {
          modules = [
            ./hardware-configuration.nix
            proxmox-nixos.nixosModules.proxmox-ve
            ({ pkgs, lib, ... }: { 
              nixpkgs.overlays = [ 
                proxmox-nixos.overlays.${system} 
              ]; 
            })
            
            ./proxmox.nix
            ./configuration.nix
          ];
        };
      };
    };
}
