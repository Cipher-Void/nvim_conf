# about 
Это моя конфигурация Neovim, оптимизированная для быстрой и эффективной разработки, в частности, для работы с 
- Python/Django
- HTML/CSS и Bootstrap
Я стремился создать минималистичную, но функциональную среду разработки, уделяя особое внимание оптимизации и удобству использования.

Так же я любитель прозрачных фонов)))
<img width="1760" height="1033" alt="image" src="https://github.com/user-attachments/assets/f57e4d56-65fb-4405-8f65-47c20d8f15ad" />
Такая загрузка так как у меня hdd

# Зависимости:
- Neovim (версия 0.8+).
- Python (для поддержки Python/Django).
- Node.js (для установки LSP серверов).
- ripgrep (для работы с telescope-fzf-native).

**Примечание:** Для работы с этой конфигурацией также рекомендуется использовать конфигурацию dotfiles [linux_conf](https://github.com/Cipher-Void/linux_conf).

## Установка
Убедитесь, что все файлы конфигурации находятся в директории ~/.config/nvim (в вашем домашнем каталоге). Если директории ~/.config/nvim не существует, создайте ее: 
```bash
mkdir -p ~/.config/nvim
```

### bashrc
В переменную PATH добавьте (Это для серверов которые мы установим при помощи npm)
```bashrc
/usr/local/bin:/usr/local/lib/node_modules
```
А так же сокращение n=nvim
```
alias n=nvim
```
### npm
Для автоматического форматирования и autocmp HTML/CSS кода вам необходимо установить следующие LSP серверы с помощью npm:
```
sudo npm install -g vscode-html-languageserver-bin
```
```
sudo npm install -g vscode-css-languageserver-bin
```

## Сборка
- Для поиска и навигации по файлам:
  - telescope.nvim
  - telescope-fzf-native.nvim 
  - todo-comments.nvim
- Для LSP
  - nvim-lspconfig
  - cmp-nvim-lsp
  - nvim-cmp 
  - Плагиды для html/css/bootstrap
    - emmet-vim
    - nvim-html-css
- Редактор
  - gitsigns.nvim
  - auto-save.nvim
  - autoclose.nvim
  - Comment.nvim
- Оформление
  - kanagawa.nvim
  - snacks.nvim (только dashboard)
  - nvim-treesitter
- Utils
  - lazy.nvim
  - plenary.nvim 
# Keymaps
Чуть позже оформлю этот раздел
```
Telescope keypas
```
