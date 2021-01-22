# dotfiles

These are [my](https://willbadart.com) dotfiles. I hope you find something
interesting and useful in here!

As you can tell from the sidebar, I use [nix][Nix] to do all the heavy lifting,
including [`home-manager`][hm] for managing dotfiles and the like. Shared
system configuration lives in [`./configuration.nix`](./configuration.nix)
while shared home configuration lives in [`./home.nix`](./home.nix).
Host-specific configurations each live in their respective subdirectory of
[`./hosts/`](./hosts). On the local clone on each host, I create a symlink
called `./hosts/current` which links to that host's configuration directory
(this symlink is ignored by `.gitignore`).

The `current` config is automatically imported by the shared home or system
configuration, so "installing" my configs is a simple matter of linking
`./configuration.nix` to `/etc/nixos/configuration.nix` and/ or linking
`./home.nix` to `~/.config/nixpkgs/home.nix` and running the appropriate
`{nixos-rebuild,home-manager} switch` command.

[hm]: https://github.com/nix-community/home-manager
[Nix]: https://nixos.org

## Contributing

I'm always open to new ideas, so if there's a cool vim hack or i3
trick you think would work well in this ecosystem, please submit a
[pull request][PRs]! I'm always open to new ideas.

[PRs]: https://github.com/wbadart/dotfiles/pulls

## License

MIT license; go to town. See [LICENSE] and [opensource.org] for
more details.

[LICENSE]: ./LICENSE
[opensource.org]: https://opensource.org/licenses/MIT
