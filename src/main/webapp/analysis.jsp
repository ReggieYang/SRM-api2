<!--<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>-->
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
				<li><a href="project">Projects</a></li>
				<li class="active"><a href="analysis">Analysis</a></li>
			</ul>
		</div>

        <div class="col-sm-10 col-sm-offset-2 main">
            <h1 class="page-header">Top Risks</h1>
            <form id="topRiskForm" class="form-inline">
                <div class="form-group">
                    <label for="fromDate">From</label>
                    <input type="date" class="form-control" name="fromDate">
                </div>
                <div class="form-group">
                    <label for="toDate">To</label>
                    <input type="date" class="form-control" name="toDate">
                </div>
                <button type="submit" class="btn btn-primary"> Search </button>
            </form>
            <div id="topRisks" style="height: 400px;"></div>

            <h1 class="page-header" style="margin-top: 30px;">Top Problems</h1>
            <form id="topProblemForm" class="form-inline">
                <div class="form-group">
                    <label for="fromDate">From</label>
                    <input type="date" class="form-control" name="fromDate">
                </div>
                <div class="form-group">
                    <label for="toDate">To</label>
                    <input type="date" class="form-control" name="toDate">
                </div>
                <button type="submit" class="btn btn-primary"> Search </button>
            </form>
            <div id="topProblems" style="height: 400px;"></div>
        </div>
    </div>

  </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/dist/echarts/echarts.js"></script>
<script src="assets/js/analysis.js"></script>

</body>

</html>

