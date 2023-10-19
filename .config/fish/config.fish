if status is-interactive
    # Commands to run in interactive sessions can go here
end

#$BROWSER = "chromium"
set -gx BROWSER "google-chrome-stable"
set -gx EDITOR "/usr/bin/nvim"
set -gx VISUAL "/usr/bin/nvim"
set -gx HISTCONTROL "ignoredups"
# set -gx PROMPT "\n{YELLOW}{env_name}{CYAN}{short_cwd}{branch_color}{curr_branch:|{}}{PURPLE} ❯ "
# set -gx LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
# set -gx INDENT "    "
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -g theme_nerd_fonts yes

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

fish_add_path $HOME/.pyenv/bin
eval "$(pyenv init -)"
if test -e $HOME/.virtualenvs/3.10.9/bin/activate.fish
  source $HOME/.virtualenvs/3.10.9/bin/activate.fish
end

alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# kubernetes
# function ke -d "ke POD_NAME -s SHELL"
#   argparse -N 1 -X 1 "s/shell=" -- $argv
#   or return 1
#   set -lq _flag_shell
#   or set -l _flag_shell "fish"
#   kubectl exec -it $argv[1] -- $_flag_shell
# end
abbr --add ke "kubectl exec -it"
abbr --add kgp "kubectl get pod"
abbr --add kdp "kubectl delete pod"
abbr --add kgj "kubectl get job"
abbr --add kdj "kubectl delete job"
abbr --add kl "kubectl logs"
# function kdp -d "kdp POD_NAME"
#   if test (count $argv) -ne 1
#     echo "usage: kdp POD_NAME"
#     return 1
#   end
#   kubectl delete pod $argv[1]
# end
# function kl -d "kl POD_OR_JOB_NAME"
#   if test (count $argv) -ne 1
#     echo "usage: kl POD_OR_JOB_NAME"
#     return 1
#   end
#   kubectl logs $argv[1]
# end

function diff-less -d "diff and less"
  if test (count $argv) -ne 2
    echo "usage: diff-less OLD NEW"
    return 1
  end
  diff -u $argv[1] $argv[2] | diff-so-fancy | less -R
end

abbr --add gits "git switch"
abbr --add gitc "git checkout"
abbr --add gitf "git fetch"
abbr --add gitm "git merge"
abbr --add gitp "git push"

abbr --add md "mv ~/Downloads/"
abbr --add tarx "tar axvf"

function nvim_edit
  echo nvim $argv
end
# abbr --add nvim_edit_py --position command --regex ".+\.py" --function nvim_edit

abbr --add n nvim

abbr --add pwnenv "docker exec -it pwn bash"

# set -gx DOCKER_HOST "unix:///run/user/1000/docker.sock"
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.dotnet/tools

if test -e $HOME/.cargo/env
  bass source $HOME/.cargo/env
end

set -gx FLYCTL_INSTALL "/home/y011d4/.fly"
fish_add_path $FLYCTL_INSTALL/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/y011d4/google-cloud-sdk/path.fish.inc' ]; . '/home/y011d4/google-cloud-sdk/path.fish.inc'; end

set -ga fish_user_paths /home/y011d4/.nimble/bin
