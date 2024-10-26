# symlinkto

Create symlinks to version-controlled files.

## Install

``` shellsession
$ make
```

This will install the script `symlinkto` in `$HOME/.local/bin`.

## Usage

Let us first describe what we want to achieve.

Consider a `$HOME` (`~`) directory tree as follows:

``` text
~/
└── github.com/
    └── okomestudio/
        └── symlinkto/
```

In these directories, we want to have three files, `.bashrc`, `.gitconfig`, and
`.dir-locals.el`:

``` text
~/
├── .bashrc
└── github.com/
    ├── .gitconfig
    └── okomestudio/
        └── symlinkto/
            └── .dir-locals.el
```

Instead of creating files there, we want to put them under version control, e.g., with a
"dotfiles" Git repo, and have symlinks pointing to them. Say we have such a
version-controlled repository at `~/github.com/okomestudio/dotfiles`:


``` text
~/
└── github.com/
    └── okomestudio/
        └── dotfiles/
            ├── .bashrc
            └── github.com/
                ├── .gitconfig
                └── okomestudio/
                    └── symlinkto/
                        └── .dir-locals.el
```

In this case, we set `SYMLINKTO_TREE` to `~/github.com/okomestudio/dotfiles`

``` shell
export SYMLINKTO_TREE=~/github.com/okomestudio/dotfiles
```

in one of the shell startup files (e.g., `.bashrc`) (or in `.envrc` of `direnv`).

Then, after running `symlinkto`, the following symlinks are created:

``` text
~/
├── .bashrc -> $SYMLINKTO_TREE/.bashrc
└── github.com/
    ├── .gitconfig -> $SYMLINKTO_TREE/github.com/.gitconfig
    └── okomestudio/
        └── symlinkto/
            └── .dir-locals.el -> $SYMLINKTO_TREE/github.com/symlinkto/.dir-locals.el
```

There you have it. This is what `symlinkto` is for.

### Running symlinkto

The `symlinkto` shell command behaves differently based on the current directory.

``` shellsession
$ symlinkto
... for each symlink candidate, it prompts for a user action ...
```

When the current directory is in or under `SYMLINKTO_TREE`, all the symlink candidates are
recursively searched for in the subdirectories, and for each, `symlinkto` prompts the user
for an action (i.e., create, delete, or skip).

When the current directory is outside `SYMLINKTO_TREE`, `symlinkto` recursively searches
for relevant symlink candidates in or under the current directory, and for each candidate
found, it prompts the user for an action (i.e., create, delete, or skip).
