# tum-perl
![theUnixManagerEdited](https://github.com/user-attachments/assets/6c0b3fbc-1d09-4d35-9dde-33b22a468c45)

_tum (TheUnixManager)_ is an ultimate package management and initialization system handling library made by **Archetypum**
to simplify interaction with various UNIX-like systems and creation of system-related scripts.

This time, its written in Perl.

## Why?

I'm are too lazy to write why this can be helpful. Trust me bro

## Installation

(IN FUTURE) You can install Tum via CPAN:

```sh
cpan install Tum  # NOT IMPLEMENTED YET.
```

or obtain the source...

```sh
git clone https://github.com/Archetypum/tum-perl.git
cd tum-perl
```

...and build it yourself!

```sh
perl Makefile.PL
make
make test
make install
```

## Supported Package Management utilites (33)

- **apt**

- **apt-get**

- **apt-cache**

- **apt-cdrom**

- **apt-config**

- **apt-extracttemplates**

- **apt-listchanges**

- **apt-mark**

- **apt-sortpkgs**

- **aptitude**

- **aptitude-create-state-bundle**

- **aptitude-run-state-bundle**

- **apk**

- **dnf**

- **dpkg**

- **guix**

- **homebrew**

- **pkg**

- **pkgin**

- **pkg_add**

- **pkg_delete**

- **pkg_create**

- **pkg_info**

- **pacman**

- **yay**

- **trizen**

- **pamac**

- **portage**

- **qi**

- **slackpkg**

- **xbps**

- **yum**

- **zypper**

- **zypper-log**

## Supported Initialization Systems (7)

- **systemd**

- **sysvinit**

- **openrc**

- **runit**

- **s6**

- **dinit**

- **launchd**

## Documentation

You can check _tum-perl_ documentation via **perldoc** utility:

```sh
perldoc lib/Tum.pm

perldoc lib/Tum/PackageManager/Apt.pm

perldoc lib/Tum/InitSystem/SysVinit.pm
```

## Other implementations by Archetypum

Written in Python: [_tum-python_](https://github.com/Archetypum/tum-python)

Written in Bash: [_tum-bash_](https://github.com/Archetypum/tum-bash)

Written in Raku: [_tum-raku_](https://github.com/Archetypum/tum-raku)

Written in C: [_tum-c_](https://github.com/Archetypum/tum-c)

Written in Rust: [_tum-rust_](https://github.com/Archetypum/tum-rust)

## Legal

_tum-perl_ is free software: you can redistribute it and/or modify it under the terms of the
**GNU Lesser General Public License v3** as published by the _Free Software Foundation_.

More information in:

- _LICENSE-LGPLv3.md_
- _https://www.fsf.org_
- _https://www.gnu.org_

![gnu](https://github.com/user-attachments/assets/66935a97-374f-4dbc-9f1c-428070fda139)
