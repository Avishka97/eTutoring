<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAllocation.aspx.cs" Inherits="eTutoring.StudentAllocation" %>

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
              <a class="nav-link" href="StudentAllocation.aspx">Home</a>
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
                 <div class="col-sm-12"> 
                      
                 <asp:GridView ID="GridView1" class="col-sm-12" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="S_ID" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
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
                       <asp:TemplateField HeaderText="Student No">
                             <ItemTemplate>
                                 <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("S_ID") %>'></asp:Label>
                             </ItemTemplate>
                             <EditItemTemplate>
                                 <asp:Label ID="lblENo" runat="server" Text='<%# Eval("S_ID") %>'></asp:Label>
                             </EditItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Student Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblSName" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                             </ItemTemplate>
                             <EditItemTemplate>
                                 <asp:Label ID="lblEName" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                             </EditItemTemplate>
                         </asp:TemplateField>

                         <asp:TemplateField HeaderText="Tutor Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblTName" runat="server" Text='<%# Eval("T_ID") %>'></asp:Label>
                             </ItemTemplate>
                             <EditItemTemplate>
                                 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="T_Name" DataValueField="T_ID" AutoPostBack="True"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test %>" SelectCommand="SELECT [T_ID], [T_Name] FROM [Tutor]"></asp:SqlDataSource>
                             </EditItemTemplate>

                         </asp:TemplateField>
                           
                         <asp:TemplateField>
                             <ItemTemplate>
                                 <asp:ImageButton ImageUrl="~/img/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                 <asp:ImageButton ImageUrl="~/img/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                             </ItemTemplate>
                             <EditItemTemplate>
                                 <asp:ImageButton ImageUrl="~/img/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                 <asp:ImageButton ImageUrl="~/img/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                             </EditItemTemplate>
                         </asp:TemplateField>
                         
                     </columns>
                 </asp:GridView>
                
                 
                 </div>
                </div>
                 <%--<div class="row">
                     <asp:Button ID="btnEdit" runat="server" Text="Edit at once" OnClick="btnEdit_Click" />
                     <asp:Button ID="btnUpdate" runat="server" Text="Assign Tutors to all" OnClick="btnUpdate_Click" />
                 </div>--%>

                 <div class="row">
                 <br />                  
                 <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                 <br />
                 <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                 </div>
                 <div class="row">
                  <br /> 
                 <asp:Label ID="Label1" runat="server" Text="" ForeColor="Green"></asp:Label>
                 </div>




             </div>
    
    </div>
    </form>
</body>
</html>
