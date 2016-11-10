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
        <h2>My projects</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead><tr>
                    <th>#</th><th>Name</th><th>Creator</th><th></th>
                </tr></thead>
                <tbody>
                <s:iterator id="project" value="projects" status="st">
                    <tr>
                        <th><s:property value="#st.index+1" /></th>
                        <td><s:property value="#project.projectName" /></td>
                        <td><s:property value="#project.creatorName" /></td>
                        <td><a project-id='<s:property value="#project.projectId" />' class="riskLink" style="cursor: pointer;">risks</a></td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>

        <s:if test="%{position == 'PM'}">
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
        </s:if>
        <s:else>
            <h4>Only PM can add a project</h4>
        </s:else>
        </div>
  </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/project.js"></script>

</body>

</html>

