# Dirs

RESCUE=$(pwd)
RESCUEROOT=$RESCUE/root
RESCUEBOOT=$RESCUEROOT/boot

# Imgs
RESCUEIMG=$RESCUE/tinhat.img

# LVM
RESCUEVG=vgtin
RESCUELV=lvtin
RESCUELVROOT=/dev/$RESCUEVG/$RESCUELV

unset -f dnf-tinhat
function dnf-tinhat {
  dnf --releasever=31 --installroot ${RESCUEROOT} $@
}

unset -f rpm-tinhat
function rpm-tinhat {
  rpm -r ${RESCUEROOT} $@
}
