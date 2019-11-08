<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRequestTutor.aspx.cs" Inherits="eTutoring.StudentRequestTutor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            <!--Header-->
         <!--header-->
         <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top justify-content-between">
          <a class="navbar-brand" href="#">
            <img src="img/logo-elearning-color.png" alt="logo" style="width:100px;"/>
          </a>
  
          <!-- Right Links
          <ul class="navbar-nav m-md-2 ">  
              <li class="nav-item">
              <a class="nav-link" href="login.aspx">Coach Booking System</a>
              </li>                    
          </ul> -->

         <!-- left Links -->
          <ul class="navbar-nav form-inline ">  
              <li class="nav-item btn-outline-success my-2 my-sm-0">
              <a class="nav-link" href="Customer.aspx">Home</a>
            </li>              
            <li class="nav-item btn-outline-success my-2 my-sm-0">
                <asp:Label ID="lbl_User" runat="server" Text=""></asp:Label>
            </li> 
               <li class="nav-item btn-outline-success my-2 my-sm-0">
                  <asp:Button ID="btnLogOut" runat="server" Text="LogOut" class="btn btn-lg btn-success " OnClick="btnLogOut_Click" />
                  </li>                         
          </ul>


        </nav>
        
           
         <div class="jumbotron text-center align-content-center  m-md-2 ">
               <br />
                <h1 class="h1" style="text-align:center">eTutoring System</h1>   
            
            </div>
        <!--Body-->
             <div class="container" >
                 <div class="row">
                     <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     </div>
                 <div class="row">
                      <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     </div>
                <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                    <asp:Button ID="btn_Request" runat="server" class="btn btn-lg btn-success col-sm-12" Text="Request a Tutor" OnClick="btn_Request_Click" />
                    </div>
                    </div>
                </div>
                   <div class="row">
                      <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     </div>
                 <div class="row">
                     <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:Label ID="lblRequest" runat="server" Text=""></asp:Label>
                    </div>
                    </div>
                     </div>
            </div>



    </div>
    </form>
</body>
</html>
