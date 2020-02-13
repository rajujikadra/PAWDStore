<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="PAWD_Store.Admin.Pages.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Store Admin - Login</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="apple-touch-icon" href="apple-icon.png" />
    <link rel="shortcut icon" href="../../assets/img/rimpicon.png"/>
    <link rel="stylesheet" href="../assets/css/normalize.css" />
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../assets/css/themify-icons.css" />
    <link rel="stylesheet" href="../assets/css/flag-icon.min.css" />
    <link rel="stylesheet" href="../assets/css/cs-skin-elastic.css" />
    <!-- <link rel="stylesheet" href="../assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="../assets/scss/style.css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css' />
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body class="bg-dark">
    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <img class="align-content" src="../images/logo.png" alt="" />
                    </a>
                </div>
                <div class="login-form">
                    <form runat="server">
                        <div class="form-group">
                            <label>Email address</label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <div id="errorMessage" runat="server" class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                <span class="badge badge-pill badge-danger">Fail</span>
                                <asp:Label ID="errorLabel" class="error-msg" runat="server" ForeColor="#ff3300"></asp:Label>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                        </div>
                        <asp:Button runat="server" OnClick="btnAdminLogin_Click" ID="btnAdminLogin" Text="Sign in" class="btn btn-success btn-flat m-b-30 m-t-30" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>


