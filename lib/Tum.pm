#!/usr/bin/perl

package Tum;

# ABSTRACT: Great new Tum...

use 5.006;
use strict;
use warnings;
use Exporter "import";

our @EXPORT_OK = qw(
    RED RESET
    is_debian_based is_arch_based is_alpine_based is_gentoo_based is_void_based
    is_dragora_based is_slackware_based is_redhat_based is_guix_based is_freebsd_based
    is_openbsd_based is_netbsd_based is_solaris_illumos_based macos_based
    get_user_distro get_init_system get_pid1_comm clear_screen prompt_user check_privileges
    @SUPPORTED_PMS @SUPPORTED_INITS
    @DEBIAN_BASED @ARCH_BASED @ALPINE_BASED @GENTOO_BASED @VOID_BASED @DRAGORA_BASED
    @SLACKWARE_BASED @REDHAT_BASED @OPENSUSE_BASED @GUIX_BASED @FREEBSD_BASED @OPENBSD_BASED
    @NETBSD_BASED @SOLARIS_ILLUMOS_BASED @MACOS_BASED
);

our %EXPORT_TAGS = (
    all => [@EXPORT_OK],
);

use constant RED   => "\e[31m";
use constant RESET => "\e[0m";

=pod

=head1 Tum

Tum (TheUnixManager) - Detect UNIX distributions and init systems with ease.

=head1 SYNOPSIS

    use Tum qw(
        get_user_distro
        is_debian_based
        is_arch_based
        get_init_system
        clear_screen
        prompt_user
        check_privileges
        RED RESET
    );

    my $distro = get_user_distro();

    if (is_debian_based($distro, @DEBIAN_BASED))
    {
        print "You are using a Debian-based distro.\n";
    }

    my $init = get_init_system();
    print "Init system: $init\n";
    
=head1 DESCRIPTION

The Tum module provides utilities to detect the UNIX distribution
name, identify which family (Debian-based, Arch-based, etc.) the distribution
belongs to, and determine the init system (sysvinit, openrc, systemd) in use.

It also includes handy terminal color constants and common utility functions
for command-line scripts, such as prompting users and checking root privileges.

=head1 EXPORTABLE FUNCTIONS AND VARIABLES

=over 4

=item * get_user_distro()

Reads /etc/os-release (if available) to detect the current GNU/Linux distribution ID.

=item * is_debian_based($distro, @debian_list), is_arch_based($distro, @arch_list), etc.

Functions to check if a given distro string matches a known list of base distributions.

=item * get_init_system()

Returns the detected init system string, such as "systemd", "openrc", "sysvinit", etc.

=item * get_pid1_comm()

Returns the command name of process ID 1.

=item * clear_screen()

Clears the terminal screen.

=item * prompt_user($prompt, $default)

Prompts the user with a yes/no question. Returns 1 for yes, 0 for no.

=item * check_privileges()

Exits the program with an error if not run as root.

=item * Color constants:

RED, RESET - terminal color codes for red text and resetting formatting.

=item * Arrays

@SUPPORTED_PMS, @SUPPORTED_INITS, @DEBIAN_BASED, @ARCH_BASED, etc.

Lists of supported package managers, init systems, and distribution names.

=back

=head1 AUTHOR

