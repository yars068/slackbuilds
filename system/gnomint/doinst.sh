if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime &> /dev/null
fi

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database &> /dev/null
fi

if [ -x /usr/bin/gtk-update-icon-cache ]; then
  /usr/bin/gtk-update-icon-cache  -f -q /usr/share/icons/hicolor &> /dev/null
fi

if [ -x usr/bin/gconftool-2 ]; then
  ( cd $PKG/etc/gconf/schemas
  GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" \
  usr/bin/gconftool-2 --makefile-install-rule \
  etc/gconf/schemas/gnomint.schemas >/dev/null 2>&1 )
fi
