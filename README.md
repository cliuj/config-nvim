# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

**Colorscheme:** [midnight-meadow.nvim](https://github.com/cliuj/midnight-meadow.nvim) (custom)

## Requirements

- Neovim 0.11+
- [fish shell](https://fishshell.com/) (configured as default shell)
- [fd](https://github.com/sharkdp/fd) (for Telescope find_files)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live_grep)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `gh` CLI (optional, for GitHub features in blink-cmp-git)

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point (loads general/)
├── .stylua.toml             # Lua formatter config (2-space indent)
├── lua/
│   ├── general/
│   │   ├── init.lua         # Loads all general modules + lazy.nvim
│   │   ├── settings.lua     # Vim options
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Autocommands
│   │   └── aliases.lua      # Custom commands
│   └── plugins/
│       ├── colorscheme.lua  # Colorscheme
│       ├── cmp.lua          # Completion (blink.cmp, LuaSnip)
│       ├── lsp.lua          # LSP, formatting, linting
│       ├── ui.lua           # UI plugins (telescope, neo-tree, etc.)
│       ├── statusline.lua   # Lualine configuration
│       └── misc.lua         # Miscellaneous plugins
```

## Keymaps

**Leader key:** `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `<S-j>` | n | Jump to next paragraph (`}`) |
| `<S-k>` | n | Jump to previous paragraph (`{`) |
| `<leader>w` | n | Window prefix (`<C-w>`) |
| `<Esc>` | t | Exit terminal mode |

### File Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | n | Find files (Telescope) |
| `<leader>/` | n | Live grep (Telescope) |
| `<leader>:` | n | Command history (Telescope) |
| `<leader>b` | n | List buffers (Telescope) |
| `<leader>p` | n | Switch project (Telescope) |
| `<leader>l` | n | Open file explorer (Neo-tree) |
| `-` | n | Open parent directory (Oil) |

### Sessions (persistence.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>qs` | n | Restore session (current directory) |
| `<leader>ql` | n | Restore last session (any directory) |
| `<leader>qS` | n | Select from saved sessions |
| `<leader>qd` | n | Don't save session on exit |

### Buffers

| Key | Mode | Action |
|-----|------|--------|
| `<leader>bd` | n | Delete buffer (keep window) |
| `<leader>bD` | n | Force delete buffer |

### Git

| Key | Mode | Action |
|-----|------|--------|
| `<leader>g` | n | Open Neogit |
| `<leader>hs` | n | Stage hunk |
| `<leader>hr` | n | Reset hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |

### LSP & Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cm` | n | Open Mason |
| `<leader>cf` | n | Format buffer |
| `<leader>xx` | n | Toggle diagnostics (Trouble) |
| `<leader>xX` | n | Buffer diagnostics (Trouble) |
| `<leader>xs` | n | Document symbols (Trouble) |
| `]x` | n | Next trouble item |
| `[x` | n | Previous trouble item |
| `<C-k>` | i | Toggle signature help |

### Completion (blink.cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<CR>` | i | Accept completion |
| `<Tab>` | i | Next item / snippet jump forward |
| `<S-Tab>` | i | Previous item / snippet jump backward |
| `<C-Space>` | i | Trigger completion |
| `<C-e>` | i | Cancel completion |
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `/` | n | Search with flash labels |
| `<C-s>` | c | Toggle flash labels in search |

### Editing

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle comment (line) |
| `gc{motion}` | n | Toggle comment (motion) |
| `ys{motion}{char}` | n | Add surround |
| `ds{char}` | n | Delete surround |
| `cs{old}{new}` | n | Change surround |

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<leader>;` | n | Toggle terminal |

### Markdown (markview)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>mr` | n | Refresh markview rendering |
| `<leader>mt` | n | Toggle markview on/off |

### goto-preview (LSP peek)

| Key | Mode | Action |
|-----|------|--------|
| `gpd` | n | Preview definition |
| `gpt` | n | Preview type definition |
| `gpi` | n | Preview implementation |
| `gpr` | n | Preview references |
| `gP` | n | Close all preview windows |

## Installed Plugins

### Completion & Snippets

| Plugin | Description |
|--------|-------------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Fast completion with Rust fuzzy matcher |
| [blink-cmp-git](https://github.com/Kaiser-Yang/blink-cmp-git) | Git completions (#issues, :commits, @mentions) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |

### LSP & Language Support

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason + lspconfig bridge |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install formatters/linters |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API completions |
| [neoconf.nvim](https://github.com/folke/neoconf.nvim) | Project-local LSP settings |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | Function signature help |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

**LSP Servers (auto-installed):**
- `lua_ls` (Lua)
- `pyright` (Python)
- `bashls` (Bash)
- `jsonls` (JSON)
- `yamlls` (YAML)
- `marksman` (Markdown)
- `hls` (Haskell)

### Formatting & Linting

| Plugin | Description |
|--------|-------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter (format-on-save) |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linting |

**Formatters:** `stylua` (Lua), `shfmt` (Shell)
**Linters:** `luacheck` (Lua), `shellcheck` (Shell)

### UI & Navigation

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope |
| [telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim) | Project management |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-tabline](https://github.com/crispgm/nvim-tabline) | Tabline |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |
| [flash.nvim](https://github.com/folke/flash.nvim) | Enhanced search navigation |
| [goto-preview](https://github.com/rmagatti/goto-preview) | LSP peek in floating window |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Better diagnostics list |
| [mini.indentscope](https://github.com/echasnovski/mini.indentscope) | Animated indent guides |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit filesystem like a buffer |

### Git

| Plugin | Description |
|--------|-------------|
| [neogit](https://github.com/NeogitOrg/neogit) | Magit-style Git interface |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Diff viewer |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs & hunk actions |

### Editing

| Plugin | Description |
|--------|-------------|
| [mini.pairs](https://github.com/echasnovski/mini.pairs) | Auto pairs |
| [mini.comment](https://github.com/echasnovski/mini.comment) | Commenting (gcc) |
| [mini.bufremove](https://github.com/echasnovski/mini.bufremove) | Buffer delete without closing window |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text objects |

### Miscellaneous

| Plugin | Description |
|--------|-------------|
| [mini.misc](https://github.com/echasnovski/mini.misc) | Auto-root to git directory |
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Session management (auto-save/restore) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal management |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown preview in browser |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | In-editor markdown rendering |
| [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) | Color code highlighting |
| [luarocks.nvim](https://github.com/vhyrro/luarocks.nvim) | Luarocks integration |

### Syntax Plugins

Extra syntax support for: Yuck (eww), Haskell, PureScript, Prisma, GraphQL

## Options

Key settings from `lua/general/settings.lua`:

| Option | Value | Description |
|--------|-------|-------------|
| `mapleader` | `<Space>` | Leader key |
| `number` | `true` | Show line numbers |
| `relativenumber` | `false` | Absolute line numbers |
| `cursorline` | `true` | Highlight current line |
| `expandtab` | `true` | Use spaces instead of tabs |
| `undofile` | `true` | Persistent undo |
| `ignorecase` | `true` | Case-insensitive search |
| `smartcase` | `true` | Case-sensitive if uppercase used |
| `scrolloff` | `5` | Lines to keep above/below cursor |
| `colorcolumn` | `80` | Show column guide at 80 |
| `splitbelow` | `true` | Horizontal splits below |
| `splitright` | `true` | Vertical splits right |
| `clipboard` | `unnamedplus` | System clipboard integration |
| `shell` | `fish` | Default shell |
| `conceallevel` | `2` | Conceal syntax (markdown) |

## Autocommands

- **Disable auto-commenting:** New lines don't continue comments
- **Floating diagnostics:** Diagnostics shown on cursor hold

## Custom Commands

| Command | Description |
|---------|-------------|
| `:Oj [day]` | Open Neorg journal |
| `:Org [args]` | Alias for `:Neorg` |
