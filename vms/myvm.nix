# myvm.nix
{ config, ... }:

{
  imports = [ ./disko.nix ];

  networking.hostName = "myvm";

  virtualisation.proxmox = {
    node = "myproxmoxnode";
    iso = <derivation for your iso>;
    vmid = 101;
    memory = 4096;
    cores = 4;
    sockets = 2;
    net = [
      {
        model = "virtio";
        bridge = "vmbr0";
      }
    ];
    scsi = [ { file = "local:16"; } ]; # This will create a 16GB volume in 'local'
  };
}
