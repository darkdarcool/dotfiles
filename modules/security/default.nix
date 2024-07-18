{ ... }:

{
  config = {
    security.sudo.extraRules = [{
      users = [ "darkdarcool" ];
      commands = [{
        command = "ALL";
        options = [
          "NOPASSWD"
          "SETENV"
        ]; # "SETENV" # Adding the following could be a good idea
      }];
    }];
  };
}
