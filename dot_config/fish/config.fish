# Set XDG configuration defaults
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_DATA_DIRS /usr/local/share/:/usr/share/
set -gx XDG_CONFIG_DIRS /etc/xdg
set -gx XDG_CACHE_HOME $HOME/.cache

if status is-interactive
    # Commands to run in interactive sessions can go here

    # mise - dev environment and tools
    mise=(which mise) $mise activate fish | source

    # zoxide - improved & smarter cd
    zoxide init fish | source

    # set default editor to neovim
    set -gx EDITOR nvim

    # add completion scripts
    gh completion -s fish | source

    # setup go
    set -x GOPATH "$HOME/go"
    fish_add_path "$GOPATH/bin"

    # setup rust
    source "$HOME/.cargo/env.fish"

    # macos config
    if test (uname) = Darwin
        # homebrew
        if not contains /opt/homebrew/bin $PATH
            fish_add_path /opt/homebrew/bin
        end
    end
end
