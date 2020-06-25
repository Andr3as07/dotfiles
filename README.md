# Andr3as07's dotfiles

Your dotfiles are how you personalize your system. These are mine.
These dotfiles are currently tested on Ubuntu 19.10.

## what's inside

* Useful scripts are in `~/.local/bin/`
* Settings for:
  * zsh (shell)
  * i3-gaps (window manager)
  * i3status
* I try to minimize what's directly in `~` so:
  * All configs that can be in `~/.config` are.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using-Git Bare Repository 
Run this:

```sh
wget raw.githubusercontent.com/andr3as07/dotfiles/master/.local/bin/install/install-dotfiles.sh
chmod +x install-dotfiles.sh
./install-dotfiles.sh
```

This will create two new directories in your home directory.
* `.dotfiles` which contains the git bare repository.
* `.dotfiles-backup` which contains all files that would have been overwritten in the installation process.



To update later on, just run:

```sh
config checkout
```



### Git-Free Install

To install these dotfiles without Git:

```sh
cd; curl -#L https://github.com/Andr3as07/dotfiles/tarball/master | tar -xzv --strip-components=1
```

**Warning:** This method does not create any backups of your old data, it just overrides everything. Only use this method if you are absolutely sure you know what you are doing.



To update later on, just run that command again.

## Feedback & Bug reports

Suggestions/improvements [welcome](https://github.com/andr3as07/dotfiles/issues)!

In an ideal world these dotfiles should work for everyone. that means when you clone it should work even though you may not have one or multiple components installed. That said, I do use this as *my* dotfiles, so there's a good chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please [open an issue](https://github.com/holman/dotfiles/issues) on this repository and I'd love to get it fixed for you!

## Tanks to...

* [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg) for his video [Git Bare Repository - A Better Way To Manage Dotfiles](https://www.youtube.com/watch?v=tBoLDpTWVOM)

