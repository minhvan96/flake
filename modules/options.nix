{ lib, ... }:

{
  options = {
    username = lib.mkOption {
      type = lib.types.singleLineStr;
      readOnly = true;
      default = "nmv";
    };

    hostName = lib.mkOption {
      type = lib.types.singleLineStr;
      readOnly = true;
      default = "nixos-desktop";
    };

    stateVersion = lib.mkOption {
      type = lib.types.singleLineStr;
      readOnly = true;
      default = "25.11";
    };
  };
}
