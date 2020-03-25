# zsh

[Zsh](https://www.zsh.org) is a great shell that I use every day, and
this is my configuration for it.

The main `zshrc.zsh` has configuration common to all hosts and is
responsible for sourcing the appropriate submodules. It should be
linked to `~/.zshrc` (`./init.sh` can take care of this for you).

## Host-specific config

All the `.zsh` scripts in `resources/` will be sourced by `zshrc`.
Sometimes though, you have configuration that's specific to the
operating system or the individual machine you're working on. These
scripts can be placed in `resources/hosts/`.

A script which should only be sourced for a particular OS should be
named `$(uname).zsh` where `$(uname)` is whatever the output of the
`uname` command would be on that machine. Host-specific scripts
should likewise be named `$(hostname).zsh`.

## Zsh Plugins

The common config doesn't use any plugins. However, the FVFX1073HV2G
config contains an example of using the
[`antibody`](https://getantibody.github.io) plugin manager (static
style). Plugins for this configuration are tracked in
`resources/plugiplugins.txt`.
