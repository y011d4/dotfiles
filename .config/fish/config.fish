if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

set -g theme_color_scheme dark