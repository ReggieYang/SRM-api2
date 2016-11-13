<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="project">RisKick</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown"><s:property value="user" /> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="project">Home</a></li>
                        <li class="divider"></li>
                        <li><a href="login">Sign out</a></li>
                    </ul>
                </li>
			</ul>
		</div>
	</div>
  </nav>

  <div class="container" style="padding-top:20px;">
    <div class="row">
        <h3>Risks</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Description</th><th>Type</th><th>Possibility</th><th>Impact</th><th>Threshold</th>
                    <th>Creator</th><th>Follower</th><th></th>
                </tr></thead>
                <tbody>
                <s:iterator id="risk" value="risks" status="st">
                    <tr>
                        <th><s:property value="#st.index+1" /></th>
                        <td><s:property value="#risk.description" /></td>
                        <td><s:property value="#risk.riskType" /></td>
                        <td><s:property value="#risk.possibility" /></td>
                        <td><s:property value="#risk.impact" /></td>
                        <td><s:property value="#risk.threshold" /></td>
                        <td><s:property value="#risk.creatorName" /></td>
                        <td><s:property value="#risk.followerName" /></td>
                        <td><a risk-id='<s:property value="#risk.riskId" />' class="followupLink" style="cursor: pointer;">followups</a>
                        <div style="display: inline; float: right;">
                            <!--<button risk-id='<s:property value="#risk.riskId" />' class="modifyRisk btn btn-xs btn-primary" style="cursor: pointer;padding-top: 3px;"  data-toggle="modal" data-target="#riskInfo"><i class="glyphicon glyphicon-pencil"></i></button>-->
                            <button risk-id='<s:property value="#risk.riskId" />' class="deleteRisk btn btn-xs btn-danger" style="cursor: pointer;padding-top: 3px;"><i class="glyphicon glyphicon-remove"></i></button>
                        </div></td>
                    </tr>
                </s:iterator>
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
                                <select class="form-control" id="followerName" name="followerName">
                                    <s:iterator id="participant" value="participants" status="st">
                                        <option value='<s:property value="#participant" />'><s:property value="#participant" /></option>
                                    </s:iterator>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success"> Add </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="riskInfo" tabindex="-1" role="dialog" aria-labelledby="riskInfoLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="riskInfoLabel">Modify Project</h4>
      </div>
      <div class="modal-body">
          ...
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Modify</button>
      </div>
      </div>
  </div>
  </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/risk.js"></script>

</body>

</html>

