## Windows

On Windows, set `FULLY_PORTABLE=true` at the first line in `bashrc`.

Install WSL and use `Alacritty-v0.15.1-portable.bat` to launch. This setup logs into WSL and exposes a terminal through Alacritty. This directory is portable and can be moved around; all configuration is provided locally with `$HOME` pointing to this directory.

## Unix-like

On Unix-like systems, `FULLY_PORTABLE=false` is also possible for a system-integrated setup. Place this directory at `~/nomad` and create the following links:

```
ln -s ~/nomad/bashrc ~/.bashrc
ln -s ~/nomad/alacritty.toml ~/.alacritty.toml
ln -s ~/nomad/.gitconfig ~/.gitconfig
```

### VT

`bashrc` sets up the palette, attaches to tmux, and sets up Ctrl-number shortcuts for switching tmux windows. It also attempts to detect the screen size and configure terminal size accordingly.

To boot to the VT, set `sudo systemctl set-default multi-user.target`; to change back: `graphical.target`. For Raspberry Pi, option also available in Control Centre: *System → Boot: To CLI*,

To select the font globally (taking effect during boot, before login), edit `/etc/default/console-setup`:

```
FONTFACE="Terminus"
FONTSIZE="8x16"
```

To further adjust screen size & rotation:

```
fbset -g 800 480 800 480 16   # 800x480 16bpp
echo 2 | sudo tee /sys/class/graphics/fbcon/rotate  # Upside down
```

### Raspberry Pi: VT / desktop switching

Start desktop environment:

```
sudo service lightdm start
```

Press Ctrl-F7 (may be at F8, if the login greeter is enabled; edit /etc/lightdm/lightdm.conf to add `autologin-user`).

Screen resolution is based on global persistent configuration, rather than being auto-detected. To avoid excessively operating the Control Centre GUI, write and reload configuration from the command line:

```
echo -e 'profile {\n\t\toutput HDMI-A-1 enable scale 1.000000 mode 1920x1080@60.000 position 0,0 transform normal\n}' > ~/.config/kanshi/config && pkill --signal SIGHUP kanshi
```

See [code for Control Centre's screen configuration plugin](https://github.com/raspberrypi-ui/raindrop/blob/1e80c2f/src/labwc.c).

Might also edit `/etc/xdg/labwc-greeter/config.kanshi` for the log-in screen.

### FbTerm

For enhanced display (especially CJK/Unicode characters) as well as input method support. This setup uses Fcitx 5.

```
apt install fbterm fcitx5-frontend-fbterm
# Enable raw keystroke capture
sudo setcap 'cap_sys_tty_configg+ep' /usr/bin/fbterm
# Ensure current user is in the `video` group
getent group video
```

To start an Fcitx daemon:

```
dbus-launch fcitx5 -d
# A message is needed to activate daemon?
dbus-send --session --print-reply --dest=org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.State
```

Run in raw VT:

```
fbterm -i fcitx5-fbterm --font-names='Source Code Pro' --font-size=24
```

Ctrl-Space to enable IME. Note that this conflicts with Fcitx's default IME toggle hotkey; edit `~/.config/fcitx5/config` or use `fcitx5-configtool` to add another, maybe `Ctrl+Shift_L`.

FbTerm intercepts Ctrl-Alt-F\<n\> VT switch hotkeys. Either use Alt/Meta-Left/Right instead, or use Ctrl-Alt-E to exit FbTerm.
