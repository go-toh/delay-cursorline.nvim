# delay-cursorline.nvim
Simple plugin for neovim to delay highlighting of cursor line when line is moved.

### Install

Install with [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'go-toh/delay-cursorline'
```

### Usage

```lua
require('delay-cursorline').setup()
```

### Configuration

```lua
-- Default setting
-- delay = {
--   enable = true,
--   time = 500,
-- }


require('delay-cursorline').setup {
  delay = {
    time = 1000,
  }
}
```
