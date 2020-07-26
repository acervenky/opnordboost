##########################################################################################
#
# Copy original mixer_paths_qrd.xml and run script to add stereo effects into it.
# 
#
##########################################################################################

# Copy files and run scripts
mkdir -p $MODPATH/system/vendor/etc
ui_print "Patching Mixer"
cp -f /system/vendor/etc/mixer_paths_qrd.xml $MODPATH/system/vendor/etc/mixer_paths_qrd.xml
. $MODPATH/.aml.sh
ui_print "Installation Successful!"
ui_print "By acervenky@XDA"

# Default permissions
set_perm_recursive $MODPATH 0 0 0755 0644
