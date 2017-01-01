#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10035200 6b9c70c2892ebfd926cf4d8ab7e02522c6d78e92 7270400 a9cf4a26640e84a6ae7b2a36d1fb16b57b555a36
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10035200:6b9c70c2892ebfd926cf4d8ab7e02522c6d78e92; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7270400:a9cf4a26640e84a6ae7b2a36d1fb16b57b555a36 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 6b9c70c2892ebfd926cf4d8ab7e02522c6d78e92 10035200 a9cf4a26640e84a6ae7b2a36d1fb16b57b555a36:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
