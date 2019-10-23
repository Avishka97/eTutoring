<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="eTutoring.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
<!--===============================================================================================-->

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
          <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">
						Sign Up
					</span>
				</div>

				 <form id="form1" runat="server" class="login100-form validate-form">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Name</span>
                        <asp:TextBox ID="txtSName" runat="server" class="input100" placeholder="Enter Student Name"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
                     <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Username</span>
                        <asp:TextBox ID="txtUsername" runat="server" class="input100" placeholder="Enter username"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
                     <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Email</span>
                        <asp:TextBox ID="txtemail" runat="server" class="input100" placeholder="Enter Email"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
                        <asp:TextBox ID="txtPassword" runat="server" class="input100"  placeholder="Enter password"></asp:TextBox>
                        <span class="focus-input100"></span>
					</div>
                     
                     <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Confirm Password</span>
                        <asp:TextBox ID="txtCpassword" runat="server" class="input100"  placeholder="Enter password Again"></asp:TextBox>
                        <span class="focus-input100"></span>
					</div>
                     <div class="form-group validate-input" data-validate="Username is required">
						<span class="label-input100">Role</span>
                         <asp:DropDownList ID="DropDownList_Role" runat="server" class="form-control">
                             <asp:ListItem Selected="True">Student</asp:ListItem>
                             <asp:ListItem >Tutor</asp:ListItem>
                         </asp:DropDownList>
                        <span class="focus-input100"></span>
					</div>
					

					<div class="container-login100-form-btn">
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" class="login100-form-btn" OnClick="btnSignUp_Click" />
                    </div>
                                         
				</form>
			</div>
		</div>
	</div>

       
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

   
    
</body>
</html>
