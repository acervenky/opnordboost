RUNONCE=true

patch_mixer_toplevel() {
  case $1 in
    -c) if [ "$(grep "<ctl name=\"$2\" value=\".*\" />" $MODPATH/system/vendor/etc/mixer_paths.xml)" ]; then
          local num=$(sed -n "/<ctl name=\"$2\" value=\".*\" \/>/=" $MODPATH/system/vendor/etc/mixer_paths.xml | head -n1)
          sed -i "$num s/\(<ctl name=\"$2\" value=\"\).*\(\" \/>\)/\1$3\2/" $MODPATH/system/vendor/etc/mixer_paths.xml
        fi;;
    -p) if [ "$(sed -n "/ *<path name=\"$2\">/,/ *<\/path>/ {/<ctl name=\"$3\" value=\".*\" \/>/p}" $MODPATH/system/vendor/etc/mixer_paths.xml)" ]; then
          sed -i "/ *<path name=\"$2\">/,/ *<\/path>/ s/\(<ctl name=\"$3\" value=\".*\" \/>\)/\1\n        <ctl name=\"$4\" value=\"$5\" \/>/" $MODPATH/system/vendor/etc/mixer_paths.xml
        fi;;
  esac
}

patch_mixer_toplevel -c "HPHL Volume" "24"
patch_mixer_toplevel -c "HPHR Volume" "24"
patch_mixer_toplevel -c "WSA_RX0 Digital Volume" "88"
patch_mixer_toplevel -c "WSA_RX1 Digital Volume" "88"
patch_mixer_toplevel -c "RX_RX0 Digital Volume" "88"
patch_mixer_toplevel -c "RX_RX1 Digital Volume" "88"
patch_mixer_toplevel -c "RX_RX2 Digital Volume" "88"


