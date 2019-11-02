<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="eTutoring.Message" %>

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
         <link href="css/jquery.datetimepicker.min.css" rel="stylesheet" />
        
        


</head>
<body>
    <form id="form1" runat="server">
    <div>
      <!--header-->
         <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top justify-content-between">
          <a class="navbar-brand" href="#">
            <img src="img/logo-elearning-color.png" alt="logo" style="width:100px;"/>
          </a>
  
          
          <ul class="navbar-nav form-inline ">  
              <li class="nav-item btn-outline-success my-2 my-sm-0">
              <a class="nav-link" href="Student.aspx">Home</a>
            </li>              
            <li class="nav-item btn-outline-success my-2 my-sm-0">
                <asp:Label ID="lbl_User" runat="server" Text=""></asp:Label>
            </li>                       
          </ul>


        </nav>
        
           
         <div class="jumbotron text-center align-content-center  m-md-2 ">
               <br />
                <h1 class="h1" style="text-align:center">eTutoring System</h1>   
            
            </div>
        <!--Body-->
        <div class="container" >

 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                  <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>             
                                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">   
                                      
                                    <ContentTemplate > 


                                                    <div class="row">
                                                            <div class="col-sm-12">        
                                                            <div class="form-group"> 
                        

                                                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyName="M_ID" class="col-sm-12">
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
                                                                            <asp:TemplateField ShowHeader="False">
                                                                                 <ItemTemplate>
                                                                                     <asp:Label ID="lblmdate" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                                                                 </ItemTemplate>                             
                                                                                 <ControlStyle Font-Bold="False" Font-Size="XX-Small" Width="100px" />
                                                                                 <HeaderStyle Width="100px" />
                                                                             </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                                                 <ItemTemplate>
                                                                                     <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Sender") %>'></asp:Label>
                                                                                 </ItemTemplate>                             
                                                                                 <ControlStyle Font-Size="Smaller" Width="20px" />
                                                                                 <HeaderStyle Width="100px" />
                                                                             </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="" ShowHeader="False">
                                                                                 <ItemTemplate>
                                                                                     <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                                                                 </ItemTemplate>                             
                                                                                 <ControlStyle Font-Size="Large" />
                                                                             </asp:TemplateField>
                                                                  </columns>

                                                                </asp:GridView>


                                                            </div>
                                                            </div>

                                                    </div>

                                </ContentTemplate>
                                      <Triggers>
                                          <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                      </Triggers>   
                                  </asp:UpdatePanel>   


            <div class="row">
                    <div class="col-sm-10">        
                    <div class="form-group"> 
                        <asp:TextBox ID="txtMessage" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    </div>
                    <div class="col-sm-2">        
                    <div class="form-group"> 
                        <asp:ImageButton ID="btnMessage" ImageUrl="~/img/send.png" runat="server"  CommandName="Send" ToolTip="Send" Width="50px" Height="40px" OnClick="btnMessage_Click"/>                     
                    </div>
                    </div>
            </div>

        </div>

    </div>
    </form>
</body>
</html>
