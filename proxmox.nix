{ config, system, lib, pkgs, proxmox-nixos, modulesPath, ... }:
{

networking.bridges.vmbr0.interfaces = [ "enp5s0" ];
networking.interfaces.enp5s0.useDHCP = false;
networking.interfaces.vmbr0 = {
  useDHCP = false;
  ipv4.addresses = [ 
    { address = "192.168.1.3"; prefixLength = 24; }
  ];
};

networking.defaultGateway = { 
  address = "192.168.1.1";
  interface = "vmbr0";
};

  services.proxmox-ve = {
    enable = true;
    vms = {
      virt-box-1 = {
        vmid = 101;
        memory = 4096;
        cores = 4;
        sockets = 2;
        scsi = [ { file = "local:2048"; } ];
        net = [
          {
            model = "virtio";
            bridge = "vmbr0";
          }
        ];
      };
      virt-box-2 = {
        vmid = 102;
        memory = 4096;
        cores = 4;
        sockets = 2;
        scsi = [ { file = "local:2048"; } ];
        net = [
          {
            model = "virtio";
            bridge = "vmbr0";
          }
        ];
      };
      virt-box-3 = {
        vmid = 103;
        memory = 4096;
        cores = 4;
        sockets = 2;
        scsi = [ { file = "local:2048"; } ];
        net = [
          {
            model = "virtio";
            bridge = "vmbr0";
          }
        ];
      };
      virt-box-4 = {
        vmid = 104;
        memory = 4096;
        cores = 4;
      # sockets = 2;
        scsi = [ { file = "local:2048"; } ];
        net = [
          {
            model = "virtio";
            bridge = "vmbr0";
          }
        ];
      };
      virt-box-5 = {
        vmid = 105;
        memory = 4096;
        cores = 4;
      # sockets = 2;
        scsi = [ { file = "local:2048"; } ];
        net = [
          {
            model = "virtio";
            bridge = "vmbr0";
          }
        ];
      };
    };
  };
}
