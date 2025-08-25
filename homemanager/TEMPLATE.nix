{ config, pkgs, lib, ... }:

{

  users.users.frobozz = {
    packages = with pkgs; [


    ];
  };

}
