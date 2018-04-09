# Neo9 tools

Neo9 tools is a project to quickly install required softwares on any linux based distribution.

# Getting started

With curl
```bash
curl https://raw.githubusercontent.com/neo9/lifesaver/master/install.sh -fsSL | bash -s docker $USER
```

```bash
wget -O - https://raw.githubusercontent.com/neo9/lifesaver/master/install.sh | bash -s docker $USER
```
The `docker` keyword is an installation mode. Check all installation modes
in `config.yaml`.

# Configuration

To customize available install mode and the pograms you want to install,
simply modify the `config.yaml` file.

## Config file example

```yaml
ansible:
  description: Install ansible with required packages
  programs:
    - python-passlib
  steps:
    - description: Install passlib
      commands:
        - pip3 install -i https://pypi.python.org/simple/ --upgrade pip
        - pip3 install ansible
```

`programs` and `steps` are optionals

You can safely assume that `pip3` and `python3` is available on the host.

## Dependencies

If you want to have an installation mode that inherit from another, you can
use `dependencies`.

Example:

```yaml
full:
  description: Install full shell configuration
  dependencies:
    - minimal
    - shell
```

This will be the same as running `./src/install.py minimal && ./src/install.py shell`.

# Special variables substitutions

- CP: `cp -a`
- PKG: detected package manager
- CHOWN: `chown -R $USER:$USER`
- USER: `$USER`

Where `$USER` can be overriden as the parameter given in second argument (bash -s minimal my_custom_user)
