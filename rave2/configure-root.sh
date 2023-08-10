#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

## build ARGs
NCPUS=${NCPUS:--1}
NB_USER=${NB_USER:-${DEFAULT_USER:-"rstudio"}}

echo "Checking for 'apt.txt'..."
if test -f "apt.txt" ; then
  apt-get update --fix-missing > /dev/null
  xargs -a apt.txt apt-get install --yes
fi

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install \
  bash-completion

# Clean up
rm -rf /var/lib/apt/lists/*


chmod 0755 /rave_scripts/launcher.R
