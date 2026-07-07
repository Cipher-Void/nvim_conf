# О конфигурации

Это моя конфигурация Neovim, оптимизированная под **слабое железо (HDD + DDR3)**: минимум плагинов, ленивая загрузка, отключённое автодополнение по таймеру и лишние модули.

Основные сценарии работы:
- Python / Django
- HTML / CSS / Bootstrap (Emmet)
- JavaScript / TypeScript
- Markdown / Obsidian

Я стремился создать минималистичную, но функциональную среду, уделяя особое внимание оптимизации и удобству использования. Ещё я любитель прозрачных фонов :)

<img width="1760" height="1033" alt="image" src="https://github.com/user-attachments/assets/f57e4d56-65fb-4405-8f65-47c20d8f15ad" />

> Медленная загрузка на видео/скриншоте — из-за HDD, а не из-за конфига.

---

# Зависимости

## Обязательные
- **Neovim 0.11+** — используется новый LSP API (`vim.lsp.config` / `vim.lsp.enable`).
- **git** — для установки плагинов через lazy.nvim.
- **C-компилятор + make** — для сборки `telescope-fzf-native` и `LuaSnip` (`jsregexp`).
- **ripgrep** — для `live_grep` в Telescope.
- **Буфер обмена** (`xclip` / `xsel` / `wl-clipboard`) — включён `clipboard = "unnamedplus"`.

## Для языков
- **Python** — интерпретатор и `pyright` (LSP).
- **Node.js + npm** — для установки LSP-серверов.

