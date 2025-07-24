if status is-interactive
    # Commands to run in interactive sessions can go here

    # mise - dev environment and tools
    ~/.local/bin/mise activate fish | source

    # zoxide - improved & smarter cd
    zoxide init fish | source

    # set default editor to neovim
    set -gx EDITOR nvim

    # macos config
    if test (uname) = Darwin
        # homebrew
        fish_add_path /opt/homebrew/bin/
    end
end
