#!/bin/bash

# Para listar os tipos de sistemas operacionais possiveis filtrando apenas o Red Hat, execute:
# VBoxManage list ostypes | grep RedHat

VM_BASEFOLDER=${VM_BASEFOLDER:-~/curso-jboss}
VM_DIR=$VM_BASEFOLDER/vm-centos
case `uname` in
  Darwin)
    CENTOS_ISO=${CENTOS_ISO:-~/Sites/centos/isos/i386/CentOS-6.5-i386-netinstall.iso}
    VBOXGUESTADDITIONS_ISO=${VBOXGUESTADDITIONS_ISO:-/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso}
    ;;
  Linux)
    CENTOS_ISO=${CENTOS_ISO:-~/public_html/centos/isos/i386/CentOS-6.5-i386-netinstall.iso}
    VBOXGUESTADDITIONS_ISO=${VBOXGUESTADDITIONS_ISO:-/usr/share/virtualbox/VBoxGuestAdditions.iso}
    ;;
  *)
    echo "Esse script ainda não está configurado para \"`uname`\"!"
    exit 1
    ;;
esac

VBoxManage createvm --name vm-centos --ostype RedHat --register --basefolder "$VM_BASEFOLDER"
VBoxManage modifyvm vm-centos --memory 2048 --clipboard bidirectional --accelerate3d on
VBoxManage createhd --filename "$VM_DIR/vm-centos.vdi" --size 12288 --format VDI
VBoxManage storagectl vm-centos --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach vm-centos --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_DIR/vm-centos.vdi"
VBoxManage storagectl vm-centos --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach vm-centos --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium "$CENTOS_ISO"
VBoxManage storageattach vm-centos --storagectl "IDE Controller" --port 1 --device 1 --type dvddrive --medium "$VBOXGUESTADDITIONS_ISO"
