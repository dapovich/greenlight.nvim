# greenlight.nvim

Greenlights colors based on Jonathan Blow emacs colorscheme.

![screen](./media/cpp_screenshot.png)
    
## Installation
    
```lua
use { "dapovich/greenlight.nvim" }
```
    
## Requirement

- Neovim >= 0.9.1
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for better syntax highlighting (optional)

## :gear: Setup

```lua
vim.cmd.colorscheme "greenlight"
```

Or prefer below if you want to customize some options

```lua
require("greenlight").setup({
    -- your options
})
```

### Default

```lua
require("greenlight").setup({
    transparent = false,
    colors = {},
    themes = function(colors)
        return {}
    end,
    italics = true,
})
```

#### Example

```lua
require("greenlight").setup({
    transparent = true,  -- enable transparent window
    colors = {
        lmao = "#ffffff", -- add new color
        pink = "#ec6075", -- replace default color
    },
    themes = function(colors)
        -- change highlight of some groups,
        -- the key and value will be passed respectively to "nvim_set_hl"
        return {
            Normal = { bg = colors.lmao },
            DiffChange = { fg = colors.white:darken(0.3) },
            ErrorMsg = { fg = colors.pink, standout = true },
            ["@lsp.type.keyword"] = { link = "@keyword" }
        }
    end,
    italics = false, -- disable italics
})
```
