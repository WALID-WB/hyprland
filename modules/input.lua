---@diagnostic disable: undefined-global
-- Input configuration.

hl.config({
    input = {
        kb_layout  = "fr,ma",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity = 0.3,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Three-finger horizontal swipe changes workspace.
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})
