Sets up my mac for my style of software development.

Prerequisite software setup
===========================
You first need the basic development and scripting tools.

* run software update
  * `sudo softwareupdate -i -a`
* install XCode via the App Store
  * note you _can_ install homebrew and the rest of the below _while_ downloading/installing XCode, but at some point something probably won't work until you do
* installing [xcode command line tools](http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools) by hand seems unneeded on 10.11, homebrew takes care of what it needs. On older mac os x versions it may still be required:
  * `xcode-select --install`
  * `sudo xcodebuild -license`
* install [homebrew](http://brew.sh/)
  * `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Usage
=====
Don't be a lazy bastard and do this:

* `cd ~; mkdir dev; cd dev`
* `git clone git@github.com:lsimons/lsd-mac-setup.git`
* `cd lsd-mac-setup`
* `./install.sh`

Unless you are me you probably won't like some of it. You've been warned.

Manual setup!
=============
What you should do instead is [read install.sh](install.sh) and then follow each of the steps you want to follow.

Make your own decisions about which bits you will trust and are happy to do automatically.

Post-install more manual setup!
===============================
* set up your SSH keys and config
* set up your ~/.chef config further
* write your ~/.localrc with private settings
* install the rest of your dot files
* restore settings and preferences from backup
* restore files and other data from backup

FAQ
===
* *Q:* Why didn't you use an existing dotfiles or home dir management system from someone else?
* *A:* For fun. Obviously you're much better off with some of the stuff from https://dotfiles.github.io/ .

* *Q:* What if "X" doesn't work?
* *A:* fix it. I may or may not look at a pull request if you send one.

* *Q:* Why did you copy/paste some files rather than download/depend on them properly?
* *A:* Life's too short. Worried they might end up 'gone'.
