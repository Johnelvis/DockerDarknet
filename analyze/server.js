var port = 80;
var express = require('express');
var fs = require('fs');

var app = express();

app.use(express.static(__dirname + '/'));

app.get('/:version', function(req, res){
	fs.readFile("../loss.txt", "utf8", function(err, data) {
		if(err) return console.error(err);
		res.send(data);
	});
});

app.listen(port, function () {
  console.log('Analyze app listening on port '+port+'!');
});