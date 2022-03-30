" clear cache so this reloads changes.
" useful for development
" lua package.loaded['evernight'] = nil
" lua package.loaded['evernight.theme'] = nil
" lua package.loaded['evernight.colors'] = nil
" lua package.loaded['evernight.utils'] = nil
lua package.loaded['evernight.config'] = nil

lua require('evernight').colorscheme()
