<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>RisKick</title>
  <link rel="stylesheet" type="text/css" href="assets/dist/bootstrap/css/bootstrap.css">

</head>
<body style="margin: 2em;">

  <div class="container">
    <div class="row">
        <h2>My projects</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Name</th><th>Creator</th><th></th>
                </tr></thead>
                <tbody>
                <tr>
                    <th>{{i+1}}</th>
                    <td>{{project.projectName}}</td>
                    <td>{{project.creatorName}}</td>
                    <td><a>risks</a></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <button class="btn btn-primary btn-lg" style="margin-top:20px;" id="addButton" isClicked="false">
                <span id="addButtonText">Add a project</span>
            </button>

            <div class="panel panel-default" style="margin-top:20px;display:none;" id="addPanel">
                <div class="panel-body">
                    <form class="form-horizontal" id="projectForm">
                        <div class="form-group">
                            <label for="projectName" class="col-sm-2 control-label">Project name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="projectName" required name="projectName">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary"> Add </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
  </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/project.js"></script>

</body>

</html>

