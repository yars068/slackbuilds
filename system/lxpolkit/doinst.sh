# use lxpolkit by default in LXDE disabling polkit-gnome under this DE
# thanks to ricky cardo of LQ
ALREADY=$(grep LXDE /etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop)
if [ ! $ALREADY ]; then
  sed -i -e 's|KDE|KDE;LXDE|' /etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop
fi
