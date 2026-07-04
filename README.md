# dotfiles

## Usage

```shell
git clone https://github.com/wbadart/dotfiles
home-manager -f ./dotfiles -A MY_HOST switch
```

## Organization

```
.
├── darwin
│   │   == nix-darwin modules ==
│   ├── default.nix
│   └── ...
├── home
│   │   == home-manager modules ==
│   ├── default.nix
│   └── ...
├── hosts
│   │   == top-level configs ==
│   ├── mba.nix
│   └── ...
├── scripts
├── secrets
└── default.nix <- reexport top-level configs
```

`default.nix` is an attribute set that exports each host-specific configuration. The
`hosts/` directory contains all those host-specific configs. These are largely just
import lists of the darwin and home modules, with some host-specifics like usernames and
paths.
