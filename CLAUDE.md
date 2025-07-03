# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository using a modular Lua-based setup with Lazy.nvim as the plugin manager.

## Architecture

The configuration follows a clean modular structure:

```
init.lua                 # Entry point - loads all modules in order
lua/config/             # Core configuration modules
  ├── options.lua       # Editor settings (tabs, search, UI)
  ├── keymaps.lua       # Key bindings (leader=space, localleader=\)
  ├── autocommands.lua  # Auto behaviors (highlight yank, trim whitespace)
  ├── lazy.lua          # Plugin manager bootstrap
  └── colorscheme.lua   # Theme configuration
lua/plugins/            # Plugin specifications
  └── init.lua          # Plugin list (currently empty)
```

## Key Configuration Details

- **Leader key**: Space (`<Space>`)
- **Local leader**: Backslash (`\`)
- **Tab settings**: 2 spaces, expandtab enabled
- **System clipboard**: Integrated via `unnamedplus`
- **Plugin manager**: Lazy.nvim (auto-installs on first run)

## Common Development Tasks

### Adding a new plugin
1. Add plugin specification to `lua/plugins/init.lua`
2. Lazy.nvim will auto-install on next startup
3. Create separate config files in `lua/plugins/` for complex plugin setups

### Modifying core settings
- Editor options: Edit `lua/config/options.lua`
- Key mappings: Edit `lua/config/keymaps.lua`
- Auto commands: Edit `lua/config/autocommands.lua`

### Configuration Flow
1. `init.lua` loads modules in this order: options → keymaps → autocommands → lazy → colorscheme
2. Each module is self-contained and can be edited independently
3. Plugin configurations are loaded automatically by Lazy.nvim

## Important Notes

- No build/test infrastructure exists - this is a personal config repository
- The configuration auto-creates directories when saving files
- Trailing whitespace is automatically removed on save
- Yanked text is briefly highlighted for visual feedback