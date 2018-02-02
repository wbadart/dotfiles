# dotfiles

The dotfiles of [Will Badart](wbadart.info).


## Installation

At the top-level of the repo, I provide `init.sh`, which can be
invoked to initialize any of the subsystems listed in the repo.
Specify the desired subsystems by their directory names. For
example:

    $ ls -d */  # these are the available subsystems
        bin/
        i3/
        mac/
        ssh/
        vim/
        xterm/
        zsh/
    $ ./init.sh vim zsh
    ...

For the most part, the init scripts within these directories just
set up a few symbolic links from the config files here in the repo
to their expected locations in the filesystem.


## Contributing

I'm always open to new ideas, so if there's a cool vim hack or i3
trick you think would work well in this ecosystem, please submit a
[pull request](issues)! I'm always open to new ideas.


## License

MIT license; go to town. See [LICENSE] and [opensource.org] for
more details.


[wbadart.info]: https://wbadart.info
[issues]: https://github.com/wbadart/dotfiles/pulls
[LICENSE]: ./LICENSE
[opensource.org]: https://opensource.org/licenses/MIT
