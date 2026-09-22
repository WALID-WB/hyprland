-- Keybindings.

local vars = require("modules.vars")
local m = vars.main_mod

-- Terminal.
hl.bind(m .. "+Q", hl.dsp.exec_cmd(vars.terminal))

-- Close focused window.
hl.bind(m .. "+C", hl.dsp.window.close())

-- Old power/shutdown binding from the example config.
-- It was malformed and potentially unsafe, so it is kept commented.
-- hl.bind(m .. "+M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Safer logout binding.
-- This exits Hyprland. It does not shut down the computer.
hl.bind(m .. "+SHIFT+Q", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- File manager.
hl.bind(m .. "+E", hl.dsp.exec_cmd(vars.file_manager))

-- Toggle floating.
hl.bind(m .. "+V", hl.dsp.window.float({ action = "toggle" }))

-- App menu / runner.
hl.bind(m .. "+R", hl.dsp.exec_cmd(vars.menu))

-- Pseudo layout.
hl.bind(m .. "+P", hl.dsp.window.pseudo())

-- Toggle split, dwindle only.
hl.bind(m .. "+J", hl.dsp.layout("togglesplit"))

-- Move focus with arrow keys.
hl.bind(m .. "+left",  hl.dsp.focus({ direction = "left" }))
hl.bind(m .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(m .. "+up",    hl.dsp.focus({ direction = "up" }))
hl.bind(m .. "+down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces using physical number-row keycodes.
-- This is AZERTY-friendly: it binds the physical keys, not the printed symbols.
-- Physical keycodes:
-- 10 = &
-- 11 = é
-- 12 = "
-- 13 = '
-- 14 = (
-- 15 = -
-- 16 = è
-- 17 = _
-- 18 = ç
-- 19 = à

for i = 1, 10 do
    local code = i + 9

    -- Switch to workspace
    hl.bind(m .. "+code:" .. code, hl.dsp.focus({ workspace = i }))

    -- Move focused window to workspace
    hl.bind(m .. "+SHIFT+code:" .. code, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace / scratchpad.
hl.bind(m .. "+S", hl.dsp.workspace.toggle_special(vars.special_workspace))
hl.bind(m .. "+SHIFT+S", hl.dsp.window.move({
    workspace = "special:" .. vars.special_workspace,
}))

-- Scroll through existing workspaces.
hl.bind(m .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(m .. "+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse.
hl.bind(m .. "+mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(m .. "+mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume keys.
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

-- Brightness keys.
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)

-- Media keys.
-- Requires playerctl.
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("code:200", hl.dsp.exec_cmd("grim - | wl-copy"))

hl.bind("Menu", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))