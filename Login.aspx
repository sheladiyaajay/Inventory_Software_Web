<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Neon Admin Panel" />
    <meta name="author" content="" />

    <link rel="icon" href="assets/images/favicon.ico" />

    <title>Login</title>

    <link rel="stylesheet" href="assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="assets/css/font-icons/entypo/css/entypo.css" />
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic" />
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/neon-core.css" />
    <link rel="stylesheet" href="assets/css/neon-theme.css" />
    <link rel="stylesheet" href="assets/css/neon-forms.css" />
    <link rel="stylesheet" href="assets/css/custom.css" />

    <script src="assets/js/jquery-1.11.3.min.js"></script>
    <script>
        function Save() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            debugger;
            if (username != "" && password != "") {
                if (username == "admin" && password == "123") {
                    window.open("Default.aspx");
                }
                else {
                    alert("invalid username or password");
                }
            }
        }
    </script>
</head>
<body class="login-page">
    <div class="login-container">

        <div class="login-header login-caret">
            <div class="">
            </div>
        </div>

        <div class="login-form">
            <div class="login-content">
                <form runat="server">

                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="entypo-user"></i>
                            </div>
                            <input type="text" class="form-control" id="username" placeholder="Username" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="entypo-key"></i>
                            </div>
                            <input type="password" class="form-control" id="password" placeholder="Password" />
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block btn-login" onclick="Save()">
                            <i class="entypo-login"></i>
                            Login In
                       
                        </button>
                    </div>
                </form>
                <div class="login-bottom-links">
                    <a href="#" class="link">Forgot your password?</a>
                    <br />
                    <a href="#">ToS</a>  - <a href="#">Privacy Policy</a>
                </div>
            </div>
        </div>

    </div>
    <!-- Bottom scripts (common) -->
    <script src="assets/js/gsap/TweenMax.min.js"></script>
    <script src="assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/joinable.js"></script>
    <script src="assets/js/resizeable.js"></script>
    <script src="assets/js/neon-api.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>
    <script src="assets/js/neon-login.js"></script>


    <!-- JavaScripts initializations and stuff -->
    <script src="assets/js/neon-custom.js"></script>


    <!-- Demo Settings -->
    <script src="assets/js/neon-demo.js"></script>
</body>
</html>
