# dotfiles

## Usage

```shell
git clone https://github.com/wbadart/dotfiles
home-manager -f ./dotfiles -A MY_HOST switch
```

## Organization

```
./
├── hosts/
│   ├── mba.nix
│   └── ...
├── modules/
│   ├── nvim/
│   ├── git.nix
│   └── ...
├── default.nix
└── home.nix
```

`default.nix` is an attribute set that exports each host-specific
configuration. It also includes a `default` attribute exporting the shared Home
Manager module that can be imported by host-specific configs.

The `hosts/` directory contains all those host-specific configs: things which
don't make sense to share, such as the location of the user's home directory.

The host configs import `./home.nix`, which defines the common configuration
and in turn imports my various `modules/` to configure specific applications.
