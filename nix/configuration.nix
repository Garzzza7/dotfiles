{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ./vim.nix
    ./broadcom.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Belgrade";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
      pantheon.enable = true;
      budgie.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
    };

    windowManager.exwm = {
      enable = true;
      #extraPackages = with pkgs; [];
    };

    displayManager.lightdm = {
      enable = true;
    };

  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.logind.lidSwitchExternalPower = "ignore";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.pc = {
    isNormalUser = true;
    description = "pc";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
    ];
  };

  nixpkgs.overlays = [
    (import (
      builtins.fetchGit {
        url = "https://github.com/nix-community/emacs-overlay.git";
        ref = "master";
        rev = "c3e2ca282d91c806f1c10ae9387c9631241f21f7"; # change the revision
      }
    ))
  ];

  environment.systemPackages = with pkgs; [
    emacs
    neofetch
    htop
    wget
    git
    tree
    gh
    lazygit
    ripgrep
    killall
    onefetch
    mupdf
    zathura
    neovim
    toilet
    xclip
    cmatrix
    firefox
    pciutils
    file
    tmux
    qutebrowser
    bash-completion
    maim
    feh
    pkgs.nixfmt-rfc-style
    termdown
    alsa-utils
    nix-search
    mpv
    imhex
    ghostty
    st
    mypaint
    zip
    unzip
    kdePackages.kolourpaint
    discord
    fd
    redshift
    fastfetch
    kakoune
    obs-studio
    tree-sitter
    fzf
    cloc
    tor

    gparted

    gcc
    ghc
    lua5_1
    mercury
    ocaml
    opam
    pypy3
    racket

    neovide
    dysk
    lua-language-server
    stylua
    btop
    pdfgrep
    gedit
    tor-browser
    kdePackages.kate

    # random editors
    notepadqq
    ad
    amp
    cano
    cudatext
    evil-helix
    evil-helix
    fte
    gnome-text-editor
    helix
    jed
    jedit
    kibi
    lite
    mle
    scite
    textadept
    xed-editor
    xedit
    yudit
    zee
  ];

  programs.vim = {
    defaultEditor = true;
  };

  environment.variables.EDITOR = "vim";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = false; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
