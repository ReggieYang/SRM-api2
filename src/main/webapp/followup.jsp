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
        <h3>Followups</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Date</th><th>Status</th><th></th>
                </tr></thead>
                <tbody>
                <s:iterator id="followup" value="followups" status="st">
                    <tr>
                        <th><s:property value="#st.index+1" /></th>
                        <td><s:property value="#followup.followupDate" /></td>
                        <td><s:property value="#followup.status" /></td>
                        <td><div style="display: inline; float: right;">
                            <!--<button followup-id='<s:property value="#followup.followupId" />' class="modifyFollowup btn btn-xs btn-primary" style="cursor: pointer;padding-top: 3px;"  data-toggle="modal" data-target="#followupInfo"><i class="glyphicon glyphicon-pencil"></i></button>-->
                            <button followup-id='<s:property value="#followup.followupId" />' class="deleteFollowup btn btn-xs btn-danger" style="cursor: pointer;padding-top: 3px;"><i class="glyphicon glyphicon-remove"></i></button>
                        </div></td>
                    </tr>
                </s:iterator>
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
  <div class="modal fade" id="followupInfo" tabindex="-1" role="dialog" aria-labelledby="rollowupInfoLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="followupInfoLabel">Modify Project</h4>
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
<script src="assets/js/followup.js"></script>

</body>

</html>

