function callpc() {


    $(document).ready(function() {
        $.notify("your device verified to use desktop site", "success");
        $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
        $('#ajaxorg').load('loginpc.php');
    });

}

function callmb() {


    $(document).ready(function() {
        $.notify("your device verified to use mobile site", "success");
        $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
        $('#ajaxorg').load('loginmb.php');
    });

}



$(document).ready(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
    });
    $("#lgforms").submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "processlogin.php",
            dataType: "JSON",
            data: $("#lgforms").serialize(),
            success: function(response) {
                var dec = response.status;
                console.log(dec)
                if (dec == 6) {
                    $.notify("wrong password or username entered", "error")
                    Swal.fire({
                        icon: 'error',
                        title: 'Access Denied',
                        text: 'wrong Email or Password!',
                        footer: '<a href>Help?</a>'

                    });

                    //password or username
                } else if (dec == 5) {
                    $.notify("registrar account verified", "success")

                    $('#ajaxorg').load('index.php');
                    //registrar
                } else if (dec == 4) {
                    $.notify("principal account verified", "success")

                    $('#ajaxorg').load('index.php');
                    //principal
                } else if (dec == 3) {
                    $.notify("student account verified", "success")
                    $('#ajaxorg').load('index.php');
                    //student
                } else if (dec == 2) {
                    $.notify("Instructor account verified", "success")

                    $('#ajaxorg').load('teacheractvity.php');
                    //teacher
                } else if (dec == 8) {

                    $.notify("HOD account verified", "success")

                    $('#ajaxorg').load('hodactivity.php');
                } else if (dec == 1) {
                    window.location = "index.php";
                    var b = window.location.href + "?url=";
                    console.log(b);

                    //admin
                } else if (dec == 'password') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Password missing',
                        text: 'passsword field should not blank!',
                        footer: '<a href>Help?</a>'
                    });
                    //registrar
                } else if (dec == 7) {
                    //error
                    Swal.fire({
                        icon: 'error',
                        title: 'Connection error',
                        text: 'failed to establish database connection either due to bad network  connection or configuration!',
                        footer: '<a href>Help?</a>'
                    });
                }
                //console.log(response.status);

            },
        });
    });

});