**Примечание:** рекомендуется использовать вместе с моими dotfiles: [linux_conf](https://github.com/Cipher-Void/linux_conf).

---

# Установка

Файлы конфигурации должны лежать в `~/.config/nvim`:
```bash
git clone https://github.com/Cipher-Void/nvim_conf ~/.config/nvim
```
Если директории не существует, создайте её:
```bash
mkdir -p ~/.config/nvim
```

При первом запуске `nvim` плагины установятся автоматически через `lazy.nvim`.

## LSP-серверы

Серверы **не устанавливаются автоматически** (mason не используется) — их нужно поставить вручную.

### npm
Добавьте в `PATH` (в `.bashrc`/`.zshrc`) путь к глобальным пакетам npm:
```bash
export PATH="$PATH:/usr/local/bin:/usr/local/lib/node_modules"
```
Удобный алиас:
```bash
alias n=nvim
```
Установка серверов через npm:
```bash
# HTML / CSS (html, cssls)
npm i -g vscode-langservers-extracted
# Emmet
npm i -g emmet-ls
# Python
npm i -g pyright
# TypeScript / JavaScript
npm i -g @vtsls/language-server
```

### Отдельно
- **lua-language-server** (`lua_ls`) — установите через пакетный менеджер системы.

Включённые в конфиге серверы: `html`, `cssls`, `lua_ls`, `emmet_ls`, `pyright`, `vtsls`.

---

# Состав (плагины)

### Поиск и навигация
- `telescope.nvim` + `telescope-fzf-native.nvim` (`plenary.nvim`)
- `todo-comments.nvim`

### LSP и автодополнение
- `nvim-lspconfig`
- `nvim-cmp` + `cmp-nvim-lsp` + `cmp-path` + `cmp_luasnip`
- `LuaSnip` (+ собственные сниппеты в `snippets/`)
- `lazydev.nvim` (для разработки Lua-плагинов)
- Emmet через `emmet_ls`

### Редактор
- `gitsigns.nvim`
- `auto-save.nvim` (автосохранение, кроме конфига nvim)
- `autoclose.nvim`
- `nvim-surround`
- `Comment.nvim`

### Markdown / Obsidian
- `obsidian.nvim`
- `render-markdown.nvim` (+ `mini.icons`)
- `markdown-table-wrap.nvim`

### Оформление
- `kanagawa.nvim` (тема `kanagawa-dragon`)
- `snacks.nvim` (только dashboard)
- `nvim-treesitter`

### Сессии / прочее
- `vim-obsession` (+ команды `:LoadSession` / `:LS`)

### Utils
- `lazy.nvim`
- `plenary.nvim`

> Плагин `obsidian-addon.nvim` подключён в dev-режиме из локального пути (`~/projects/other/obsidian-addon.nvim/`) — это личный плагин, у вас его может не быть. Уберите/закомментируйте `lua/plugins/obsidian-addon.lua`, если он не нужен.

---

# Горячие клавиши

Leader — это `,` (запятая).

### Общие
| Клавиша | Действие |
|---|---|
| `jk` (insert/term) | Выход в normal-режим |
| `<leader><Space>` | Убрать подсветку поиска |
| `H` / `L` | Предыдущая / следующая вкладка |
| `<leader>e` | Открыть netrw (`:Texplore $PWD`) |

### Буферы
| Клавиша | Действие |
|---|---|
| `[b` / `]b` | Предыдущий / следующий буфер |
| `gw` | Закрыть буфер |
| `<leader>bb` | Предыдущий буфер (`:b#`) |

### Окна
| Клавиша | Действие |
|---|---|
| `<leader>wv` | Вертикальный сплит |
| `<leader>wh` | Горизонтальный сплит |
| `<leader>ww` | Следующее окно |

### Quickfix
| Клавиша | Действие |
|---|---|
| `]q` / `[q` | Следующий / предыдущий элемент |
| `<leader>qq` | Закрыть quickfix |
| `<leader>qr` | Обновить из буфера |

### Запуск кода
| Клавиша | Действие |
|---|---|
| `<C-h>` (python) | Сохранить и запустить файл |
| `<C-h>` (cpp) | Сохранить, скомпилировать и запустить |

### Telescope
| Клавиша | Действие |
|---|---|
| `<leader>ff` | Поиск файлов |
| `<leader>fg` | Поиск по содержимому (live grep) |
| `<leader>fr` | Недавние файлы |
| `<leader>fb` | Буферы |
| `q` (в Telescope) | Закрыть |

### LSP
| Клавиша | Действие |
|---|---|
| `gd` / `gr` | Определение / ссылки |
| `K` | Документация (hover) |
| `<C-k>` | Подсказка сигнатуры |
| `<space>rn` | Переименовать |
| `<space>ca` | Code action |
| `<space>e` | Диагностика (float) |
| `<space>q` | Диагностика в loclist |
| `<space>f` | Форматировать |
| `[d` / `]d` | Предыдущая / следующая диагностика |

### Комментарии
| Клавиша | Действие |
|---|---|
| `<leader>cc` | Комментировать строку |
| `<leader>cb` | Комментировать блок |
| `<leader>c` (visual) | Комментировать строки |
| `<leader>b` (visual) | Комментировать блок |

### TODO
| Клавиша | Действие |
|---|---|
| `<leader>td` | Список TODO (`:TodoTelescope`) |

### Git (gitsigns)
| Клавиша | Действие |
|---|---|
| `]h` / `[h` | Следующий / предыдущий hunk |
| `]H` / `[H` | Последний / первый hunk |
| `<leader>ghs` / `<leader>ghr` | Stage / reset hunk |
| `<leader>ghS` / `<leader>ghR` | Stage / reset buffer |
| `<leader>ghu` | Отменить stage |
| `<leader>ghp` | Предпросмотр hunk |
| `<leader>ghb` / `<leader>ghB` | Blame строки / буфера |
| `<leader>ghd` / `<leader>ghD` | Diff |
| `ih` | Text-object: hunk |

### Сниппеты (LuaSnip)
| Клавиша | Действие |
|---|---|
| `<A-j>` | Раскрыть / прыжок вперёд |
| `<A-k>` | Прыжок назад |

### Автодополнение (nvim-cmp)
| Клавиша | Действие |
|---|---|
| `<C-Space>` | Вызвать меню (автопоказ выключен) |
| `<C-e>` | Закрыть меню |
| `<CR>` | Подтвердить |
| `<C-p>` / `<C-n>` | Вверх / вниз |

### Obsidian (`<leader>o…`)
| Клавиша | Действие |
|---|---|
| `<leader>on` / `<leader>oN` | Новая заметка / из шаблона |
| `<leader>oo` | Открыть в приложении |
| `<leader>oq` | Быстрое переключение |
| `<leader>os` / `<leader>ot` / `<leader>ob` | Поиск / теги / бэклинки |
| `<leader>od` / `<leader>oy` / `<leader>om` | Заметки сегодня / вчера / завтра |
| `<leader>ox` | Переключить чекбокс |
| `<leader>ol` / `<leader>oL` (visual) | Ссылка / новая ссылка |
| `<leader>ow` | Сменить workspace |
| `gd` (markdown) | Перейти по ссылке |

### Сессии
| Команда | Действие |
|---|---|
| `:Obsession` | Начать запись сессии в `Session.vim` |
| `:LoadSession` / `:LS` | Загрузить `Session.vim` |
