var fs = require('fs');

var folder = '/opt/DockerDarknet/training/images';
var list = "";
fs.readdir(folder, function(err, filenames) {
        if(err) {
                return console.log(err);
        }

        for(var i in filenames) {
                list+=folder+"/"+filenames[i]+"\n";
        }
        console.log(filenames.length + "images found!");
        fs.writeFile("/opt/DockerDarknet/training/train.txt", list, function(err) {
            if(err) {
                return console.log(err);
            }

            console.log("train.txt saved at /opt/DockerDarknet/training/train.txt!");
        });
});