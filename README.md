# dotfiles

These are [my](https://willbadart.com) dotfiles. I hope you find something
interesting and useful in here!

99% of my configuration is handled by [`home-manager`][hm], a [Nix]-based
dotfile/ general program configuration manager. The top-level
[`./home.nix`](./home.nix) file has all of the common config, and each entry
under [`./hosts/`](./hosts) has some specifics for each machine I'm using this
repo on.

[hm]: https://github.com/rycee/home-manager
[Nix]: https://nixos.org

To get started, install `home-manager`, and run the following:

```sh
git clone https://github.com/wbadart/dotfiles.git
cd dotfiles
```

Now, create a `./hosts/` entry for your machine using this template:

```nix
import ../home.nix
{
  username = "...";
  homeDirectory = "...";
  email = "...";
}
```

Finally,

```sh
mkdir -p $HOME/.config/nixpkgs
ln -s $PWD/hosts/this_machine.nix $HOME/.config/nixpkgs/home.nix
home-manager switch
```

## Contributing

I'm always open to new ideas, so if there's a cool vim hack or i3
trick you think would work well in this ecosystem, please submit a
[pull request][PRs]! I'm always open to new ideas.


## License

MIT license; go to town. See [LICENSE] and [opensource.org] for
more details.


[PRs]: https://github.com/wbadart/dotfiles/pulls
[LICENSE]: ./LICENSE
[opensource.org]: https://opensource.org/licenses/MIT
