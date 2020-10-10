var fileinput = document.getElementById('csvfl');
fileinput.onchange = function(e) {
    var fullPath = fileinput.value;
    if (fullPath) {
        var startindex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') :
            fullPath.lastIndexOf('/'));
        var filename = fullPath.substring(startindex);
        if (filename.indexOf('\\') == 0 || filename.indexOf('/') == 0) {
            filename = filename.substring(1);
        }
        $('#csvfl2').text(filename);
        document.getElementById('csvfl2').className = 'text-success';
    }
};


var fileinputs = document.getElementById('impng');
fileinputs.onchange = function(e) {
    var fullPaths = fileinputs.value;
    if (fullPaths) {
        var startindexs = (fullPaths.indexOf('\\') >= 0 ? fullPaths.lastIndexOf('\\') :
            fullPaths.lastIndexOf('/'));
        var filenames = fullPaths.substring(startindexs);
        if (filenames.indexOf('\\') == 0 || filenames.indexOf('/') == 0) {
            filenames = filenames.substring(1);
        }
        var lenfile = fileinputs.files.length;
        $('#impng2').text(lenfile + ' files selected');
        document.getElementById('impng2').className = 'text-success';
    }
};

function cleare() {
    var a = document.getElementById('csvfl');
    var b = document.getElementById('impng');
    a.value = "";
    b.value = "";
    document.getElementById('impng2').className = 'text-danger';
    document.getElementById('csvfl2').className = 'text-danger';
    $('#csvfl2').text("NO File Chosen");
    $('#impng2').text(" NO Image Chosen");


}