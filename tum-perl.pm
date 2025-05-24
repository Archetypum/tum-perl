#!/usr/bin/perl
#
# Copyright (C) 2025 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

use strict;
use warnings;
eval { require Term::ANSIColor; Term::ANSIColor->import('color'); }; if ($@) { print "[!] Import: Can't import: $@"; exit; }

#
# Supported package managers list:
#

our @SUPPORTED_PMS = (
    "apt",                   # <https://wiki.debian.org/Apt>
    "aptitude",              # <https://wiki.debian.org/Aptitude>
    "apk",                   # <https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper>
    "dnf",                   # <https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html-single/managing_software_with_the_dnf_tool/index>
    "dpkg",                  # <https://wiki.debian.org/dpkg>
    "guix",                  # <https://guix.gnu.org/manual/en/html_node/Package-Management.html>
    "pkg",                   # <https://man.freebsd.org/cgi/man.cgi?pkg>
    "pkgin",                 # <https://pkgin.net/>
    "pkg_add",               # <https://man.openbsd.org/pkg_add>
    "pacman",                # <https://wiki.archlinux.org/title/Pacman>
    "portage",               # <https://wiki.gentoo.org/wiki/Portage>
    "qi",                    # <https://dragora.org/handbook/dragora-handbook.html#Introduction-to-Qi>
    "slackpkg",              # <https://slackpkg.org/documentation.html>
    "xbps",                  # <https://docs.voidlinux.org/xbps/index.html>
    "yum",                   # <https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/deployment_guide/ch-yum>
    "zypper"                 # <https://documentation.suse.com/smart/systems-management/html/concept-zypper/index.html>
);

#
# Supported initialization systems list:
# 

our @SUPPORTED_INITS = (
    "sysvinit",              # <https://wiki.gentoo.org/wiki/Sysvinit>
    "openrc",                # <https://wiki.gentoo.org/wiki/OpenRC>
    "s6",                    # <https://skarnet.org/software/s6/>
    "runit",                 # <https://smarden.org/runit/>
    "systemd"                # <https://systemd.io/>
);

#
# Supported operating systems list:
#

##
## GNU/Linux operating systems:
##

our @DEBIAN_BASED = (
    # The universal operating system.
    # <https://www.debian.org/>
    
    "debian", "ubuntu", "xubuntu", "linuxmint", "lmde", "trisquel", "devuan", "kali", "parrotos", "popos", "elementaryos",
    "mx", "antix", "crunchbag", "crunchbag++", "pureos", "deepin", "zorinos", "peppermintos", "lubuntu", "kubuntu", "wubuntu",
    "astra", "tailsos", "ututos", "ulteo", "aptosid", "canaima", "corel", "dreamlinux", "elive", "finnix", "gibraltar",
    "gnulinex", "kanotix", "kurumin", "linspire", "maemo", "mepis", "vyatta", "solusos", "openzaurus", "cutefishos", "knoppix",
    "siduction", "psychos", "neptune", "doglinux", "armbian", "droidian", "mobian", "grml"
);

our @ARCH_BASED = (
    # A simple, lightweight distribution.
    # <https://www.archlinux.org/>

    "arch", "artix", "manjaro", "endeavouros", "garuda", "parabola", "hyperbola", "archbang", "blackarch", "librewolf", "archlabs",
    "chakra", "archex", "archman", "arco", "bluestar", "chimeraos", "instantos", "kaos", "rebornos", "archhurd", "cyberos", "archcraft",
    "cachyos", "ctlos", "crystallinux", "msys2", "obarun", "parchlinux", "snal" , "steamos3", "tearchlinux", "uboslinux" 
);

our @ALPINE_BASED = (
    # Small. Simple. Secure.
    # <https://www.alpinelinux.org/>

    "alpine", "postmarket"
);

our @GENTOO_BASED = (
    # Welcome to Gentoo, a highly flexible, source-based Linux distribution.
    # <https://www.gentoo.org/>
    
    "gentoo", "argent", "pentoo", "funtoo", "calculatelinux", "chromeosflex", "vidalinux", "knopperdisk", "gentoox", "sabayon", "chromiumos",
    "tinhatlinux", "ututo", "exgent", "flatcarlinux", "gentooplayer", "decibel". "liguros", "macaronilinux", "moccacinoos", "xenialinux", "redcorelinux",
    "porteusklosk"
);

