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
  <link rel="stylesheet" href="assets/css/base.css">

</head>
<body>
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

  <div class="container-fluid">
    <div class="row">
        <div class="col-sm-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="project">Projects</a></li>
				<li><a href="analysis">Analysis</a></li>
			</ul>
		</div>

        <div class="col-sm-10 col-sm-offset-2 main">
            <h1 class="page-header">Followups</h1>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead><tr>
                        <th>#</th><th>Date</th><th>Description</th><th>Status</th><th>Type</th><th>Possibility</th><th>Impact</th><th>Threshold</th><th>Follower</th><th></th>
                    </tr></thead>
                    <tbody>
                    <s:iterator id="followup" value="followups" status="st">
                        <tr>
                            <th><s:property value="#st.index+1" /></th>
                            <td><s:property value="#followup.updateTime"/></td>
                            <td><s:property value="#followup.description" /></td>
                            <td><span class='label <s:property value="#followup.status" />'><s:property value="#followup.status" /></span></td>
                            <td><s:property value="#followup.riskType" /></td>
                            <td><s:property value="#followup.possibility" /></td>
                            <td><s:property value="#followup.impact" /></td>
                            <td><s:property value="#followup.threshold" /></td>
                            <td><s:property value="#followup.followerName" /></td>
                            <td>
                                <!--<div style="display: inline; float: right;">
                                <button followup-id='<s:property value="#followup.followupId" />' class="deleteFollowup btn btn-xs btn-danger" style="cursor: pointer;padding-top: 3px;"><i class="glyphicon glyphicon-remove"></i></button>
                                </div>-->
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>

            <s:if test="%{user == follower||position == 'PM'}">
            <div>
                <button class="btn btn-primary btn-lg" style="margin-top:20px;" id="addButton" isClicked="false">
                    <span id="addButtonText">Add a followup</span>
                </button>

                <div class="panel panel-default" style="margin-top:20px;display:none;" id="addPanel">
                    <div class="panel-body">
                        <form class="form-horizontal" id="followupForm">
                            <div class="form-group">
                                <label for="description" class="col-sm-2 control-label">Description</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" required name="description" value='<s:property value="currentRisk.description" />'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-2 control-label">Status</label>
                                <div class="col-sm-10">
                                    <select class="form-control" required name="status">
                                        <option value="Risk">Risk</option>
                                        <option value="Problem">Problem</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-2 control-label">Type</label>
                                <div class="col-sm-10">
                                    <select class="form-control" required name="type">
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
                                    <select class="form-control" required name="possibility">
                                        <option value="High">High</option>
                                        <option value="Medium">Medium</option>
                                        <option value="Low">Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="impact" class="col-sm-2 control-label">Impact</label>
                                <div class="col-sm-10">
                                    <select class="form-control" required name="impact">
                                        <option value="High">High</option>
                                        <option value="Medium">Medium</option>
                                        <option value="Low">Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="threshold" class="col-sm-2 control-label">Threshold</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="threshold" value='<s:property value="currentRisk.threshold" />'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="followerName" class="col-sm-2 control-label">Follower</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="followerName">
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
            </s:if>

        </div>
    </div>
  </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/followup.js"></script>

</body>

</html>

