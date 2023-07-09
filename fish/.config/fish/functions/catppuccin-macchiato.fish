function catppuccin-macchiato
    kitty +kitten themes --reload-in=all Catppuccin-Macchiato
    set helix_config_path ~/.config/helix/config.toml
    set helix_new_theme 'theme = "catppuccin_macchiato"'

    gsed -i "1s/.*/$helix_new_theme/" $helix_config_path

    set nvim_config_path ~/.config/nvim/lua/custom/plugins/colorscheme.lua
    set nvim_new_theme 'vim.cmd.colorscheme "catppuccin-macchiato"'

    gsed -i "8s/.*//" $nvim_config_path
    gsed -i "17s/.*//" $nvim_config_path
    gsed -i "26s/.*//" $nvim_config_path
    gsed -i "35s/.*//" $nvim_config_path
    gsed -i "44s/.*/$nvim_new_theme/" $nvim_config_path
end