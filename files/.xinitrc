# Visual bell
xset b off
xset b 0 0 0

# Load my keymaps and resources
xmodmap $HOME/.xmodmap
xrdb -merge $HOME/.Xresources

# Server for urxvt
/usr/bin/urxvtd -q -o -f

auto-disper -c &

# AWESOME!
/usr/bin/awesome 2>&1 > /tmp/awesome.log
