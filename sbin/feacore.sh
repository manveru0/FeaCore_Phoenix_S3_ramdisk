#!/sbin/busybox sh

mount -o remount,rw /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs

if [ ! -f /system/app/STweaks.apk ]; then
  cat /res/STweaks.apk > /system/app/STweaks.apk
  chown 0.0 /system/app/STweaks.apk
  chmod 644 /system/app/STweaks.apk
fi

/res/uci.sh apply

/sbin/busybox mount -t rootfs -o remount,ro rootfs
mount -o remount,ro /system
