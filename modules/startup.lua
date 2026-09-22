-- تشغيل التطبيقات مع فصلها تماماً عن عملية البدء
os.execute("pgrep -x hypridle >/dev/null || nohup hypridle >/dev/null 2>&1 &")
os.execute("pgrep -x waybar >/dev/null || nohup waybar >/dev/null 2>&1 &")