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
        <h3>Followups</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Date</th><th>Status</th>
                </tr></thead>
                <tbody>
                <tr *ngFor="let followup of followups; let i = index">
                    <th>{{i+1}}</th>
                    <td>{{followup.followupDate}}</td>
                    <td>{{followup.status}}</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <button class="btn btn-primary btn-lg" style="margin-top:20px;" id="addButton" isClicked="false">
                <span id="addButtonText">Add a followup</span>
            </button>

            <div class="panel panel-default" style="margin-top:20px;display:none;" id="addPanel">
                <div class="panel-body">
                    <form class="form-horizontal" id="followupForm">
                        <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">Status</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="status" required name="status">
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
<script src="assets/js/followup.js"></script>

</body>

</html>