our @VOID_BASED = (
    # Void is a general purpose operating system, based on the monolithic Linux kernel.
    # <https://www.voidlinux.org/>

    "void", "argon", "shikake", "pristine", "projecttrident"
);

our @DRAGORA_BASED = (
    # Stable. Secure. Reliable.
    # <https://www.dragora.org/>

    "dragora"
);

our @SLACKWARE_BASED = (
    # The Slackware Linux Project.
    # <http://www.slackware.com/>

    "slackware", "salixos", "simplelinux", "basiclinux", "frugalware", "austrumi", "hostgis", "kateos", "mulinux", "porteus", "absolutelinux",
    "nimblex", "platypux", "slackintosh", "slax", "supergamer", "topologilinux", "vectorlinux", "wolvix", "zenwalk", "zipslack", "slackopuppy",
    "slackel", "wifislax", "plamolinux", "slamd64"
);

our @REDHAT_BASED = (
    # Red Hat is the leading provider of enterprise open source software solutions.
    # <https://www.redhat.com/>

    "rhel", "fedora", "mos", "rocky", "centos", "opensuse", "almalinux", "oraclelinux", "circlelinux", "clearos", "euleros"
);

our @GUIX_BASED = (
    # A complete GNU operating system harnessing all the capabilities of the Guix software. Spawned bu Guix itself.
    # <https://guix.gnu.org/>

    "guix"
);

##
## BSD UNIX operating systems:
##

our @FREEBSD_BASED = (
    # FreeBSD is an operating system user to power modern servers, desktops, and embedded platforms.
    # <https://www.freebsd.org/>

    "freebsd", "midnightbsd", "ghostbsd", "bastillebsd", "cheribsd", "dragonflybsd", "trueos", "hardenedbsd", "hellosystem", "picobsd", "nanobsd",
    "truenas", "nomadbsd", "clonos", "junosos", "xigmanas", "opnsense", "pfsense", "cellos", "orbisos", "zrouter", "ulbsd", "ravynos", "freenas", "fireflybsd"
);

our @OPENBSD_BASED = (
    # Only two remote holes in the default install, in a heck of a long time!
    # <https://www.openbsd.org/>
    
    "openbsd", "adj", "libertybsd", "bitrig", "bowlfish", "ekkobsd", "embsd", "fabbsd", "fugulta", "marbsd", "microbsd", "commixwall", "bsdanywhere",
    "mirosbsd", "olivebsd", "psygnat", "quetzal", "sonafr", "hyperbolabsd", "aeriebsd", "anonymos", "utmfw", "fabbsd" 
);

our @NETBSD_BASED = (
    # NetBSD is a free, fast, secure, and highly portable Unix-like Open Source operating system.
    # <https://www.netbsd.org/>
    
    "netbsd", "blackbsd", "edgebsd", "seos", "os108", "jibbed", "fdgw". "g4u", "irbsd", "smolbsd"
);

#
# Miscellaneous functions:
#

sub the_unix_manager_version
{
    # Returns current hardcoded tum-perl version.
    #
	# Returns:
    #     tum-perl version.
	
	my $VERSION = "v0.0.1-testing";
	
	print "$VERSION";
}

sub clear_screen
{
    # Clears the terminal screen.
    #
    # Returns:
    #     Nothing: [null].
    #
    # Example:
    #     clear_screen();
    
    my $clear_command = "clear";

    system($clear_command);
}


sub prompt_user
{
    # Prompts the user for input and returns True for 'y/yes' or False for 'n/no'.
    # Allows for a default value to be used if the user presses Enter without typing.
    #
    # Args:
    #       $prompt (str): The prompt message to display to the user.
    #       $default (str): The default value ('Y' or 'N') to assume if the user just presses Enter.
    #
    # Returns:
    #       bool: 1 for 'y', 'ye', 'yes' (case-insensitive); 0 for 'n', 'no' (case-insensitive).

    my ($prompt, $default) = @_;
    $default ||= 'N';

    print "$prompt (y/n): ";
    chomp(my $user_input = <STDIN>);

    $user_input =~ s/^\s+|\s+$//g;
    $user_input = lc($user_input);
    $user_input = lc($default) if !$user_input;
    if ($user_input =~ /^(y|ye|yes)$/)
    {
        return 1;
    } 
    elsif ($user_input =~ /^(n|no)$/)
    {
        return 0;
    }

    return 0;
}

