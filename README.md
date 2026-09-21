## translate
Зависимости:
[[https://github.com/soimort/translate-shell]]

## Neotest + pytest: Python не находится

### Симптом

При запуске тестов через `neotest` появляется ошибка:

ModuleNotFoundError: No module named 'pytest'

Хотя в терминале `pytest` установлен и работает.

### Причина

`neotest-python` ищет интерпретатор по имени `python3` в `$PATH`. Если в директории
с Python (например, `~/.python3.13/bin/`) лежит только версионированный бинарник
(`python3.13`) и нет симлинка `python3`, поиск молча уходит дальше по `$PATH`
и упирается в системный `/usr/bin/python3`, где `pytest` нет.

Дополнительный фактор: Neovim может наследовать `$PATH`, отличный от
интерактивного shell, поэтому добавление пути в `.bashrc`/`.zshrc` не всегда
помогает.

### Диагностика

```vim
" Какой Python видит Neovim
:lua vim.notify(vim.fn.exepath("python3"))

" Что в PATH у Neovim
:lua vim.notify(vim.env.PATH)
```

### Решение
Создать симлинк до python в котором есть pytest
К примеру python3 -> python3.13, тогда он увидит python3
PS - только лучше использовать  полнуый путь до python в котором есть pytest

```bash 
ln -sf ~/.python3.13/bin/python3.13 ~/.python3.13/bin/python3
```

