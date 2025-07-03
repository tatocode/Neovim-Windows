# 🐍 Minimal Neovim Configuration for Python Development(Windows)

> ⚠️ **Note**: This configuration is specifically designed for Python development.

## 🚀 How to Use

1. **Install the Latest Version of Neovim**

   Download Neovim from the official website:
   👉 [https://neovim.io](https://neovim.io)

2. **Install Lazy.nvim to Manage Plugins**

   Open PowerShell and run:

   ```pwsh
   git clone https://github.com/folke/lazy.nvim `
     "$env:LOCALAPPDATA\nvim-data\site\pack\lazy\start\lazy.nvim"
   ```

3. **Clone This Repository into Your Neovim Configuration Directory**

    ```pwsh
    git clone https://github.com/tatocode/Neovim-Windows.git "$env:TEMP\Neovim-Windows"; Copy-Item "$env:TEMP\Neovim-Windows\init.lua" "$env:LOCALAPPDATA\nvim\" -Force
    ```

4. **Launch Neovim**

   All required plugins will be installed automatically on the first run.

5. **Enjoy Python Development in Neovim!**

---

## 💡 Additional Requirements

To unlock full functionality, make sure to install the following tools:

* **Code Completion**
  Install `pyright` via npm:

  ```bash
  npm install -g pyright
  ```

* **Code Formatting**
  Install `black` in your current Python environment:

  ```bash
  pip install black
  ```

* **Using Conda Environments**
  If you're using Conda, activate your environment **before** launching Neovim.
