# Dirs

RESCUE=$(pwd)
RESCUEROOT=$RESCUE/root
RESCUEBOOT=$RESCUEROOT/boot
RESCUEBOOTDEV=/dev/sdd1
VER=31
FCVER=fc$VER

# Imgs
RESCUEIMG=$RESCUE/tinhat.img

# LVM
RESCUEVG=vgmarble
RESCUELV=lvroot
RESCUEROOTDEV=/dev/$RESCUEVG/$RESCUELV

unset -f dnf-tinhat
function dnf-tinhat {
  dnf --releasever=31 --installroot ${RESCUEROOT} $@
}

unset -f rpm-tinhat
function rpm-tinhat {
  rpm -r ${RESCUEROOT} $@
}
