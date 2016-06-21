$(document).ready(function () {
  $.get( "/1", function( data ) {
    var split = data.split("\n");
    var data = [];
    for(var i=0;i<split.length-1;i++) {
        data.push([i+1,split[i]]);
    }
    console.log( "Load was performed.", data );
    new Dygraph(
          document.getElementById("graph"),
          data,
          {
            title: 'Loss Function',
            ylabel: 'Loss',
            xlabel: 'Step',
            labels: [ "step", "loss" ],
            showRangeSelector: true
          }
      );
  });
});