Archetypum <archetypum@tutamail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2025 Archetypum

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program. If not, see L<https://www.gnu.org/licenses/>.

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
    "homebrew",                     # <https://brew.sh/>
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
    "zypper",                       # <https://documentation.suse.com/smart/systems-management/html/concept-zypper/index.html>
    "zypper-log"                    # <https://manpages.opensuse.org/Tumbleweed/zypper-log/zypper-log.8.en.html>
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
    "astra", "tails", "ututos", "ulteo", "aptosid", "canaima", "corel", "dreamlinux", "elive", "finnix", "gibraltar",
    "linex", "kanotix", "kurumin", "linspire", "maemo", "mepis", "vyatta", "solusos", "openzaurus", "cutefishos", "knoppix",
    "siduction", "psychos", "neptune", "doglinux", "armbian", "droidian", "mobian", "grml", "backbox", "blacklablinux", "mmabuntus",
    "galliumos", "linuxschools", "linuxliteos", "mythbuntu", "solydxk", "uberstudent", "q4os", "demolinux", "libranet", "omoikane",
    "eagle", "college", "blackrhino", "luinux", "bonzai", "oralux", "demudi", "brlspeak", "censornet", "bluewall", "antemium",
    "knoppel", "skolelinux", "natures", "debxpde", "catix", "brlix", "parsix", "b2d", "troppix", "ging", "zonecd", "archeos",
    "insigne", "dzongkha", "boss", "resulinux", "epidemic", "clonezilla", "inquisitor", "musix", "satux", "pelicanhpc", "minino",
    "avlinux", "tangostudio", "doudou", "saline", "rebellin", "rescatux", "forlex", "proxmox", "wmlive", "point", "tanglu",
    "openmediavault", "vyos", "steamos", "metamorphose", "robolinux", "whonix", "storm", "linuxin", "kinneret", "wienux", "olive",
    "hymera", "spezzos", "primtux", "rebeccablackos", "uninvention", "handy", "selks", "linuxbbq", "kwheezy", "volumio", "raspbian",
    "osmc", "pibang", "sparky", "exe", "semplice", "venenux", "descentos", "martiux", "turnkey", "privatix", "estrellaroja", "untangle",
    "blankon", "webconverger", "swecha", "myrinix", "thisk", "64studio", "gnewsense", "gparted", "pardus", "genieos", "2x", "taprobane",
    "paipix", "amber", "beatrix", "santafe", "userlinux", "sunwah", "erposs", "munjoy", "smartpeer", "euronode", "kalango", "overclockix",
    "danix", "aslinux", "sphinxos", "condorux", "indilinux", "morphix", "clusterix", "mockup", "nepalinux", "slotech", "gnustep", "freeducsup",
    "adamantix", "trx", "freeduc", "slix", "pequelin", "quantian", "shabdix", "defender", "phlak", "std", "zopix", "clusterknoppix", "beernix",
    "eduknoppix", "roslims", "knoppix64", "slynux", "kaella", "knosciences", "beafanatix", "snappix", "ogoknoppix", "penguinsleuth", "augustux",
    "julex", "vmknoppix", "insert", "evinux", "xarnoppix", "llgp", "pilot", "slavix", "linespa", "klustrix", "knoppixmame", "bioknoppix", "knopils",
    "las", "feather", "livux", "featherweight", "lamppix", "damnsmall", "biadix", "hikarunix", "luit", "arabbix", "youresale", "xandros", "bayanihan",
    "caixamagica", "squiggleos", "miko", "guadalinex", "max", "xfld", "helix", "gnix", "esun", "xevian", "voyager", "ozos", "lliurex", "edubuntu",
    "impi", "nubuntu", "fluxbuntu", "ufficiozero", "swift", "vast", "commodore", "ubuntuce", "tuquito", "kiwi", "gos", "ultimate", "symphony",
    "earos", "runtu", "abuledu", "baltix", "debris", "moonos", "caine", "superos", "mangaka", "cae", "monomaxos", "zentyal", "masonux", "asturix",
    "element", "gnacktrack", "xpud", "vinux", "okatux", "dreamstudio", "pear", "luniux", "bodhi", "hybryde", "iqunix", "ubuntudp", "ubuntukylin",
    "makulu", "lite", "linuxfx", "peachosi", "emmabuntus", "cub", "auroraos", "suriyan", "bella", "chaletos", "ubuntumate", "kxstudio", "salentos",
    "centrych", "chitwanix", "ubuntugnome", "ozunity", "redo", "biolinux", "leeenux", "superx", "snowlinux", "arios", "pinguy", "madbox", "ubuntupr",
    "jolios", "wattos", "nexentastor", "deft", "kuki", "remnux", "lxle", "karoshi", "ubunturescue", "easypeasy", "nova", "qimo", "zevenos", "progex",
    "bardlinux", "extix", "ulite", "maryan", "greenie", "opengeu", "sabily", "protech", "comfusion", "ubuntustudio", "artistx", "shift", "freespire",
    "arabian", "poseidon", "alinex", "gnoppix", "openlx", "dynebolic", "molinux", "apodio", "biglinux", "tilix", "imagicos", "pioneer", "ichthux",
    "klikit", "tupiserver", "geolivre", "dizinha", "ankur", "linuxlte", "esware", "progeny", "liis", "muriqui", "loco"
);

