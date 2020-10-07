$(function() {
    $('#signup').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#signup').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "index.php",
                    data: {
                        signup: signup
                    },
                    success: function(data) {

                        $('#external').load('signup.php');
                    }
                });
            } else {


            }
        });
});
$(function() {
    $('#teacher').click(
        function(e) {
            var valid = this.form.checkValidity();
            if (valid) {
                var signup = $('#teacher').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "index.php",
                    data: {
                        signup: signup
                    },
                    success: function(data) {
                        Swal.fire({
                            title: 'seem like you want to load teacher panel',
                            text: "proceed or cancel operation!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, proceed'
                        }).then((result) => {
                            if (result.value) {
                                Swal.fire({
                                    title: 'succesfully loaded!',
                                    text: 'Dear Teacher welcome',
                                    icon: 'success',
                                    timer: 4000
                                });
                                $('#external').load('teacher.php');
                            };

                        });


                    }
                });
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