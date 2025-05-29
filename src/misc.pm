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

package Miscellaneous;

use strict;
use warnings;

use constant GREEN  => "\e[32m";
use constant RED    => "\e[31m";
use constant RESET  => "\e[0m";

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
    "systemd",               # <https://systemd.io/>
    "dinit"                  # <https://davmac.org/projects/dinit/>
);

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
    # Prompts the user for input and returns 1 for 'y/yes' or 0 for 'n/no'.
    # Allows for a default value to be used if the user presses Enter without typing.
    #
    # Args:
    #     $prompt: The prompt message to display to the user.
    #     $default: The default value ('Y' or 'N') to assume if the user just presses Enter.
    #
    # Returns:
    #     1 for 'y', 'ye', 'yes' (case-insensitive); 0 for 'n', 'no' (case-insensitive).
    #
    # Example:
    #     my $should_continue = prompt_user("Do you want to continue?", "Y");
    #     if ($should_continue) 
    #     {
    #         print "Continuing...\n";
    #     }
    #     else 
    #     {
    #         print "Exiting...\n";
    #     }

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
        print RED, "[!] Error: This script requires root privileges to work.", RESET, "\n";
        exit 1;
    }
}

sub tum_version
{
    # Returns current hardcoded tum-perl version.
    # 
    # Returns:
    #     tum-perl version.
    #
    # Example:
    #     my $version = tum_version();
    #     print "$version";

    my $VERSION = "v0.0.1-testing";

    return "$VERSION";
} 

1;
