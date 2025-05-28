#!/usr/bin/perl
#
# This file is part of tum-perl.
# tum-perl is free software: you can redistribute it and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# tum-perl is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# tum-perl. If not, see <https://www.gnu.org/licenses/>. 

package UnixDistributions;

use strict;
use warnings;

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

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

##
## Solaris/illumos operating systems:
##

our @SOLARIS_ILLUMOS_BASED = (
    # Oracle Solaris is the trusted business platform that you depend on. Oracle Solaris 11 gives you consistent compatibility, is simple to use, and is designed to always be secure.
    # <https://www.oracle.com/solaris/solaris11/>
    #
    # illumos is a Unix OS which provides next-generation features for downstream distributions, including advanced system debugging, next generation filesystem, networking, and virtualization options. 
    # <https://www.illumos.org/>

    "solaris", "illumos", "opensolaris", "openindiana", "omnios", "tribblix"
);

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
	#
    # This function takes a distribution name (e.g., Void, Shikake) and
    # compares it against a list of known Void-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @void_list (array): A list of known Void-based distributions.
    #
    # Returns:
    #     1 if the distribution is Void-based, 0 otherwise.
    #
    # Example:
    #     my $is_void = is_void_based("Pristine", @VOID_BASED);
    #     print "Void-based: $is_void\n";

    
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
    # This function takes a distribution name (e.g., Dragora) and
    # compares it against a list of known Dragora-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @dragora_list (array): A list of known Dragora-based distributions.
    #
    # Returns:
    #     1 if the distribution is Dragora-based, 0 otherwise.
    #
    # Example:
    #     my $is_dragora = is_dragora_based("Dragora", @DRAGORA_BASED);
    #     print "Dragora-based: $is_dragora\n";

    
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
    # This function takes a distribution name (e.g., Zenwalk, SalixOS) and
    # compares it against a list of known Slackware-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @slackware_list (array): A list of known Slackware-based distributions.
    #
    # Returns:
    #     1 if the distribution is Gentoo-based, 0 otherwise.
    #
    # Example:
    #     my $is_slackware = is_slackware_based("Zenwalk", @SLACKWARE_BASED);
    #     print "Slackware-based: $is_slackware\n";
 
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
    # This function takes a distribution name (e.g., Fedora, CentOS) and
    # compares it against a list of known RHEL-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @redhat_list (array): A list of known RHEL-based distributions.
    #
    # Returns:
    #     1 if the distribution is RHEL-based, 0 otherwise.
    #
    # Example:
    #     my $is_rhel = is_rhel_based("FEDORA", @REDHAT_BASED);
    #     print "RHEL-based: $is_rhel\n";

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
    # This function takes a distribution name (e.g., Guix) and
    # compares it against a list of known Guix-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @guix_list (array): A list of known Guix-based distributions.
    #
    # Returns:
    #     1 if the distribution is Guix-based, 0 otherwise.
    #
    # Example:
    #     my $is_guix = is_guix_based("Guix", @GUIX_BASED);
    #     print "Guix-based: $is_guix\n";
 
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
    # This function takes a distribution name (e.g., DragonflyBSD, helloSystem) and
    # compares it against a list of known FreeBSD-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @freebsd_list (array): A list of known FreeBSD-based distributions.
    #
    # Returns:
    #     1 if the distribution is FreeBSD-based, 0 otherwise.
    #
    # Example:
    #     my $is_freebsd = is_freebsd_based("DragonflyBSD", @FREEBSD_BASED);
    #     print "FreeBSD-based: $is_freebsd\n";
 
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
    # This function takes a distribution name (e.g., HyperbolaBSD, adj) and
    # compares it against a list of known OpenBSD-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @openbsd_list (array): A list of known OpenBSD-based distributions.
    #
    # Returns:
    #     1 if the distribution is OpenBSD-based, 0 otherwise.
    #
    # Example:
    #     my $is_openbsd = is_openbsd_based("HyperbolaBSD", @OPENBSD_BASED);
    #     print "OpenBSD-based: $is_openbsd\n";
    
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
    # This function takes a distribution name (e.g., BlackBSD, EdgeBSD) and
    # compares it against a list of known NetBSD-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @netbsd_list (array): A list of known NetBSD-based distributions.
    #
    # Returns:
    #     1 if the distribution is NetBSD-based, 0 otherwise.
    #
    # Example:
    #     my $is_netbsd = is_netbsd_based("BlackBSD", @NETBSD_BASED);
    #     print "NetBSD-based: $is_netbsd\n";
    
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

sub is_solaris_illumos_based
{
    # This function takes a distribution name (e.g., OpenIndiana, Solaris) and
    # compares it against a list of known Solaris/illumos-based distributions.
    # If the given distribution is found in the list, the function returns
    # 1 (true); otherwise, it returns 0 (false).
    #
    # Parameters:
    #     $distro (string): The name of the distribution to check.
    #     @solaris_illumos_list (array): A list of known Solaris/illumos-based distributions.
    #
    # Returns:
    #     1 if the distribution is Solaris/illumos-based, 0 otherwise.
    #
    # Example:
    #     my $is_solaris_illumos = is_solaris_illumos_based("Solaris", @SOLARIS_ILLUMOS_BASED);
    #     print "Solaris/illumos-based: $is_solaris_illumos\n";
    
    my ($distro, @solaris_illumos_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@solaris_illumos_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;

}

1;

