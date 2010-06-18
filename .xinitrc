# XQuartz.app starts in the root directory; I want to go home.
cd $HOME

# Visual bell
xset b off
xset b 0 0 0

# Load my keymaps and resources
xmodmap $HOME/.xmodmap
xrdb -merge $HOME/.Xresources

# Server for urxvt
/opt/local/bin/urxvtd -q -o -f

# AWESOME!
/usr/local/bin/awesome 2>&1 > /tmp/awesome.log
