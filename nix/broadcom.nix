{ config, pkgs, ... }:

{
  hardware.enableAllFirmware = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    broadcom_sta
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    # "broadcom-sta-6.30.223.271-57-6.12.50"
    # "broadcom-sta-6.30.223.271-57-6.12.51"
    # "broadcom-sta-6.30.223.271-57-6.12.52"
    # "broadcom-sta-6.30.223.271-57-6.12.53"
    # "broadcom-sta-6.30.223.271-57-6.12.54"
    # "broadcom-sta-6.30.223.271-57-6.12.55"
    # "broadcom-sta-6.30.223.271-57-6.12.56"
    # "broadcom-sta-6.30.223.271-59-6.12.57"
    # "broadcom-sta-6.30.223.271-59-6.12.58"
    # "broadcom-sta-6.30.223.271-59-6.12.59"
    # "broadcom-sta-6.30.223.271-59-6.12.60"
    # "broadcom-sta-6.30.223.271-59-6.12.62"
    "broadcom-sta-6.30.223.271-59-6.12.63"
  ];
}
