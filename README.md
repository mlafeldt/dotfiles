# My dotfiles

Run `./install.sh` to install them.

## Misc macOS stuff

[Workaround for app icons hiding under the notch](https://flaky.build/built-in-workaround-for-applications-hiding-under-the-macbook-pro-notch)

```
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 8
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 8
```

[Auto-hide Dock quickly](https://registerspill.thorstenball.com/p/new-year-new-job-new-machine)

```
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock
```

[How fast is your shell?](https://registerspill.thorstenball.com/p/how-fast-is-your-shell)

```
for i in $(seq 1 10); do time bash -i -c exit; done
```