sub check_privileges
{
    # Checks if the script is being run with root privileges.
    #
    # This function compares the current user's UID to 0 (root).
    # If the script is run by a non-root user, it prints an error
    # message and exits with a status code of 1.
    #
    # Returns:
    #     Nothing. [null].
    #
    # Example:
    #     check_privileges();
    
    my $uid = $<;

    if ($uid == 0)
    {
        return;
    } 
    else 
    {
        print color('red'), "[!] Error: This script requires root privileges to work.", color('reset'), "\n";
        exit 1;
    }
}

sub tum_perl_tester
{
    # Runs a series of tests for tum-perl.
    #
    # This function clears the screen, prompts the user to proceed with
    #
    # Returns:
    #     Nothing: [null].
    #
    # Example:
    #     tum_perl_tester();
    
    clear_screen();

    if (prompt_user("Proceed to tests?"))
    {
        check_privileges();
        print "[*] TheUnixManager version: ";
        print the_unix_manager_version();
    }
}

#
# UNIX distribution checkers:
#

sub is_debian_based
{
    # Checks if the given distribution is Debian-based.
    #
    # This function takes a distribution name (e.g., Mint, Kali) and
    # compares it against a list of known Debian-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @debian_list (array): A list of known Debian-based distributions.
    #
    # Returns:
    #     1 if the distribution is Debian-based, 0 otherwise.
    #
    # Example:
    #     my $is_debian = is_debian_based("Ubuntu", @DEBIAN_BASED);
    #     print "Debian-based: $is_debian\n";
    
    my ($distro, @debian_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@debian_list) 
    {
        if ($distro eq $base_distro)
        {
            return 1;
        }
    }
    
    return 0;
}


sub is_arch_based
{
    # Checks if the given distribution is Arch-based.
    #
    # This function takes a distribution name (e.g., Artix, Hyperbola) and
    # compares it against a list of known Arch-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @arch_list (array): A list of known Arch-based distributions.
    #
    # Returns:
    #     1 if the distribution is Arch-based, 0 otherwise.
    #
    # Example:
    #     my $is_arch = is_arch_based("Manjaro", @ARCH_BASED);
    #     print "Arch-based: $is_arch\n";
    
    my ($distro, @arch_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@arch_list) 
    {
        if ($distro eq $base_distro)
        {
            return 1;
        }
    }
    
    return 0;
}


sub is_alpine_based
{
    # Checks if the given distribution is Alpine-based.
    #
    # This function takes a distribution name (e.g., Alpine, postmarketOS) and
    # compares it against a list of known Alpine-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @alpine_list (array): A list of known Alpine-based distributions.
    #
    # Returns:
    #     1 if the distribution is Alpine-based, 0 otherwise.
    #
    # Example:
    #     my $is_alpine = is_alpine_based("Alpine", @ALPINE_BASED);
    #     print "Alpine-based: $is_alpine\n";
    
    my ($distro, @alpine_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@alpine_list) 
    {
        if ($distro eq $base_distro)
        {
            return 1;
        }
    }
    
    return 0;
}


