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
        <h3>Risks</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Description</th><th>Type</th><th>Possibility</th><th>Impact</th><th>Threshold</th>
                    <th>Creator</th><th>Follower</th><th></th>
                </tr></thead>
                <tbody>
                <tr *ngFor="let risk of risks; let i = index">
                    <th>{{i+1}}</th>
                    <td>{{risk.description}}</td>
                    <td>{{risk.riskType}}</td>
                    <td>{{risk.possibility}}</td>
                    <td>{{risk.impact}}</td>
                    <td>{{risk.threshold}}</td>
                    <td>{{risk.creatorName}}</td>
                    <td>{{risk.followerName}}</td>
                    <td><a href="#">followups</a></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <button class="btn btn-primary btn-lg" style="margin-top:20px;" id="addButton" isClicked="false">
                <span id="addButtonText">Add a risk</span>
            </button>

            <div class="panel panel-default" style="margin-top:20px;display:none;" id="addPanel">
                <div class="panel-body">
                    <form class="form-horizontal" id="riskForm">
                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="description" required name="description">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="type" class="col-sm-2 control-label">Type</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="type" required name="type">
                                    <option value="Quality Risk">Quality Risk</option>
                                    <option value="Technical Risk">Technical Risk</option>
                                    <option value="Management Risk">Management Risk</option>
                                    <option value="Legal Risk">Legal Risk</option>
                                    <option value="Business Risk">Business Risk</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="possibility" class="col-sm-2 control-label">Possibility</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="possibility" required name="possibility">
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="impact" class="col-sm-2 control-label">Impact</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="impact" required name="impact">
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="threshold" class="col-sm-2 control-label">Threshold</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="threshold" name="threshold">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="followerName" class="col-sm-2 control-label">Follower</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="followerName" name="followerName">
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
<script src="assets/js/risk.js"></script>

</body>

</html>

