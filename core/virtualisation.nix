{
  virtualisation = {
    docker.enable = true;
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
        # enableHardening = false;
      };
      # guest = {
      #   enable = true;
      #   dragAndDrop = true;
      # };
    };
  };
}
