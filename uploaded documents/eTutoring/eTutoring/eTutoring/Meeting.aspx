<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="eTutoring.Meeting" %>

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
    <form id="form1" runat="server" >
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
                <h2>Arrange the meeting with Tutor</h2>
                <br/>
                 <br/>                             
             </div>
            <div class="row">
                <br />
                                            
             </div>
            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:Label ID="lblMeeting" runat="server" Text="Meeting Description : "></asp:Label>
                         <asp:TextBox ID="txtMeeting" runat="server" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" runat="server" ErrorMessage="Enter the Meeting description"  ForeColor="Red" ControlToValidate="txtMeeting"></asp:RequiredFieldValidator>
                        
                    </div>
                    </div>
            </div>
              <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:Label ID="lblVenue" runat="server" Text="Venue : " ></asp:Label>
                         <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="save" runat="server" ErrorMessage="Enter the Venue"  ForeColor="Red" ControlToValidate="txtVenue"></asp:RequiredFieldValidator>
                    </div>
                    </div>                   
            </div>
              <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:Label ID="lblDatetime" runat="server" Text="Date & Time : " ></asp:Label>                                             
                         <asp:TextBox ID="picker" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="save" ForeColor="Red" ErrorMessage="Pick a time for the meeting" ControlToValidate="picker"></asp:RequiredFieldValidator>
                    </div>
                    </div>
            </div>
             <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:Button ID="btnMeeting" runat="server" Text="Arrange the Meeting" class="btn btn-lg btn-success col-sm-12" OnClick="btnMeeting_Click" ValidationGroup="save" />
                    </div>
                    </div>
            </div>

             <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="M_ID" class="col-sm-12" OnRowDeleting="GridView1_RowDeleting">
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
                                   <asp:TemplateField HeaderText="Meeting No">
                                         <ItemTemplate>
                                             <asp:Label ID="lblMeetingNo" runat="server" Text='<%# Eval("M_ID") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Meeting">
                                         <ItemTemplate>
                                             <asp:Label ID="lblMeeting" runat="server" Text='<%# Eval("Meeting") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date & Time">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                             </ItemTemplate>                             
                                         </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Venue">
                                         <ItemTemplate>
                                             <asp:Label ID="lblVenue" runat="server" Text='<%# Eval("Venue") %>'></asp:Label>
                                         </ItemTemplate>                             
                                     </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Tutor Approved">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblApproved" runat="server" Text='<%# Eval("T_Approved") %>'></asp:Label>
                                             </ItemTemplate>                             
                                         </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Remarks">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
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
    <script src="js/jquery.datetimepicker.full.min.js"></script>
    <script>        
        $('#picker').datetimepicker({
            timepicker: true,
            datepicker: true,
            Format: 'YYYY-MM-DD HH:MM:SS'
        })      

    </script>




</body>
</html>
