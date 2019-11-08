<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="eTutoring.Admin" %>

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
              <a class="nav-link" href="Admin.aspx">Home</a>
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
            <br />
                     <br />
              <h2>Welcome to eTutoring System - <asp:Label ID="lblHello" runat="server" Text=""></asp:Label></h2>
            <div class="row">
                     <br />
                     <br />
                     <br />
                     <br />
                    
                     </div>
                            
            <table class="table table-dark table-striped">
            <thead>
               <tr>
                <td colspan="2"><asp:Button ID="btnRequest" runat="server" Text="Student Allocation" class="btn btn-lg btn-success col-sm-12" OnClick="btnRequest_Click" />  </td>
                              </tr>
            </thead>
            <tbody>             
                <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Students with no interaction for 7 days"></asp:Label>
                </td>
               </tr>
                <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4"  ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="ID" class="col-sm-12">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                         <columns>
                       <asp:TemplateField HeaderText="Student Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblSNAME" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>

                        </columns>
                    </asp:GridView>
                   
                </td>
               </tr>
                <tr>
                <td colspan="2">
                   <asp:Label ID="Label2" runat="server" Text="Students with no interaction for 28 days"></asp:Label>
                </td>
               </tr>
                <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="ID" class="col-sm-12">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                         <columns>
                       <asp:TemplateField HeaderText="Student Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblSNAME2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>

                        </columns>


                    </asp:GridView>
                </td>
               </tr>
                 <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Students without a personal tutor"></asp:Label>
                 </td>
               </tr>
                 <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="ID" class="col-sm-12">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />


                          <columns>
                       <asp:TemplateField HeaderText="Student Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblSNAME3" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>

                        </columns>

                    </asp:GridView>
                    
                </td>
               </tr>

               
            </tbody>
          </table>

            
        </div>
    </div>
    </form>
</body>
</html>
