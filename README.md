# dotfiles

The dotfiles of [Will Badart](https://willbadart.com).

## Installation

At the top-level of the repo, I provide `init.sh`, which can be run
to initialize a module. Specify the desired modules by their
directory names. For example:

    $ git clone https://github.com/wbadart/dotfiles.git && cd dotfiles

    $ ls modules  # show available modules
    i3 mac powerline ssh tmux vim xterm zsh

    $ ./init.sh vim zsh
    ...

For the most part, the init scripts within these directories just
set up a few symbolic links from the config files here in the repo
to their expected locations in the filesystem.

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
