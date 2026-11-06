Hai's Bootstrap for New System
==============================

1. Install distro-specific, e.g.

        sh bsd.sh     # On FreeBSD, GhostBSD, MidnightBSD, ...
        sh debian.sh  # on Debian
        sh darwin.sh  # on macOS

2. Add the ssh public key to github, bitbucket, ...

4. Install the git repositories:

        make repos

5. Check to see if any of the tools are missing:

        make check

6. Display after-installation notes

        make notes
