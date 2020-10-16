$(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
        $("#stdld").fadeOut();
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
        $("#stdld").slideDown(1000);
    });
    $('#std').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#stdld').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "saccount.php",
                    data: {
                        signup: signup
                    },

                });
                $('#stdld').load('saccounts.php');
            } else {


            }
        });
});



$(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
        $("#stdld").fadeOut();
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
        $("#stdld").slideDown(1000);
    });
    $('#std1').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#stdld').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "saccount.php",
                    data: {
                        signup: signup
                    },

                });
                $('#stdld').load('saccounte.php');
            } else {


            }
        });
});

$(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
        $("#stdld").fadeOut();
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
        $("#stdld").slideDown(1000);
    });
    $('#std2').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#stdld').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "saccount.php",
                    data: {
                        signup: signup
                    },

                });
                $('#stdld').load('teacher3.php');
            } else {


            }
        });
});



$(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
        $("#stdld").fadeOut();
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
        $("#stdld").slideDown(1000);
    });
    $('#std3').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#stdld').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "saccount.php",
                    data: {
                        signup: signup
                    },

                });
                $('#stdld').load('teacher2.php');
            } else {


            }
        });
});

$(function() {
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
        $("#stdld").fadeOut();
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
        $("#stdld").slideDown(1000);
    });
    $('#std4').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#stdld').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "saccount.php",
                    data: {
                        signup: signup
                    },

                });
                $('#stdld').load('teacher2.php');
            } else {


            }
        });
});


$(function() {
    $('#login').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var username = $('#username').val();
                var password1 = $('#password1').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "process.php",
                    data: {
                        username: username,
                        password1: password1
                    },
                    success: function(data) {

                        Swal.fire({
                            imageUrl: 'img/udom.gif',
                            icon: 'success',
                            position: 'center',
                            title: 'full registered into a platform',
                            text: 'successfully registration!',
                            type: 'success',
                            footer: '<a href="img/udom.gif">Why do I have this issue?</a>'
                        })

                    },
                    error: function(data) {
                        Swal.fire({
                            imageUrl: 'img/udom.gif',
                            icon: 'error',
                            title: 'error while system try to save your information',
                            text: 'registration failed!',
                            type: 'success',
                            footer: '<a href="img/udom.gif">Why do I have this issue?</a>'
                        })

                    }
                });
            } else {

            }

        });
    //alert("hellow")

});