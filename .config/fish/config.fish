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
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

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

if test -e $HOME/.virtualenvs/3.10.2/bin/activate.fish
  source $HOME/.virtualenvs/3.10.2/bin/activate.fish
end

alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# kubernetes
function ke -d "ke POD_NAME -s SHELL"
  argparse -N 1 -X 1 "s/shell=" -- $argv
  or return 1
  set -lq _flag_shell
  or set -l _flag_shell "fish"
  kubectl exec -it $argv[1] -- $_flag_shell
end
alias kgp="kubectl get pod"
alias kgp="kubectl get pod"
alias kgj="kubectl get job"
alias kdja="kubectl delete job --all"
function kdp -d "kdp POD_NAME"
  if test (count $argv) -ne 1
    echo "usage: kdp POD_NAME"
    return 1
  end
  kubectl delete pod $argv[1]
end
function kl -d "kl POD_OR_JOB_NAME"
  if test (count $argv) -ne 1
    echo "usage: kl POD_OR_JOB_NAME"
    return 1
  end
  kubectl logs $argv[1]
end


set -gx DOCKER_HOST "unix:///run/user/1000/docker.sock"
fish_add_path $HOME/bin

eval "$(pyenv init -)"
