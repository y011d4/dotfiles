if status is-interactive
    # Commands to run in interactive sessions can go here
end

#$BROWSER = "chromium"
set -gx BROWSER "google-chrome-stable"
set -gx EDITOR "/usr/bin/nvim"
set -gx VISUAL "/usr/bin/nvim"
set -gx HISTCONTROL "ignoredups"
set -gx PROMPT "\n{YELLOW}{env_name}{CYAN}{short_cwd}{branch_color}{curr_branch:|{}}{PURPLE} ❯ "
set -gx LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
set -gx INDENT "    "

set -U FZF_LEGACY_KEYBINDINGS 0

function __ghqpeco -d "List git repositories"
  # 必要になったらLBUFFERを定義
  set -l LBUFFER ""
  set -l selected_dir $(ghq list -p | peco --query "$LBUFFER")
  echo $selected_dir
  if test $selected_dir:
      cd $selected_dir
  end
end
bind \cg '__ghqpeco'

# https://blog.matzryo.com/entry/2018/09/02/cd-then-ls-with-fish-shell
functions --copy cd original_cd
function cd
  original_cd $argv; and ls
end

set -g theme_color_scheme dark

bass source $HOME/.virtualenvs/3.10.2/bin/activate

alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
