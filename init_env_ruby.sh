#!/bin/bash

# Installs and updates rvm
curl -L https://get.rvm.io | bash -s head --autolibs=4

read -d '' mac_port_error <<"EOF"
It seems macports is installed on your mac, this can cause issues\\n
the recommended path is to use homebrew. Since this is potentially\\n
destructive, I will not attempt to remove port myself! However\\n
here is how to do it:\\n
\\n
sudo port -fp uninstall installed\\n
sudo rm -rf
    /opt/local
    /Applications/DarwinPorts
    /Applications/MacPorts
    /Library/LaunchDaemons/org.macports.*
    /Library/Receipts/DarwinPorts*.pkg
    /Library/Receipts/MacPorts*.pkg
    /Library/StartupItems/DarwinPortsStartup
    /Library/Tcl/darwinports1.0
    /Library/Tcl/macports1.0
    ~/.macports
EOF
# Check for mac ports and error out, prefer homebrew
if [ "`uname`" = "Darwin" ];then
  which -s port && echo -e $mac_port_error && exit 1
  # Updating brew cache
  echo "Attempting to update brew cache, you may be asked for sudo password ..."
  brew update
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Install ruby-2 integrating with OS pkg mgr (apt/brew)
rvm install ruby-2.0.0-p195 --autolibs=4
rvm use ruby-2.0.0-p195
rvm --default use ruby-2.0.0-p195
rvm gemset create silicon-vision
rvm gemset use silicon-vision
gem install rails -v '3.2.13'
bundle install
rvm --rvmrc use ruby-2.0.0-p195@silicon-vesion
rvm use ruby-2.0.0-p195@silicon-vesion
