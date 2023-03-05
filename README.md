# dotfiles

My dotfiles. 

- `install` links dotfiles to `$HOME`.
- `install -e` links *and* installs plugins/tools to `$HOME`.
- `provision/` contains scripts for provisioning Alma/RHEL.

## Install

```bash
mkdir -p ~/.local/src && cd ~/.local/src && \
git clone https://github.com/kmmiles/dotfiles && \
cd dotfiles && ./install
```
