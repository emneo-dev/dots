{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/3e8a24ba-0b3d-46f4-90d9-b24659119af6";
      preLVM = true;
    };
  };

  hardware.amdgpu.opencl.enable = true;
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Logitech G502 Lightspeed]
    MatchUdevType=mouse
    MatchName=*G502*
    AttrEventCode=-REL_WHEEL_HI_RES;-REL_HWHEEL_HI_RES
  '';

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ anthy ];
  };

  environment.systemPackages = [ pkgs.libinput pkgs.gtk3 ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  services = {
    fwupd.enable = true;
    mullvad-vpn.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  users.users = {
    emneo = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "docker" "libvirtd" "input" ];
      initialPassword = "kanker";
      packages = with pkgs; [
        tree
        vim
        htop
        curl
        git
        man-pages
        man-pages-posix
      ];
    };

    sev = {
      isNormalUser = true;
      initialPassword = "kanker";
      packages = with pkgs; [
        uv
        b3sum
        rar
        rclone
        aria2
        apprise
        croc
        tmux
        jq
        btop
        htop
        ncdu
        sabnzbd
        bc
        openssl
        tinyxxd
        mediainfo
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHKpgVYo7LkLjbaKhyEDRnsZhMu2NcIrMlkeqC1G0l/"
      ];
    };
  };


  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;

  time.timeZone = "Europe/Paris";
  networking.hostName = "tachyon";

  documentation.dev.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;
  services.sshd.enable = true;

  networking.hosts = {
    "192.168.100.193" = [ "kbox.local" "traefik.kbox.local" "longhorn.kbox.local" "whoami.kbox.local" ];
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  services.pipewire.extraConfig.pipewire."99-voice-changer-sink" = {
    "context.objects" = [
      {
        factory = "adapter";
        args = {
          "factory.name" = "support.null-audio-sink";
          "node.name" = "VoiceChangerSink";
          "node.description" = "Voice Changer Virtual Sink";
          "media.class" = "Audio/Sink";
          "audio.channels" = 2;
          "audio.position" = [ "FL" "FR" ];
        };
      }
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.virt-manager.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "25.11";
}

