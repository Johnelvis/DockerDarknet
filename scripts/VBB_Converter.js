//Set path at line 67 also!

decodeVBB_FilePath = "/path to the VBB file";

var sizeOf = require('image-size');
var fs = require('fs');

function decodeVBB_FilePath = function(filePath) {
	fs.readFile(filePath, 'utf8', function(err, data) {
		if(err) throw err;
		return decodeVBB_Str(data);
    });
}

function decodeVBB_Str = function(str) {
    var t = str;
    var retArray = [];
    var lines = t.split("\n");
    var frameObj = [];
    var cnt = 0;
    for(var i in lines) {
        var lbl ="";
        var startF = null;
        var endF = null;
        var framePos = [];
        if(lines[i].indexOf("lbl")!==-1) {
            var topArray = lines[i].split(" ");
            lbl = topArray[0].split("'")[1].trim();
            if(lbl=="person") {
		lbl = "0";
	    }
            startF = topArray[1].split("=")[1];
            endF = topArray[2].split("=")[1];
            //console.log("top", lbl, startF, endF);
            frameObj[cnt] = {"lbl":lbl, "startF": startF, "endF": endF};
        } else if(lines[i].indexOf("pos ")!==-1) {
            framePos = lines[i].split("[")[1].split(" ]")[0].split(";");
            for(l in framePos) {
                if(framePos[l]== "") {
                    framePos.pop(l);
                } else {
                    framePos[l] = framePos[l].trim();
                }
            }
            frameObj[cnt++]["framePos"] = framePos;
            //console.log("btn", framePos);
        }
    }
    console.log(frameObj[0]["framePos"][0]);    

    gCnt = 0;
    for(var i=0;i<frameObj.length;i++) {
        var lbl = frameObj[i]["lbl"];
        var startF = parseInt(frameObj[i]["startF"]);
        var endF = parseInt(frameObj[i]["endF"]);
        var framePos = frameObj[i]["framePos"];
        var lklCnt = 0;
        for(var k=startF;k<endF;k++) {
            //console.log("File", gCnt, lbl, framePos[lklCnt]);
            var xywhSplit = framePos[lklCnt].split(" ");
            var xmin = parseFloat(xywhSplit[0]);
            var xmax = parseFloat(xywhSplit[2]);
            var ymin = parseFloat(xywhSplit[1]);
            var ymax = parseFloat(xywhSplit[3]);
            var box = [xmin, xmax, ymin, ymax ];
	    var fileCnt = ""+gCnt;
	    while(fileCnt.length<5)
		fileCnt=0+""+fileCnt;
	    var dimensions = sizeOf('/opt/nvid/training/images/view_0-frame_'+fileCnt+'.png');
            var w = dimensions.width;
	    var h = dimensions.height;
            retArray.push(lbl+' '+convert([w,h], box));
            lklCnt++;
            gCnt++;
        }
    }
    console.log(retArray[0]);
    return retArray;
}

//box[xmin,xmax,ymin,ymax]
function convert(size, box) {
    dw = 1.0/size[0]
    dh = 1.0/size[1]
    x = (box[0] + box[1])/2.0
    y = (box[2] + box[3])/2.0
    w = box[1] - box[0]
    h = box[3] - box[2]
    x = x*dw
    w = w*dw
    y = y*dh
    h = h*dh
    return (x+" "+y+" "+w+" "+h)
}
