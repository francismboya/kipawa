<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SRMS | Student Record Management System (SRMS)</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/login-form-1.css">
    <link rel="stylesheet" href="../assets/css/login-form.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../assets/css1.css">
    <link rel="stylesheet" href="../assets/css2.css">
    <link rel="icon" href="../img/favicon.png" type="image/png" sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=0.8 user-scalable=no">

    <title>SRMS</title>
</head>

<body>
    <div class="pace  pace-inactive">
        <div class="pace-progress" data-progress-text="100%" data-progress="99"
            style="transform: translate3d(100%, 0px, 0px);">
            <div class="pace-progress-inner"></div>
        </div>
        <div class="pace-activity"></div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="loginColumns animated fadeInDown">
                    <div class="text-center">
                        <img src="../assets/img/vetalogo.png" alt="" style="width: 180px;">
                    </div>
                    <div style="padding-top: 15px;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="panel-title">
                                            Student Record Management System (SRMS) </div>
                                    </div>
                                    <div class="panel-body">
                                        <form id="login-form" action="processlogin.php" method="post"
                                            autocomplete="off">
                                            <div class="form-group">
                                                <div class="form-group field-loginform-username required has-success">

                                                    <input type="text" id="loginform-username" class="form-control"
                                                        name="user" placeholder="Username" autocomplete="nope"
                                                        aria-required="true" aria-invalid="false">

                                                    <p class="help-block help-block-error"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group field-loginform-password required has-success">

                                                    <input type="password" id="loginform-password" class="form-control"
                                                        name="password" value="" placeholder="Password"
                                                        autocomplete="new-password" aria-required="true"
                                                        aria-invalid="false">

                                                    <p class="help-block help-block-error"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" name="btnlogin"
                                                    class="btn btn-success btn-rounded btn-block full-width m-b"><i
                                                        class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;Login</button>
                                            </div>
                                            <div class="form-group">
                                                Forgot&nbsp;<a
                                                    href="https://sr2.udom.ac.tz/site/request-password-reset">password&nbsp;?</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr style="border-color: #e6e6e6;">
                    <div>
                        <div class="text-center">
                            Copyright &nbsp;2020.&nbsp;VETA Kipawa SRMS
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>