# My dotfiles

Run `./install.sh` to install them.

## Misc

[Workaround for app icons hiding under the notch](https://flaky.build/built-in-workaround-for-applications-hiding-under-the-macbook-pro-notch)

```
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 8
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 8
```
