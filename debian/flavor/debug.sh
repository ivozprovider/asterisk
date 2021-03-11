# Change package name
sed -i 's#Source: ivozprovider-asterisk#&-dbg#' debian/control
sed -i 's#Package: ivozprovider-asterisk#&-dbg#' debian/control
sed -i 's#ivozprovider-asterisk#&-dbg#' debian/changelog

# Add conflict with original asterisk package
sed -i 's#Conflicts:#Provides: ivozprovider-asterisk\n&#' debian/control
sed -i 's#Conflicts:#Replaces: ivozprovider-asterisk\n&#' debian/control

# Add menuselect options for debugging symbols
sed -i 's#\tdh_auto_build#\tmenuselect/menuselect --enable DONT_OPTIMIZE menuselect.makeopts\n&#' debian/rules
sed -i 's#\tdh_auto_build#\tmenuselect/menuselect --enable DEBUG_THREADS menuselect.makeopts\n&#' debian/rules

# Add debugging symbols
sed -i 's#override_dh_auto_build#override_dh_strip:\n&#' debian/rules
sed -i 's#override_dh_auto_build#\tdh_strip -a --dbg-package=ivozprovider-asterisk-dbg\n\n&#' debian/rules

sed -i 's#override_dh_auto_configure#DEB_CFLAGS_MAINT_SET=-g -O0\n\n&#' debian/rules
