# sakaki-tools-lite Gentoo Overlay

Overlay containing some lighter-weight versions of the Gentoo utilities from [sakaki-tools](https://github.com/sakaki-/sakaki-tools).

## List of ebuilds

* **app-portage/showem-lite** [source](https://github.com/sakaki-/showem-lite)
 * Provides a simple utility script (**showem-lite**(1)), which enables you to monitor the progress of a parallel **emerge**(1). A manpage is included.
* **app-portage/genup-lite** [source](https://github.com/sakaki-/genup-lite)
 * Provides the **genup-lite**(8) script, to simplify the process of keeping your Gentoo system up-to-date. **genup-lite**(8) can automatically update the Portage tree, and all installed packages. Has interactive and non-interactive (batch) modes. A manpage is included.

## Installation

As of version >= 2.2.16 of Portage, **sakaki-tools-lite** is best installed (on Gentoo) via the [new plug-in sync system](https://wiki.gentoo.org/wiki/Project:Portage/Sync).

The following are short form instructions. If you haven't already installed **git**(1), do so first:

    # emerge --ask --verbose dev-vcs/git 

Next, create a custom `/etc/portage/repos.conf` entry for the **sakaki-tools-lite** overlay, so Portage knows what to do. Make sure that `/etc/portage/repos.conf` exists, and is a directory. Then, fire up your favourite editor:

    # nano -w /etc/portage/repos.conf/sakaki-tools-lite.conf

and put the following text in the file:
```
[sakaki-tools-lite]

# Various (lite variant) Gentoo utilities, from sakaki
# Maintainer: sakaki (sakaki@deciban.com)
 
location = /usr/local/portage/sakaki-tools-lite
sync-type = git
sync-uri = https://github.com/sakaki-/sakaki-tools-lite.git
priority = 50
auto-sync = yes
```

Then run:

    # emaint sync --repo sakaki-tools-lite

If you are running on the stable branch by default, allow **~amd64** keyword files from this repository. Make sure that `/etc/portage/package.accept_keywords` exists, and is a directory. Then issue:

    # echo "*/*::sakaki-tools-lite ~amd64" >> /etc/portage/package.accept_keywords/sakaki-tools-lite-repo
    
Now you can install packages from the overlay. For example:

    # emerge --ask --verbose app-portage/genup-lite

## Maintainers

* [sakaki](mailto:sakaki@deciban.com)
