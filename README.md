# ammuench nvim template

My personal neovim template.  Based on [AstroNvim](https://astronvim.com/) 

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone git@github.com:ammuench/ammuench-astrovim.git ~/.config/nvim

# if you're using this as a starting point.  remove my git history
# and initialize your own git repo instead to track

cd ~/.config/nvim
rm -rf .git
git init
git remote set-url origin git@github.com:<yourname>/<your-repo>.git
git add -A
git commit -m "My new neovim config"
```

#### Start Neovim

```shell
nvim
```

## Tweaks and Changes

This configuration includes several modifications and additions to the base AstroNvim setup:

*   **Color Scheme**: Uses the `nightfly` colorscheme.
*   **LSP & Formatting**:
    *   Auto-formatting on startup is disabled (`astrolsp`).
    *   Added support for the Deno language server (`denols`), including logic to prefer it over `vtsls` when detected.
    *   Added custom keymap `<leader>L` to run `:EslintFixAll`.
    *   Added custom keymap `<leader>B` to run `:BiomeCheckCurrentFile`.
    *   Includes configuration for `conform.nvim` for formatting.
*   **UI Enhancements**:
    *   Configuration for `neotree` (file explorer).
    *   Configuration for `better-quickfix`.


