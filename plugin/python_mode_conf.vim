" pep8 mapping, putting this in ftplugin/python.vim doesn't seem to work
let g:pep8_map='<F3>'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'

" Executable command for documentation search
let g:pydoc = 'pydoc'

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" Load pylint code plugin
let g:pymode_lint = 1

let g:pymode_lint_hold = 0

" Switch pylint or pyflakes code checker
" values (pylint, pyflakes)
let g:pymode_lint_checker = "pep8,pyflakes,mccab"

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors are found
let g:pymode_lint_cwindow = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Place error signs
let g:pymode_lint_signs = 1

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = 0

let g:pymode_rope_always_show_complete_menu = 1

" Load python objects and motion
let g:pymode_motion = 1

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 0

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Set default pymode python indent options
let g:pymode_options_indent = 1

" Set default pymode python fold options
let g:pymode_folding = 0

" Set default pymode python other options
let g:pymode_options_other = 1

" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 1

" don't use tab for snippets since it's the autocomplete key
"let g:snips_trigger_key = ""
"let g:snips_trigger_key_backwards = "::"
