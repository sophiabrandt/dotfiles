function rose-pine-dawn
    kitty +kitten themes --reload-in=all Rosé Pine Dawn
    set helix_config_path ~/.config/helix/config.toml
    set helix_new_theme 'theme = "rose_pine_dawn"'

    gsed -i "1s/.*/$helix_new_theme/" $helix_config_path

    set nvim_config_path ~/.config/nvim/lua/custom/plugins/colorscheme.lua
    set nvim_new_theme 'vim.cmd.colorscheme "rose-pine-dawn"'

    gsed -i "8s/.*//" $nvim_config_path
    gsed -i "17s/.*//" $nvim_config_path
    gsed -i "26s/.*/$nvim_new_theme/" $nvim_config_path
    gsed -i "35s/.*//" $nvim_config_path
    gsed -i "44s/.*//" $nvim_config_path
end
