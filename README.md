# 🎨 colorscheme-transparency.nvim

> Make your Neovim colorscheme transparent. Lightweight, modular, and highly configurable.

A Neovim plugin that provides flexible transparency management for colorschemes, including main windows and floating windows (Telescope, Which-key, Lazy, Mason, etc.).

## ✨ Features

- **Main Window Transparency**: Make the main editor background transparent
- **Floating Window Transparency**: Apply transparency to floating windows (popups, menus, dropdowns)
- **State Persistence**: Optionally save and restore transparency settings between sessions
- **ColorScheme Integration**: Automatically reapply transparency when the colorscheme changes
- **Modular Design**: Clean, organized code structure inspired by production Neovim plugins

## ⚡️ Requirements

- **Neovim** >= 0.9.0

## 📦 Installation

### Repository [lazy.nvim](https://github.com/folke/lazy.nvim)

### Website [LazyVim](https://www.lazyvim.org/)

Create a new file `~/.config/nvim/lua/plugins/transparency.lua`:

```lua
return {
  "ricardo-rod/colorscheme-transparency.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("colorscheme-transparency").setup({
      use_persistence = false,
      default_main = true,
      default_floats = true,
    })
  end,
}
```

LazyVim will automatically load this file and manage the plugin but you need to install the plugin first.

> **Note**: If you get an error about the Lua module not being found, ensure the plugin is properly installed in your Neovim plugins directory. You can also use `opts = {...}` instead of `config = function()` once the plugin is installed.



## 🚀 Quick Start

After adding the plugin to your LazyVim or lazy.nvim config, install it using one of these commands:

### Install the specific plugin

Open Neovim and run:

```vim
:Lazy install colorscheme-transparency.nvim
```

### Sync all plugins (recommended)

```vim
:Lazy sync
```

This will install, update, and clean up all plugins in your config.

### Manual Installation

Clone the repository to your Neovim plugins directory:

```bash
git clone https://github.com/ricardo-rod/colorscheme-transparency.nvim.git ~/.local/share/nvim/site/pack/plugins/start/colorscheme-transparency.nvim
```

Or if you use a different plugin directory:

```bash
git clone https://github.com/ricardo-rod/colorscheme-transparency.nvim.git /path/to/your/plugins/colorscheme-transparency.nvim
```

## ⚙️ Configuration

### Default Options

```lua
require("colorscheme-transparency").setup({
  -- Save and restore transparency state between sessions
  use_persistence = false,
  
  -- Default transparency for main windows when starting
  default_main = true,
  
  -- Default transparency for floating windows when starting
  default_floats = true,
})
```

### Option Details

- **use_persistence** (boolean): When `true`, the plugin saves your transparency preferences to disk and restores them on the next startup. Default: `false`

- **default_main** (boolean): Default transparency state for main window groups on startup. Default: `true`

- **default_floats** (boolean): Default transparency state for floating window groups on startup. Default: `true`

## 🎯 What Gets Transparent

### Main Windows (when `transparent_enabled = true`)

- `Normal`, `NormalNC` - Main editor area
- `SignColumn` - Sign column (line numbers, diagnostics)
- `StatusLine`, `StatusLineNC` - Status bar
- And more standard UI elements

### Floating Windows (when `transparent_floats_enabled = true`)

Compatible with popular Neovim plugins:
- **Which-key.nvim**: `WhichKey`, `WhichKeyNormal`, `WhichKeyBorder`
- **Telescope.nvim**: `TelescopeNormal`, `TelescopeBorder`, `TelescopePrompt*`
- **Lazy.nvim**: `LazyNormal`, `LazyBorder`
- **Mason.nvim**: `MasonNormal`, `MasonBorder`
- **Noice.nvim**: `NoiceFloat`, `NoiceFloatBorder`, `Noice*`
- **Pmenu**: `Pmenu`, `PmenuSel`, `PmenuSbar`, `PmenuThumb`

## 📝 Project Structure

```
colorscheme-transparency.nvim/
├── plugin/
│   └── colorscheme-transparency.lua     # Auto-loaded by Neovim on startup
├── lua/colorscheme-transparency/
│   ├── init.lua                          # Main setup module
│   ├── config.lua                        # Configuration management
│   └── highlights.lua                    # Highlight group definitions
├── README.md
├── LICENSE
└── .gitignore
```

### Directory Explanation

- **`plugin/`**: Auto-loaded by Neovim at startup. Any `.lua` files here are executed automatically without requiring manual `require()` calls. This is where the plugin entry point lives.

- **`lua/`**: Module code that can be required with `require("colorscheme-transparency")`. This directory contains the actual logic separated into modular files for organization and reusability.

## 🔧 Development

This project follows the structure and best practices of production Neovim plugins like [which-key.nvim](https://github.com/folke/which-key.nvim).

### Key Design Decisions

1. **Modular Structure**: Configuration, highlights, and setup logic are separated for clarity
2. **Plugin Loader**: The `plugin/` directory ensures automatic loading
3. **Type Annotations**: Uses Lua doc-style annotations for IDE support
4. **Minimal Dependencies**: No external dependencies required

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or pull requests.

---

**Built with ❤️ for the Neovim community**
