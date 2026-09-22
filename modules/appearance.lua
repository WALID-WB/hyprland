-- Appearance and general look.

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        -- Resize windows by dragging borders/gaps.
        resize_on_border = false,

        -- Tearing can improve latency in some games, but can also cause artifacts.
        -- Keep false for stability.
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    misc = {
        -- -1 keeps default Hyprland behavior.
        -- Set to 0 or 1 only if you want to force/disable the default wallpaper.
        force_default_wallpaper = -1,

        -- Keep the Hyprland logo/background unless you replace it properly.
        disable_hyprland_logo = false,
    },
})