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
  github.com/
    okomestudio/
      symlinkto/
```

In these directories, we want to have three files, `.bashrc`,
`.gitconfig`, and `.dir-locals.el`:

``` text
~/
  .bashrc
  github.com/
    .gitconfig
    okomestudio/
      symlinkto/
        .dir-locals.el
```

Instead of creating files there, we want to put them under version
control, e.g., with a "dotfiles" Git repo, and have symlinks pointing
to them.

Now, let us have such a version-controlled repository at
`~/github.com/okomestudio/dotfiles`:


``` text
~/
  github.com/
    okomestudio/
      dotfiles/
        .bashrc
        github.com/
          .gitconfig
          okomestudio/
            symlinkto/
              .dir-locals.el
```

In this case, we set `SYMLINKTO_TREE` to
`~/github.com/okomestudio/dotfiles`, which we should set

``` shell
export SYMLINKTO_TREE=~/github.com/okomestudio/dotfiles
```

in either one of shell startup file (e.g., `.bashrc`) or with `.envrc`
of `direnv`.

Then, after running `symlinkto`, we create the following symlinks:

``` text
~/
  .bashrc -> $SYMLINKTO_TREE/.bashrc
  github.com/
    .gitconfig -> $SYMLINKTO_TREE/github.com/.gitconfig
    okomestudio/
      symlinkto/
        .dir-locals.el -> $SYMLINKTO_TREE/github.com/symlinkto/.dir-locals.el
```

There you have it. This is the basic idea of what `symlinkto` is for.

To actually run, move to somewhere under the `SYMLINKTO_TREE` and then
run `symlinkto`:

``` shellsession
$ cd $SYMLINKTO_TREE
$ symlinkto
```

For each symlink target that exists in and under the current working
directory, the prompt asks whether to create or remove the symlink.
