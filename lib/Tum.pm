#!/usr/bin/perl

package Tum;

use 5.006;
use strict;
use warnings;

=pod

=cut

our $VERSION = "0.1";

our @SUPPORTED_PMS = (
    "apt",                          # <https://wiki.debian.org/Apt>
    "apt-get",                      # <https://manpages.debian.org/bookworm/apt/apt-get.8.en.html>
    "apt-cache",                    # <https://manpages.debian.org/bookworm/apt/apt-cache.8.en.html>
    "apt-cdrom",                    # <https://manpages.debian.org/bookworm/apt/apt-cdrom.8.en.html>
    "apt-config",                   # <https://manpages.debian.org/bookworm/apt/apt-config.8.en.html>
    "apt-extracttemplates",         # <https://manpages.debian.org/bookworm/apt-utils/apt-extracttemplates.1.en.html>
    "apt-listchanges",              # <https://manpages.debian.org/bookworm/apt-listchanges/apt-listchanges.1.en.html>
    "apt-mark",                     # <https://manpages.debian.org/bookworm/apt/apt-mark.8.en.html>
    "apt-sortpkgs",                 # <https://manpages.debian.org/bookworm/apt-utils/apt-sortpkgs.1.en.html>
    "aptitude",                     # <https://wiki.debian.org/Aptitude>
    "aptitude-create-state-bundle", # <https://manpages.debian.org/bookworm/aptitude-common/aptitude-create-state-bundle.1.en.html>
    "aptitude-run-state-bundle",    # <https://manpages.debian.org/bookworm/aptitude-common/aptitude-run-state-bundle.1.en.html>
    "apk",                          # <https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper>
    "dnf",                          # <https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html-single/managing_software_with_the_dnf_tool/index>
    "dpkg",                         # <https://wiki.debian.org/dpkg>
    "guix",                         # <https://guix.gnu.org/manual/en/html_node/Package-Management.html>
    "pkg",                          # <https://man.freebsd.org/cgi/man.cgi?pkg>
    "pkgin",                        # <https://pkgin.net/>
    "pkg_add",                      # <https://man.openbsd.org/pkg_add>
    "pkg_delete",                   # <https://man.netbsd.org/pkg_delete.1>
    "pkg_create",                   # <https://man.netbsd.org/pkg_create.1>
    "pkg_info",                     # <https://man.netbsd.org/pkg_info.1>
    "pacman",                       # <https://wiki.archlinux.org/title/Pacman>
    "yay",                          # <https://aur.archlinux.org/packages/yay>
    "pamac",                        # <https://aur.archlinux.org/packages/pamac-aur>
    "trizen",                       # <https://packages.artixlinux.org/packages/galaxy/any/trizen/>
    "portage",                      # <https://wiki.gentoo.org/wiki/Portage>
    "qi",                           # <https://dragora.org/handbook/dragora-handbook.html#Introduction-to-Qi>
    "slackpkg",                     # <https://slackpkg.org/documentation.html>
    "xbps",                         # <https://docs.voidlinux.org/xbps/index.html>
    "yum",                          # <https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/deployment_guide/ch-yum>
    "zypper"                        # <https://documentation.suse.com/smart/systems-management/html/concept-zypper/index.html>
);

our @SUPPORTED_INITS = (
    "sysvinit",              # <https://wiki.gentoo.org/wiki/Sysvinit>
    "openrc",                # <https://wiki.gentoo.org/wiki/OpenRC>
    "s6",                    # <https://skarnet.org/software/s6/>
    "runit",                 # <https://smarden.org/runit/>
    "systemd",               # <https://systemd.io/>
    "dinit",                 # <https://davmac.org/projects/dinit/>
    "launchd"                # <https://support.apple.com/guide/terminal/script-management-with-launchd-apdc6c1077b-5d5d-4d35-9c19-60f2397b2369/mac>
);

