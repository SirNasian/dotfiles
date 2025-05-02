{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./keyd.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;
	networking.firewall.enable = false;

	time.timeZone = "Australia/Perth";
	i18n.defaultLocale = "en_AU.UTF-8";

	services.libinput.enable = true;

	services.xserver.enable = true;
	services.xserver.displayManager.startx.enable = true;
	services.xserver.windowManager.i3.enable = true;

	services.openssh.enable = true;
	services.openssh.settings.PasswordAuthentication = false;

	services.pipewire.enable = true;
	services.pipewire.pulse.enable = true;

	programs.firefox.enable = true;
	programs.gnupg.agent.enable = true;

	environment.systemPackages = with pkgs; [
		bibata-cursors
		candy-icons
		cava
		chromium
		dunst
		feh
		fzf
		git
		hack-font
		i3lock-color
		kdePackages.breeze-gtk
		kitty
		lxappearance
		neovim
		networkmanagerapplet
		nmap
		noto-fonts
		pass
		pciutils
		picom
		polybar
		pulsemixer
		ripgrep
		rofi
		tree
		usbutils
		xclip
	];

	users.users.nasian = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "24.11"; # Did you read the comment?
}
