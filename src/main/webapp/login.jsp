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
    <div class="fluid-container">
        <div class="row">
            <div style="max-width:340px;margin-left:auto;margin-right:auto;padding-top:40px;">
                <h3 style="text-align:center;">RisKick</h3>
                <form id="loginForm">
                    <div class="form-group">
                        <label for="name">User Name</label>
                        <input type="text" class="form-control" id="name" required name="name">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" required name="password">
                    </div>

                    <button type="submit" class="btn btn-primary" style="width:100%;">Sign in</button>

                    <div style="text-align:center;margin-top:15px;">
                    New to RisKick? <a href="register"> Create an account.</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script src="assets/dist/jquery/jquery-2.2.1.min.js"></script>
<script src="assets/dist/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/login.js"></script>

</body>

</html>

