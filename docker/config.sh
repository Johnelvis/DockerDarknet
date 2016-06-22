#!/bin/bash
#Config below!
CLASSNUM=2
CLASSLABELS='"stopsign", "yeildsign"'

#---- END CONFIG---DONT TOUCH BELOW-----------------
echo "update config..."
sed -i '13s/.*/#define CLASSNUM '$CLASSNUM'/' /opt/DockerDarknet/src/yolo.c
sed -i '17s/.*/#define CLS_NUM '$CLASSNUM'/' /opt/DockerDarknet/src/yolo_kernels.cu
INSIDE="char *voc_names[] = {$CLASSLABELS};"
sed -i "16s/.*/${INSIDE}/" /opt/DockerDarknet/src/yolo.c
INSIDE="l = [$CLASSLABELS];"
sed -i "3s/.*/${INSIDE}/" /opt/DockerDarknet/data/labels/make_labels.py
nvidia-docker exec darknet /bin/sh -c "python /opt/DockerDarknet/data/labels/make_labels.py"
echo "Compile with new config!"
nvidia-docker exec darknet /bin/sh -c "cd /opt/DockerDarknet;make"
echo "DONE -----------------------"
echo "Now select the config you want to use at /opt/DockerDarknet/cfg and change the -output- value to:"
echo "((5*2+"$CLASSNUM")*7*7)" | bc
echo "On cfg/yolo.cfg this is line 218!"
echo "Also change the -classes- to:"
echo $CLASSNUM
echo "On cfg/yolo.cfg this is line 222!"
echo "Then Config is done!"


