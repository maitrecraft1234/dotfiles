#Enter script code
import os

zoom_w = 320 # Change this to the width you want Minecraft to be in after Tall Resolution is toggled on.
zoom_h = 16384 # Do not change this unless you know what you are doing.
zoom_x = 1920 + 800 # Change this to the x coordinate you want Minecraft to go to when Tall Resolution is toggled on.
zoom_y = (1080 - zoom_h) // 2 # Do not change this unless you know what you are doing.

normal_w = 1920 # Change this to the width you want Minecraft to be in after Tall Resolution is toggled off.
normal_h = 1080 # Change this to the height you want Minecraft to be in after Tall Resolution is toggled off.
normal_x = 1920 # Change this to the x coordinate you want Minecraft to go to when Tall Resolution is toggled off.
normal_y = 0 # Change this to the y coordinate you want Minecraft to go to when Tall Resolution is toggled off.

normal_multiplier = 0.4 # Change this to the multipler you took from the table.
zoom_multiplier = 0.4 # Change this to your pleasing by referring to the table (default = 0.0315 = cursor speed 1).
device_id = 9 # Change this to the correct device id that you noted down before.

# Do not change anything after this!
os.system("xdotool getactivewindow getwindowgeometry | grep Geometry > /tmp/res")
f = open("/tmp/res")
cur_h = f.read().strip().split(':')[1].strip().split('x')[1]
f.close()

if(int(cur_h) == normal_h):
    if "Minecraft" in window.get_active_title():
        os.system(f"wmctrl -R ':ACTIVE:' -e 0,{zoom_x},{zoom_y},{zoom_w},{zoom_h}")
        os.system(f"xinput set-prop {device_id} 'Coordinate Transformation Matrix' {zoom_multiplier} 0 1729 0 {zoom_multiplier} 325 0 0 1")

else:
    os.system(f"wmctrl -R ':ACTIVE:' -e 0,{normal_x},{normal_y},{normal_w},{normal_h}")
    os.system(f"xinput set-prop {device_id} 'Coordinate Transformation Matrix' {normal_multiplier} 0 1729 0 {normal_multiplier} 325 0 0 1")
