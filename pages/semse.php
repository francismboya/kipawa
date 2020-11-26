<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap4/js/bootstrap.min.js"></script>
    <link href="../vendor/bootstrap4/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../chart/dist/Chart.bundle.js"></script>
</head>
<!--add sem-->
<div id="togglef" style="display:none">
    <form role="form" method="post" action="adsemsession.php?action=add" class="form-horizontal"
        enctype="multipart/form-data">
        <div class="row m-2 justify-content-center">
            <p class="btn text-primary">
                ACADEMIC SESSION DURATION
            </p>
        </div>
        <div class="row m-2 justify-content-center">
            <div class="form-group col-sm-4">
                <input placeholder="Starting Year" type="text" onfocus="(this.type='month')" onblur="(this.type='text')"
                    id="FromDate" name="regddate" class="form-control" />
            </div>
            <div class="form-group col-sm-4">
                <input placeholder="Ending Year" type="text" onfocus="(this.type='month')" onblur="(this.type='text')"
                    id="FromDate1" name="regddate" class="form-control" />
            </div>


        </div>

        <div class="row m-2 justify-content-center">
            <p class="text-primary">
                SEMESTER 1 DURATION
            </p>
        </div>
        <div class="row m-2 justify-content-center">
            <div class="form-group col-sm-4">
                <input placeholder="Starting Date" type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                    id="FromDate" name="regddate" class="form-control" />
            </div>
            <div class="form-group col-sm-4">
                <input placeholder="Ending Date" type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                    id="FromDate1" name="regddate" class="form-control" />
            </div>


        </div>

        <div class="row m-2 justify-content-center">
            <p class="text-primary">
                SEMESTER 2 DURATION
            </p>
        </div>
        <div class="row m-2 justify-content-center">
            <div class="form-group col-sm-4">
                <input placeholder="Starting Date" type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                    id="FromDate" name="regddate" class="form-control" />
            </div>
            <div class="form-group col-sm-4">
                <input placeholder="Ending Date" type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                    id="FromDate1" name="regddate" class="form-control" />
            </div>


        </div>


        <hr>
        <div class="row m-2 justify-content-center">
            <button type="submit" class="btn btn-success m-2" name="save"><i class="fa fa-check fa-fw"></i>Save</button>
            <button type="reset" class="btn btn-danger m-2" onclick="clear()"><i
                    class="fa fa-times fa-fw"></i>Reset</button>
        </div>
    </form>
</div>
<!--/add sem-->