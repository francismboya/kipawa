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


function cleare() {
    var a = document.getElementById('csvfl');

    a.value = "";
    document.getElementById('csvfl2').className = 'text-danger';
    $('#csvfl2').text("NO File Chosen");


}