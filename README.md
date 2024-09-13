# symlinkto

Create symlinks under HOME to files under a mirrored directory
hierarchy.

The environment variable SYMLINKTO_TREE should point to the absolute
path to the root of the mirrored directory hierarchy. This variable
must be set before using this script.

Any (real) file under SYMLINKTO_TREE become candidates for symlinks.

The main use case is to maintain (configuration) files that we do not
want to put under version control in a different repository. For
example, Emacs's .dir-locals.el mechanism allows directory-dependent
configurations by just creating the file under a target directory.
However, it is often not desirable to put editor-specific files under
version control for share. In that case, we "mirror" the directory
hierarchy under SYMLINKTO_TREE, have .dir-locals.el files there, and
then run symlinkto to create symlinks linking to them under the actual
version-controlled directories.

### Install

``` shell
make
```

This will install the script `symlinkto` in `$HOME/.local/bin`.
