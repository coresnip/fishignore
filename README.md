
# fishignore 🐟

a simple, lightweight `.gitignore` generator written in Fish shell.

- generate `.gitignore` files for multiple languages.
- combine different templates in one command.
- append rules to existing `.gitignore` files.
- force overwrite existing files.
- automatically remove duplicate entries.
- interactive mode when no templates are provided.
- no unnecessary dependencies.

## supported templates

`node` `python` `rust` `go` `java` `cpp` `react` `flutter` `general`

## installation

#### curl
```
curl -fsSL https://raw.githubusercontent.com/coresnip/fishignore/main/install.fish | fish
```
#### or run the installation script manually after cloning the repo
```fish
git clone https://github.com/coresnip/fishignore.git
cd fishignore
fish install.fish
```

Restart your terminal or reload the function:

```fish
source ~/.config/fish/functions/gitignore.fish
```

## usage

Generate a `.gitignore`:

```fish
gitignore node
```

Combine multiple templates:

```fish
gitignore node python rust
```

Append to an existing `.gitignore`:

```fish
gitignore python --append
```

Overwrite an existing `.gitignore`:

```fish
gitignore node --force
```

Interactive mode:

```fish
gitignore
```

## options

| Option | Description |
|---|---|
| `-a`, `--append` | append rules to existing gitignore file |
| `-f`, `--force` | Overwrite existing .gitignore|
| `-h`, `--help` | life's most persistent question |

## uninstallation

```fish
rm ~/.config/fish/functions/gitignore.fish
```