sub is_gentoo_based
{
	# Checks if the given distribution is Gentoo-based.
    #
    # This function takes a distribution name (e.g., Pentoo, Calculate) and
    # compares it against a list of known Gentoo-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @gentoo_list (array): A list of known Gentoo-based distributions.
    #
    # Returns:
    #     1 if the distribution is Gentoo-based, 0 otherwise.
    #
    # Example:
    #     my $is_gentoo = is_gentoo_based("ChromeOS", @GENTOO_BASED);
    #     print "Gentoo-based: $is_gentoo\n";
    
    my ($distro, @gentoo_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@gentoo_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_void_based
{
	# TODO: Write good documentation.
    
    my ($distro, @void_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@void_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_dragora_based
{
	# TODO: Write good documentation.
    
    my ($distro, @dragora_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@dragora_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_slackware_based
{
	# TODO: Write good documentation.
    
    my ($distro, @slackware_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@slackware_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_redhat_based
{
	# TODO: Write good documentation.
    
    my ($distro, @redhat_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@redhat_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_guix_based
{
	# TODO: Write good documentation.
    
    my ($distro, @guix_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@guix_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_freebsd_based
{
	# TODO: Write good documentation.
    
    my ($distro, @freebsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@freebsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_openbsd_based
{
	# TODO: Write good documentation.
    
    my ($distro, @openbsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@openbsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub is_netbsd_based
{
	# TODO: Write good documentation.
    
    my ($distro, @netbsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@netbsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

#
# System information gathering:
#

sub get_user_distro
{
    # Retrieves the distribution name of the current system.
    #
    # This function attempts to detect the GNU/Linux distribution name by reading
    # the `/etc/os-release` file, which typically contains the `ID` field representing
    # the distribution. If the `ID` field is found, the function returns the distribution name.
    # If the file cannot be read or the `ID` field is not found, it prompts the user to manually
    # input the distribution name and returns the user's input.
    #
    # Returns:
    #     A string representing the distribution name (either from `/etc/os-release`
    #     or from user input if the file is unavailable).
    #
    # Example:
    #     my $distro = get_user_distro();
    #     print "Detected distro: $distro\n";
    
    my $distro;
    
    if (-f '/etc/os-release')
    {
        open my $fh, '<', '/etc/os-release' or die "[!] Error: Could not open /etc/os-release: $!\n";
        
        while (my $line = <$fh>)
        {
            chomp $line;
            if ($line =~ /^ID=(\S+)/)
            {
                $distro = $1;
                last;
            }
        }
        
        close $fh;
        
        return $distro if defined $distro;
    }

    print color('red'), "[!] Error: Cannot detect distribution from /etc/os-release.", color('reset'), "\n";
    print "[==>] Write your OS name yourself: ";
    chomp($distro = <STDIN>);
    
    return $distro;
}


sub get_init_system
{
    # Detects the init system used by the current Linux distribution.
    #
    # This function checks for the presence of specific directories and processes
    # to determine which init system is in use on the current system. It checks for
    # systemd, OpenRC, SysVinit, s6, and runit init systems, in that order. If none
    # of these systems are detected, it returns "unknown".
    #
    # Returns:
    #     A string representing the init system in use:
    #     - "systemd"   if systemd is detected.
    #     - "openrc"    if OpenRC is detected.
    #     - "sysvinit"  if SysVinit is detected.
    #     - "s6"        if s6 is detected.
    #     - "runit"     if runit is detected.
    #     - "unknown"   if no known init system is detected.
    #
    # Example:
    #     my $init_system = get_init_system();
    #     print "Init system: $init_system\n";
    
    if (-d '/run/systemd/system' || `ps -p 1 -o comm=` =~ /systemd/)
    {
        return "systemd";
    }

    if (-d '/etc/init.d' && -d '/etc/init.d/openrc')
    {
        return "openrc";
    }
    
    if (-d '/etc/init.d')
    {
        return "sysvinit";
    }

    if (-d '/etc/s6')
    {
        return "s6";
    }

    if (-d '/etc/runit')
    {
        return "runit";
    }

    return "unknown";
}


sub get_preferred_editor
{
    # Prompts the user for their preferred text editor.
    #
    # This function prompts the user to enter the name of their preferred text editor
    # (e.g., vim, nano, emacs) and then returns the inputted value.
    #
    # Returns:
    #     A string representing the name of the user's preferred text editor.
    #
    # Example:
    #     my $editor = get_preferred_editor();
    #     print "Preferred editor: $editor\n";
    
    my $text_editor;
    
    print "[==>] Enter your preferred text editor: ";
    chomp($text_editor = <STDIN>);
    
    return $text_editor;
}


sub get_superuser_command
{
    # Detects the superuser command (e.g., sudo or doas).
    #
    # This function checks if the system has `sudo` or `doas` available to run commands with superuser privileges.
    # It first checks for the existence of `sudo`, and if it’s not found, it checks for `doas`. 
    # If neither of these commands is available, an error message is printed and the function returns nothing.
    #
    # Returns:
    #     - "sudo" if `sudo` is available on the system.
    #     - "doas" if `doas` is available on the system and `sudo` is not.
    #     - `undef` (nothing) if neither `sudo` nor `doas` is found.
    #
    # Example:
    #     my $superuser_cmd = get_superuser_command();
    #     print "Superuser command: $superuser_cmd\n";  # Output: Superuser command: sudo (or doas)
    
    my $superuser_command;
    
    if (system('command -v sudo > /dev/null 2>&1') == 0)
    {
        return "sudo";
    }
    if (system('command -v doas > /dev/null 2>&1') == 0)
    {
        return "doas";
    }

    print color('red'), "[!] Error: Neither sudo nor doas available.", color('reset'), "\n";
    return;
}


#
# Initialization system handling classes:
#

##
## SysVInit Management:
##
## Functions for managing services using SysVInit.
##
## Next functions are providing methods to perform basic operations on services,
## such as starting, stopping, reloading, and checking the status. It uses the
## 'service' utility to manage services and handles errors that occur during
## command execution.
##

sub _run_service_sysvinit
{
    my ($action, $service) = @_;
    
    my $sysvinit_command = $service ? "service $service $action" : "service $action";
    my $sysvinit_output = `$sysvinit_command 2>&1`;
    my $sysvinit_result = $? >> 8;
    
    if ($sysvinit_result == 0)
    {
        print color('green'), "[*] Success!", color('reset'), "\n";
        print color('yellow'), "[*] Output:\n", color('reset'), $sysvinit_output, "\n";
        return 0;
    } 
    else
    {
        print color('red'), "[!] Error: service $service $action failed.", color('reset'), "\n";
        print color('red'), "[!] Error Message:\n", color('reset'), $sysvinit_output, "\n";
        return 1;
    }
}

sub start_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('start', $service);
}

sub stop_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('stop', $service);
}

sub reload_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('reload', $service);
}

sub force_reload_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('force-reload', $service);
}

sub restart_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('restart', $service);
}

sub try_restart_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('try-restart', $service);
}

sub status_service_sysvinit
{
    my ($service) = @_;
    return _run_service_sysvinit('status', $service);
}

sub status_all_service_sysvinit
{
    my $sysvinit_status_all_command = "service --status-all";
    my $sysvinit_status_all_output = `$sysvinit_status_all_command 2>&1`;
    my $sysvinit_status_all_result = $? >> 8;

    if ($sysvinit_status_all_result == 0)
    {
        print color('green'), "[*] Success!", color('reset'), "\n";
        print color('green'), "[...] Output:\n", color('reset'), $sysvinit_status_all_output;
        print color('green'), "[*] End of output!", color('reset'), "\n";
        return 0;
    } 
    else
    {
        print color('red'), "[!] Error: service --status-all failed.", color('reset'), "\n";
        return 1;
    }
}

sub full_restart_service_sysvinit
{
    my $sysvinit_full_restart_command = "service --full-restart";
    my $sysvinit_full_restart_output = `$sysvinit_full_restart_command 2>&1`;
    my $sysvinit_full_restart_result = $? >> 8;

    if ($sysvinit_full_restart_result == 0)
    {
        print color('green'), "[*] Success!", color('reset'), "\n";
        print color('green'), "[...] Output:\n", color('reset'), $sysvinit_full_restart_output;
        print color('green'), "[*] End of output!", color('reset'), "\n";
        return 0;
    } 
    else
    {
        print color('red'), "[!] Error: service --full-restart failed.", color('reset'), "\n";
        return 1;
    }

}

sub execute_service_sysvinit
{
    my ($command, $service) = @_;

    if ($command eq 'start')
    {
        return start_service_sysvinit($service);
    }
    elsif ($command eq 'stop')
    {
        return stop_service_sysvinit($service);
    }
    elsif ($command eq 'reload')
    {
        return reload_service_sysvinit($service);
    }
    elsif ($command eq 'force-reload')
    {
        return force_reload_service_sysvinit($service);
    }
    elsif ($command eq 'restart')
    {
        return restart_service_sysvinit($service);
    }
    elsif ($command eq 'try-restart')
    {
        return try_restart_service_sysvinit($service);
    }
    elsif ($command eq 'status')
    {
        return status_service_sysvinit($service);
    }
    elsif ($command eq '--status-all')
    {
        return status_all_service_sysvinit();
    }
    elsif ($command eq '--full-restart')
    {
        return full_restart_service_sysvinit();
    }
    else
    {
        print color('red'), "[!] Error: Unknown command: $command", color('reset'), "\n";
        return 1;
    }
}

#
# Package management handling classes:
#

##
## 'apt' package management
##

#
# Init/Package handling functions:
#

sub init_system_handling
{
    exit;
}

sub package_handling
{
    exit;
}

# tum_perl_tester();