our @ARCH_BASED = (
    # A simple, lightweight distribution.
    # <https://www.archlinux.org/>

    "arch", "artix", "manjaro", "endeavouros", "garuda", "parabola", "hyperbola", "archbang", "blackarch", "librewolf", "archlabs",
    "chakra", "archex", "archman", "arco", "bluestar", "chimeraos", "instantos", "kaos", "rebornos", "archhurd", "cyberos", "archcraft",
    "cachyos", "ctlos", "crystallinux", "msys2", "obarun", "parchlinux", "snal" , "steamos3", "tearchlinux", "uboslinux", "linhes", "underground",
    "kdemar", "archie", "faunos", "firefly", "linuxgamers", "kahelos", "netrunner", "ctkarch", "bridge", "sonar", "poliarch", "antergos"
);

our @ALPINE_BASED = (
    # Small. Simple. Secure.
    # <https://www.alpinelinux.org/>

    "alpine", "postmarket"
);

our @GENTOO_BASED = (
    # Welcome to Gentoo, a highly flexible, source-based Linux distribution.
    # <https://www.gentoo.org/>
    
    "gentoo", "argent", "pentoo", "funtoo", "calculate", "chromeosflex", "vidalinux", "knopperdisk", "gentoox", "sabayon", "chromiumos",
    "tinhatlinux", "ututo", "exgent", "flatcarlinux", "gentooplayer", "decibel", "liguros", "macaronilinux", "moccacinoos", "xenialinux",
    "redcorelinux", "porteuskiosk", "navynos", "ututo", "redwall", "papug", "toorox", "librete", "coreos", "shark", "zerahstar", "ibox",
    "gentooth", "mayix", "bicom", "bintoo", "phaeronix", "flash", "vlos", "systemrescue", "litrix", "iollix"
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

    "slackware", "root", "evilentity", "blin", "stux", "jolinux", "netwosix", "connochaet", "salix", "ultima", "slackintosh", "slamd64", "easys",
    "topologilinux", "truva", "draco", "slackel", "cdlinux", "kongoni", "sms", "linvo", "rubix", "drinou", "bearops", "rip", "livecdrouter",
    "porteus", "austrumi", "wifislax", "absolute", "bluewhite64". "howtux", "pqui", "voltalinux", "slampp", "zenwalk", "zencafe", "imagineos",
    "darkstar", "openlab", "runt", "buffalo", "mutagenix", "klax", "lg3d", "nimblex", "dvl", "arudius", "alixe", "parslinux", "wolvix", "tumix",
    "saxenos", "nonux", "tumix", "whoppix", "freepia", "slax", "supergamer", "vector", "plamo", "sentryfirewall"
);

our @REDHAT_BASED = (
    # Red Hat is the leading provider of enterprise open source software solutions.
    # <https://www.redhat.com/>

    "rhel", "fedora", "mos", "rocky", "centos", "almalinux", "oraclelinux", "circlelinux", "clearos", "euleros", "nobara", "yellowdog", "bulinux",
    "elastix", "digantel", "nethserver", "baruwa", "stella", "asterisknow", "trixbox", "honeywall", "rockscluster", "smeserver", "tao", "niigata",
    "kondara", "laster5", "wow", "immunix", "startcom", "whitebox", "endian", "userful", "springdale", "holon", "superrescue", "lineox", "fermi",
    "scientific", "piebox", "wazobia", "tinysofa", "xos", "oeone", "planb", "voodoo", "medialab", "msc", "miracle", "hispafuentes", "mizi", "bluepoint",
    "redflag", "asianux", "cle", "linpus", "sot", "gelecek", "engarde", "thiz", "nuxone", "idms", "cool", "magic", "aurora", "lorma", "sulix", "ftosx",
    "hakin9", "opendesktop", "pingo", "freedows", "resala", "linare", "ingalum", "berry", "linuxxp", "atmission", "atomix", "nst", "ekaaty", "elpicx",
    "ezey", "korora", "olpc", "qubes", "bee", "fox", "dynasoft", "cpubuilders", "chapeau", "pidora", "hanthana", "fusion", "vortexbox", "ojuba", "mythdora",
    "asianlinux", "edulinux", "sci", "krud", "kore", "cobind", "happymac", "mylinux", "onet", "haansoft", "ezplanet", "rpmlive", "ares", "biobrew", "blag",
    "openna", "adios", "annyung", "linuxinstall", "phpsol", "aurox", "linuxplus", "jamd", "elx", "openwall", "k12linux", "asp", "tfm", "tinysofa", "merdeka",
    "trustix", "wibni", "hancom", "xteam"
);

