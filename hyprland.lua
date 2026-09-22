-- Hyprland Lua configuration
-- Main entry point.
require("modules.vars")
require("modules.monitors")
require("modules.environment")
require("modules.permissions")
require("modules.appearance")
require("modules.animations")
require("modules.layout")
require("modules.input")
require("modules.windows")
require("modules.workspaces")
require("modules.keybinds")
require("modules.startup")
-- تشغيل التطبيقات مع فصلها تماماً عن عملية البدء
os.execute("pgrep -x hypridle >/dev/null || nohup hypridle >/dev/null 2>&1 &")
os.execute("pgrep -x waybar >/dev/null || nohup waybar >/dev/null 2>&1 &")
