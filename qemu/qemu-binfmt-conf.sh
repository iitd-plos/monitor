#!/bin/sh
# enable automatic i386/ARM/SPARC/PPC program execution by the kernel

# load the binfmt_misc module
/sbin/modprobe binfmt_misc

# probe cpu type
cpu=`uname -m`
case "$cpu" in
  i386|i486|i586|i686|i86pc|BePC)
    cpu="i386"
  ;;
  "Power Macintosh"|ppc|ppc64)
    cpu="ppc"
  ;;
  armv4l)
    cpu="arm"
  ;;
esac

# register the interpreter for each cpu except for the native one
if [ $cpu != "i386" ] ; then
    echo ':i386:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00:\xff\xff\xff\xff\xff\xfe\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-i386:' > /proc/sys/fs/binfmt_misc/register
    echo ':i486:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x06\x00:\xff\xff\xff\xff\xff\xfe\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-i386:' > /proc/sys/fs/binfmt_misc/register
fi
if [ $cpu != "arm" ] ; then
    echo   ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-arm:' > /proc/sys/fs/binfmt_misc/register
    echo   ':armeb:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-armeb:' > /proc/sys/fs/binfmt_misc/register
fi
if [ $cpu != "sparc" ] ; then
    echo   ':sparc:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-sparc:' > /proc/sys/fs/binfmt_misc/register
fi
if [ $cpu != "ppc" ] ; then
    echo   ':ppc:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x14:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-ppc:' > /proc/sys/fs/binfmt_misc/register
fi
if [ $cpu != "mips" ] ; then
    echo   ':mips:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-mips:' > /proc/sys/fs/binfmt_misc/register
    echo   ':mipsel:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-mipsel:' > /proc/sys/fs/binfmt_misc/register
fi