our @OPENSUSE_BASED = (
    # The makers' choice for sysadmins, developers and desktop users.
    # <https://www.opensuse.org/>

    "opensuse", "suse", "geckolinux", "linuxkamarada", "united", "kmlinux", "sunjds", "urix", "sle", "karamad", "jacklab", "stresslinux"
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
    "truenas", "nomadbsd", "clonos", "junosos", "xigmanas", "opnsense", "pfsense", "cellos", "orbisos", "zrouter", "ulbsd", "ravynos", "freenas",
    "fireflybsd", "freesbie", "desktopbsd", "frenzy", "rofreesbie", "ging", "triance", "gulicbsd", "monowall", "pcbsd", "nas4free", "bsdrp" 
);

our @OPENBSD_BASED = (
    # Only two remote holes in the default install, in a heck of a long time!
    # <https://www.openbsd.org/>
    
    "openbsd", "adj", "libertybsd", "bitrig", "bowlfish", "ekkobsd", "embsd", "fabbsd", "fuguita", "marbsd", "microbsd", "commixwall", "bsdanywhere",
    "miros", "olivebsd", "psygnat", "quetzal", "sonafr", "hyperbolabsd", "aeriebsd", "anonymos", "utmfw", "gnobsd" 
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

    "solaris", "illumos", "opensolaris", "openindiana", "omnios", "tribblix", "smartos", "nexenta", "belenix", "milax", "nexentasor", "schillix",
    "xstreamos"
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

sub macos_based
{   
    my ($distro, @macos_list) = @_;
    
    $distro = lc($distro);
    
    foreach my $base_distro (@macos_list) 
    {
    	if ($distro eq $base_distro)
    	{
    		return 1;
    	}
    }
    
    return 0;
}

sub get_user_distro
{
    my $os_release = "/etc/os-release";
    my $distro = "";

    if (-f $os_release)
    {
        open my $fh, "<", $os_release or die "[!] Error: Can't open $os_release: $!";
        while (<$fh>)
        {
            if (/^ID=(.+)/)
            {
                $distro = $1;
                $distro =~ s/^"|"$//g;
                last;
            }
        }
        close $fh;

        if ($distro)
        {
            return $distro;
        }
    }

    print RED, "[!] Error: Cannot detect distribution from'/etc/os-release.", RESET;
    print "[==>] Write your OS name yourself: ";
    chomp($distro = <STDIN>);
    
    return $distro;
}

sub get_init_system
{
    if (-d "/run/systemd/system" || get_pid1_comm() eq "systemd")
    {
        return "systemd";
    }

    if (-d "/etc/init.d" && -e "/etc/init.d/openrc")
    {
        return "openrc";
    }

    if (-d "/etc/init.d")
    {
        return "sysvinit";
    }

    if (-d "/etc/s6")
    {
        return "s6";
    }

    if (-d "/etc/runit")
    {
        return "runit";
    }

    if (get_pid1_comm() eq "dinit")
    {
        return "dinit";
    }

    if (get_pid1_comm() eq "launchd")
    {
        return "launchd";
    }

    return "unknown";
}

sub get_pid1_comm
{
    my $comm = `ps -p 1 -o comm= 2>/dev/null`;
    chomp($comm);
    
    return $comm;
}

sub clear_screen
{   
    my $clear_command = "clear";

    system($clear_command);
}

sub prompt_user
{
    my ($prompt, $default) = @_;
    $default ||= "N";

    print "$prompt (y/n): ";
    chomp(my $user_input = <STDIN>);

    $user_input =~ s/^\s+|\s+$//g;
    $user_input = lc($user_input);
    $user_input = lc($user_input // $default);
    
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
    
    my $uid = $<;

    if ($uid == 0)
    {
        return;
    } 
    else 
    {
        print RED, "[!] Error: This script requires root privileges to work.", RESET;
        exit 1;
    }
}

1;
