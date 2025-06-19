#!/usr/bin/perl

package Tum;

use 5.006;
use strict;
use warnings;

=pod

=cut

our $VERSION = "0.1";

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

our @OPENSUSE_BASED = (
    # The makers' choice for sysadmins, developers and desktop users.
    # <https://www.opensuse.org/>

    "opensuse", "geckolinux", "linuxkamarada"
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

sub is_debian_based
{   
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
