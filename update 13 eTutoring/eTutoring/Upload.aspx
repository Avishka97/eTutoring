<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="eTutoring.Upload" %>

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
              <a class="nav-link" href="Student.aspx">Home</a>
            </li>              
            <li class="nav-item btn-outline-success my-2 my-sm-0">
                <asp:Label ID="lbl_User" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblUserdropdownlist" runat="server" Text="" Visible="false"></asp:Label>
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
                <h2>Upload Articles</h2>
                <br/>
                 <br/>                             
             </div>
            
            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" class="btn btn-lg btn-success col-sm-12" ForeColor="Black" />
                    </div>
                    </div>
            </div>
            <div class="row">
                   <div class="col-sm-12">        
                    <div class="form-group"> 
                     <asp:Button ID="btnUpload" runat="server" Text="Upload" class="btn btn-lg btn-success col-sm-12" OnClick="btnUpload_Click" />
                    </div>
                    </div>
            </div>
            <div class="row">
                <br />
                               
            </div>

            <div class="row">
            <div class="col-sm-12"> 

                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" class="col-sm-12" DataKeyName="A_ID" OnRowDeleting="GridView1_RowDeleting" >
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
                        <asp:TemplateField HeaderText="Article No">
                             <ItemTemplate>
                                 <asp:Label ID="lblANo" runat="server" Text='<%# Eval("A_ID") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>
                        <asp:TemplateField HeaderText="Uploaded Date and Time">
                             <ItemTemplate>
                                 <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Article Name">
                             <ItemTemplate>
                                 <asp:Label ID="lblArticle" runat="server" Text='<%# Eval("Article") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>
                        <asp:TemplateField HeaderText="Article">
                             <ItemTemplate>
                                 <asp:Label ID="lblArticlePath" runat="server" Text='<%# Eval("Article_Path") %>'></asp:Label>
                             </ItemTemplate>                             
                         </asp:TemplateField>
                        <asp:TemplateField>
                             <ItemTemplate>
                                 <asp:ImageButton ImageUrl="~/img/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                             </ItemTemplate>                             
                         </asp:TemplateField>
                    </columns>


                </asp:GridView>

            </div>
            </div>
                
            <div class="row">
                 <br />                  
                 <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                 <br />
                 <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
            <div class="row">
                <h2>Comments Articles</h2>
                <br/>
                 <br/>                             
             </div>
             <div class="row">
                <div class="col-sm-6">        
                    <div class="form-group"> 
                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Article" DataValueField="A_ID"></asp:DropDownList>


                        <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:Test %>" SelectCommand="SELECT [A_ID], [Article] FROM [Article] ">
                           
                        </asp:SqlDataSource>
                     </div>
                   </div>
            </div>
             <div class="row">
                <div class="col-sm-6">        
                    <div class="form-group"> 
                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                    </div>
                   </div>
                  <div class="col-sm-6">        
                    <div class="form-group"> 
                        <asp:Button ID="btnComment" runat="server" Text="Comment" class="btn btn-lg btn-success col-sm-12" OnClick="btnComment_Click" />
                    </div>
                   </div>
            </div>
             
            <div class="row">
                <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView2_RowDeleting" AutoGenerateColumns="false" DataKeyName="C_ID" class="col-sm-12">
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
                                   <asp:TemplateField HeaderText="Comment No">
                                         <ItemTemplate>
                                             <asp:Label ID="lblCNo" runat="server" Text='<%# Eval("C_ID") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Article No">
                                         <ItemTemplate>
                                             <asp:Label ID="lblA2No" runat="server" Text='<%# Eval("A_ID") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comment">
                                         <ItemTemplate>
                                             <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>                                     
                                    <asp:TemplateField>
                                         <ItemTemplate>
                                             <asp:ImageButton ImageUrl="~/img/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                                         </ItemTemplate>                             
                                     </asp:TemplateField>
                                </columns>







                        </asp:GridView>
                    </div>
                </div>

            </div>

            <div class="row">
                 <br />                  
                 <asp:Label ID="lblmessage2" runat="server" Text="" ForeColor="Green"></asp:Label>
                 <br />
                 <asp:Label ID="lblerrormessage2" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>

        </div>
    
    </div>
    </form>
</body>
</html>
