# Load environmental variables
[ -f "$HOME/.zshenv" ] && . "$HOME/.zshenv"

# Start compositor
compton &

# Disable display power management
# xset -dpms &
# xset s off &

# Load xresources
xrdb -merge "$HOME/.config/xresources" &

# ibus
export GTK_IM_MODULE="ibus"
# export GLFW_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
ibus-daemon &

# Configure touchpad (ws-jade-01)
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1 &
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1 &
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Accel Speed" 0.4 &

# Configure touchpad (ws-jade-02)
xinput --set-prop "Asus TouchPad" "libinput Tapping Enabled" 1 &
xinput --set-prop "Asus TouchPad" "libinput Natural Scrolling Enabled" 1 &
xinput --set-prop "Asus Touchpad" "libinput Accel Speed" 0.4 &

# Start cursor hiding daemon
unclutter &

# Start touchpad gestures daemon
libinput-gestures &

# Load Pulseaudio bell
# pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell &
# pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY &

# Start terminal daemon (if not using kitty)
# urxvtd -q -o -f &

# Thunar daemon
thunar --daemon &

# Load keyboard layout modifications
xmodmap "$HOME/.config/xmodmap" &

# Start AwesomeWM
exec dbus-launch --exit-with-session --sh-syntax awesome
