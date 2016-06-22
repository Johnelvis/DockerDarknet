#!/bin/bash
#Config below!
CLASSNUM=2
CLASSLABELS='"stopsign", "yeildsign"'

#---- END CONFIG---DONT TOUCH BELOW-----------------
echo "set config!"
sed -i '13s/.*/#define CLASSNUM '$CLASSNUM'/' /opt/DockerDarknet/src/yolo.c
sed -i '17s/.*/#define CLS_NUM '$CLASSNUM'/' /opt/DockerDarknet/src/yolo_kernels.cu
INSIDE="char *voc_names[] = {$CLASSLABELS};"
sed -i "16s/.*/${INSIDE}/" /opt/DockerDarknet/src/yolo.c
INSIDE="l = [$CLASSLABELS];"
sed -i "3s/.*/${INSIDE}/" /opt/DockerDarknet/data/labels/make_labels.py
python /opt/DockerDarknet/data/labels/make_labels.py
cd /opt/DockerDarknet
echo "Compile with new config!"
make
