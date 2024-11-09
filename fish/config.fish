# Paths
set -x PATH /opt/homebrew/bin $PATH
set -x PATH $PATH ~/go/bin

# Aliases
alias vim="nvim"
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux DBUS_SESSION_BUS_ADDRESS "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# Custom Function `yy` for Fish
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    if test -s $tmp
        cd (cat $tmp)
    end
    rm -f $tmp
end

# NVM Configuration
set -x NVM_DIR "$HOME/.nv"
status is-interactive; and source (jump shell fish | psub)
function __jump_chpwd
    jump chdir
end
function j
    set dir (jump cd $argv)
    test -d $dir; and cd $dir
end

# Load Starship Prompt
starship init fish | source