our @DEBIAN_BASED = (
    # The universal operating system.
    # <https://www.debian.org/>
    
    "debian", "ubuntu", "xubuntu", "linuxmint", "lmde", "trisquel", "devuan", "kali", "parrotos", "popos", "elementaryos",
    "mx", "antix", "crunchbag", "crunchbag++", "pureos", "deepin", "zorinos", "peppermintos", "lubuntu", "kubuntu", "wubuntu",
    "astra", "tailsos", "ututos", "ulteo", "aptosid", "canaima", "corel", "dreamlinux", "elive", "finnix", "gibraltar",
    "gnulinex", "kanotix", "kurumin", "linspire", "maemo", "mepis", "vyatta", "solusos", "openzaurus", "cutefishos", "knoppix",
    "siduction", "psychos", "neptune", "doglinux", "armbian", "droidian", "mobian", "grml", "backbox", "blacklablinux", "mmabuntus",
    "galliumos", "linuxschools", "linuxliteos", "mythbuntu", "solydxk", "uberstudent", "q4os"
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

    "rhel", "fedora", "mos", "rocky", "centos", "opensuse", "almalinux", "oraclelinux", "circlelinux", "clearos", "euleros", "nobara"
);

our @OPENSUSE_BASED = (
    # The makers' choice for sysadmins, developers and desktop users.
    # <https://www.opensuse.org/>

    "opensuse", "suse", "geckolinux", "linuxkamarada"
);

our @GUIX_BASED = (
    # A complete GNU operating system harnessing all the capabilities of the Guix software. Spawned bu Guix itself.
    # <https://guix.gnu.org/>

    "guix"
);

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

our @SOLARIS_ILLUMOS_BASED = (
    # Oracle Solaris is the trusted business platform that you depend on. Oracle Solaris gives you consistent compatibility, is simple to use, and is designed to always be secure.
    # <https://www.oracle.com/solaris/solaris11/>
    #
    # Unix OS which provides next-generation features for downstream distros, including advanced system debugging, next generation filesystem, networking, and virtualization options. 
    # <https://www.illumos.org/>

    "solaris", "illumos", "opensolaris", "openindiana", "omnios", "tribblix"
);

our @MACOS_BASED = (
    # If you can dream it, Mac can do it.
    # <https://www.apple.com/macos>

    "macos"
);

sub is_debian_based
{   
    my ($distro, @debian_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@debian_list) 
    {
        if ($distro eq $base_distro)
        {
            return 0;
        }
    }
    
    return 1;
}

sub is_arch_based
{   
    my ($distro, @arch_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@arch_list) 
    {
        if ($distro eq $base_distro)
        {
            return 0;
        }
    }
    
    return 1;
}

sub is_alpine_based
{   
    my ($distro, @alpine_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@alpine_list) 
    {
        if ($distro eq $base_distro)
        {
            return 0;
        }
    }
    
    return 1;
}

sub is_gentoo_based
{   
    my ($distro, @gentoo_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@gentoo_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_void_based
{   
    my ($distro, @void_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@void_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_dragora_based
{   
    my ($distro, @dragora_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@dragora_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_slackware_based
{
    my ($distro, @slackware_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@slackware_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_redhat_based
{
    my ($distro, @redhat_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@redhat_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_guix_based
{
    my ($distro, @guix_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@guix_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_freebsd_based
{
    my ($distro, @freebsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@freebsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_openbsd_based
{   
    my ($distro, @openbsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@openbsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_netbsd_based
{   
    my ($distro, @netbsd_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@netbsd_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;
}

sub is_solaris_illumos_based
{   
    my ($distro, @solaris_illumos_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@solaris_illumos_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;

}

sub macos_based
{   
    my ($distro, @macos_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@macos_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 0;
    	}
    }
    
    return 1;

}

sub clear_screen
{   
    my $clear_command = "clear";

    system($clear_command);
}

sub prompt_user
{
    my ($prompt, $default) = @_;
    $default ||= 'N';

    print "$prompt (y/n): ";
    chomp(my $user_input = <STDIN>);

    $user_input =~ s/^\s+|\s+$//g;
    $user_input = lc($user_input);
    $user_input = lc($default) if !$user_input;
    
    if ($user_input =~ /^(y|ye|yes)$/)
    {
        return 0;
    } 
    elsif ($user_input =~ /^(n|no)$/)
    {
        return 1;
    }

    return 1;
}

sub check_privileges
{
    
    my $uid = $<;

    if ($uid == 0)
    {
        return;
    } 
    else 
    {
        print RED, "[!] Error: This script requires root privileges to work.", RESET, "\n";
        exit 1;
    }
}

1;
