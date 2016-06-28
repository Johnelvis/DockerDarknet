![Darknet Logo](http://pjreddie.com/media/files/darknet-black-small.png)

#Darknet#
Darknet is an open source neural network framework written in C and CUDA. It is fast, easy to install, and supports CPU and GPU computation.

For more information see the [Darknet project website](http://pjreddie.com/darknet).

For questions or issues please use the [Google Group](https://groups.google.com/forum/#!forum/darknet).

#About This Fork#

This is a Fork for my Master Thesis at Reutlingen University 2016.
Some changes where made to the code for easy use and scripts are added to run Darknet in Docker -> train,analyze and use.

#How to install#
1. Install Cuda
2. Install Docker + Nvidia Docker and test it
3. Clone this repo
4. go to /scripts and run: sudo ./initDarknetDocker.sh
 * this will build the docker image and install all deps in it
 * this will mount /opt/DockerDarknet on your system to transfer files to the docker and back

<i>Dakrnet is now installed with all his deps (openCv is not but you can add it)</i>

#How to use the standard Darknet#
just connect to the Docker
`docker exec -it darknet /bin/bash`
Now you can use Darknet yolo with the standard docu: http://pjreddie.com/darknet/yolo/

#How to use the analyze tool#
this tool is always running at http://hostip

---------------------------------------------------

#How to use Darknet with the added skripts#
first go to /opt/DockerDarknet/scripts

##Convert your training data##
1. change the path at the convert.py or VBB_converter.js to your data as normal. (data must be at /opt/DockerDarknet or a subfolder)
2. start the script you need
 * VBB: `docker exec darknet /bin/sh –c "node /opt/DockerDarknet/scripts/VBB_Converter.js"`
 * VOC: `docker exec darknet /bin/sh –c "python /opt/DockerDarknet/scripts/convert.py"`

##Train the NET##
1. be sure your training images are at /opt/DockerDarknet/training/images and your labels are at /opt/DockerDarknet/training/labels
2. Edit config.sh with your classnumber and labels you want
3. run: `./config.sh`
4. choose your config file like /cfg/yolo.cfg and change the classnumber  and output layer to the values given from the config.sh prompt
5. run: `./train.sh cfg/yolo.cfg darknet.conv.weights` this will also start you a analyze tool at http://hostip for the loss function

##stop training##
1. run `./stopTraining.sh`

##use the NET##
1. run `./use.sh cfg/yolo.cfg backup/yolo-wights-final imagepath`
you can also you it with -tresh parameter or without imagepath to check multible pictures

