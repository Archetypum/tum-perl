# tum-perl

![TheUnixManager](https://github.com/user-attachments/assets/6c0b3fbc-1d09-4d35-9dde-33b22a468c45)

**Tum (TheUnixManager)** is a universal package management and initialization system library created by **Archetypum**, designed to simplify interaction with various UNIX-like systems and streamline the creation of system-related scripts.

This is the Perl implementation of `tum`.

---

## Why?

Because interacting with countless package managers and init systems across UNIX-like platforms is painful — `tum` fixes that.

---

## Installation

### Via CPAN (coming soon)

```sh
cpan install Tum  # Coming soon!
```

### Manual Build

```sh
git clone https://github.com/Archetypum/tum-perl.git
cd tum-perl

perl Makefile.PL
make
make test
make install
```

## Supported Package Management Utilities (35)

### Debian-based:

- **apt**, **apt-get**, **apt-cache**, **apt-cdrom**, **apt-config**, **apt-extracttemplates**, **apt-listchanges**, **apt-mark**, **apt-sortpkgs**, **aptitude**, **aptitude-create-state-bundle**, **aptitude-run-state-bundle**, **dpkg**

### Arch-based:

- **pacman**, **yay**, **trizen**, **pamac**

### Gentoo-based:

- **portage** (open for pull requests)

### Slackware-based:

- **slackpkg**

### Alpine-based:

- **apk**

### Void-based:

- **xbps-install**, **xbps-remove**, **xbps-query**

### Guix-based:

- **guix**

### Dragora-based:

- **qi**

### OpenBSD/NetBSD/FreeBSD-based:

- **pkg_add**, **pkg_delete**, **pkg_create**, **pkg_info**

### FreeBSD-based:

- **pkg**

### NetBSD-based:

- **pkgin**

### RedHat-based:

- **yum**, **dnf**

### openSUSE-based:

- **zypper**, **zypper-log**

### macOS-based:

- **homebrew**

## Supported Initialization Systems (7)

- **systemd**

- **sysvinit**

- **openrc**

- **runit**

- **s6**

- **dinit**

- **launchd**

## Documentation

You can view the module documentation using **perldoc**:

```sh
perldoc lib/Tum.pm

perldoc lib/Tum/PackageManager/Apt.pm

perldoc lib/Tum/InitSystem/SysVinit.pm
```

## Example Usage

### UNIX:

```perl
#!/usr/bin/perl

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
print "your init system: $init\n";
```

### Service Management:

```perl
#!/usr/bin/perl

use Tum::InitSystem::OpenRC;

my $svc = Tum::InitSystem::OpenRC->new("restart", "sshd");
$svc->execute;
```

### Package Management

```perl
#!/usr/bin/perl

use Tum::PackageManager::Apt;

print "Installing packages..."
my $pm = Tum::PackageManager::Apt::apt_install("neofetch", "htop", "vrms");
```

## Other Implementations by Archetypum

- [_tum-python_](https://github.com/Archetypum/tum-python)

- [_tum-bash_](https://github.com/Archetypum/tum-bash)

- [_tum-raku_](https://github.com/Archetypum/tum-raku)

- [_tum-c_](https://github.com/Archetypum/tum-c)

- [_tum-rust_](https://github.com/Archetypum/tum-rust)

## Legal

**tum-perl** is free software, released under the **GNU Lesser General Public License v3**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-perl/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)

![gnu](https://github.com/user-attachments/assets/66935a97-374f-4dbc-9f1c-428070fda139)
