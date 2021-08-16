# NVIM Config

## Installation

`efm-config.yaml` needs to be symlinked to:

* UNIX: `$HOME/.config/efm-langserver/config.yaml`
* Windows: `%APPDATA%\efm-langserver\config.yaml`

## FAQ

### "format for LanguageID not supported: typescriptreact"

Make sure the project actually has `prettier` as a dependency and that the
`./node_modules/.bin/prettier` actually exists...
