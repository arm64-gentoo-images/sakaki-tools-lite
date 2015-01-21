# sakaki-tools-lite Gentoo Overlay

Overlay containing some lighter-weight versions of the Gentoo utilities from [sakaki-tools](https://github.com/sakaki-/sakaki-tools).

## List of ebuilds

* **app-portage/genup-lite** [source](https://github.com/sakaki-/genup-lite)
 * Provides the **genup-lite**(8) script, to simplify the process of keeping your Gentoo system up-to-date. **genup-lite**(8) can automatically update the Portage tree, and all installed packages. Has interactive and non-interactive (batch) modes. A manpage is included.

## Installation

**sakaki-tools-lite** is best installed (on Gentoo) via **layman**(8).

The following are short form instructions. If you haven't already installed **layman**(8), do so first:

    emerge --ask --verbose app-portage/layman
    echo 'source "/var/lib/layman/make.conf"' >> /etc/portage/make.conf

Make sure the `git` USE flag is set for the **app-portage/layman** package (it should be by default).

Next, create a custom layman entry for the **sakaki-tools-lite** overlay, so **layman**(8) can find it on GitHub. Fire up your favourite editor:

    nano -w /etc/layman/overlays/sakaki-tools-lite.xml

and put the following text in the file:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE repositories SYSTEM "/dtd/repositories.dtd">
    <repositories xmlns="" version="1.0">
        <repo priority="50" quality="experimental" status="unofficial">
    	    <name>sakaki-tools-lite</name>
    	    <description>Various (lite variant) Gentoo utilities, from sakaki.</description>
    	    <homepage>https://github.com/sakaki-/sakaki-tools-lite</homepage>
    	    <owner>
    		    <email>sakaki@deciban.com</email>
    		    <name>sakaki</name>
            </owner>
    	    <source type="git">https://github.com/sakaki-/sakaki-tools-lite.git</source>
        </repo>
    </repositories>

Then run:

    layman --sync-all
    layman --add="sakaki-tools-lite"

If you are running on the stable branch by default, allow **~<yourarch>** keyword files from this repository, e.g.:

    echo '*/*::sakaki-tools-lite ~ppc' >> /etc/portage/package.accept_keywords
    
Now you can install packages from the overlay. For example:

    emerge --ask --verbose app-portage/genup-lite

## Maintainers

* [sakaki](mailto:sakaki@deciban.com)
