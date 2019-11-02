<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutor.aspx.cs" Inherits="eTutoring.Tutor" %>

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
                   

         <!-- left Links -->
          <ul class="navbar-nav form-inline ">  
              <li class="nav-item btn-outline-success my-2 my-sm-0">
              <a class="nav-link" href="Tutor.aspx">Home</a>
            </li>              
            <li class="nav-item btn-outline-success my-2 my-sm-0">
                <asp:Label ID="lbl_User" runat="server" Text=""></asp:Label>
                <asp:Label ID="LabelUsername" runat="server" Text="" Visible="false"></asp:Label>
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
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="S_Name" DataValueField="S_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test %>" SelectCommand="SELECT [S_ID], [S_Name] FROM [Student] WHERE ([T_ID] = @T_ID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="LabelUsername" Name="T_ID" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
              </div>

           


            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <div class="card">
                              <div class="card-header">
                                Message App
                              </div>
                              <div class="card-body">
                                <h5 class="card-title"> Message with the Student</h5>
                       
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
                                                             <ControlStyle Font-Size="Smaller" Width="100px" />
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
                    </div>
                    </div>
            </div>



                   <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        <div class="card">
                              <div class="card-header">
                                Meeting
                              </div>
                              <div class="card-body">
                                <h5 class="card-title"> Arrange meeting</h5>
                                    <div class="row">
                                     <div class="col-sm-12">        
                                        <div class="form-group"> 
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
                                                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyName="M_ID" class="col-sm-12" OnRowCommand="GridView2_RowCommand" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting">
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
                                                                    <EditItemTemplate>
                                                                         <asp:Label ID="lblMeetingNo2" runat="server" Text='<%# Eval("M_ID") %>'></asp:Label>
                                                                     </EditItemTemplate>                             
                                                                 </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Meeting">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lblMeeting" runat="server" Text='<%# Eval("Meeting") %>'></asp:Label>
                                                                     </ItemTemplate> 
                                                                     <EditItemTemplate>
                                                                         <asp:Label ID="lblMeeting2" runat="server" Text='<%# Eval("Meeting") %>'></asp:Label>
                                                                     </EditItemTemplate>                            
                                                                 </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Date & Time">
                                                                         <ItemTemplate>
                                                                             <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                                                         </ItemTemplate>
                                                                           <EditItemTemplate>
                                                                         <asp:Label ID="lblDate2" runat="server" Text='<%# Eval("Date_Time") %>'></asp:Label>
                                                                     </EditItemTemplate>                       
                                                                     </asp:TemplateField> 
                                                                <asp:TemplateField HeaderText="Venue">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lblVenue" runat="server" Text='<%# Eval("Venue") %>'></asp:Label>
                                                                     </ItemTemplate>
                                                                     <EditItemTemplate>
                                                                         <asp:Label ID="lblVenue2" runat="server" Text='<%# Eval("Venue") %>'></asp:Label>
                                                                     </EditItemTemplate>                                                                                                  
                                                                 </asp:TemplateField>  
                                                                <asp:TemplateField HeaderText="Tutor Approved">
                                                                         <ItemTemplate>
                                                                             <asp:Label ID="lblApproved" runat="server" Text='<%# Eval("T_Approved") %>'></asp:Label>
                                                                         </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                                                                <asp:ListItem Selected="True">Approved</asp:ListItem>
                                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </EditItemTemplate>                                
                                                                     </asp:TemplateField> 
                                                                <asp:TemplateField HeaderText="Remarks">
                                                                         <ItemTemplate>
                                                                             <asp:Label ID="lblRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
                                                                         </ItemTemplate>  
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtRemark" runat="server" ></asp:TextBox>
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
                                                </div>
                                             
                                   


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
                    </div>
                 </div>
            </div>

             <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                         <div class="card">
                              <div class="card-header">
                                Uploded Documents
                              </div>
                              <div class="card-body">
                                <h5 class="card-title"> Uploaded documents of the student</h5>
                                  
                                


                                    <div class="row">
                                    <div class="col-sm-12">
                                        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" class="col-sm-12" DataKeyName="A_ID" OnRowDeleting="GridView3_RowDeleting" >
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
                                                                 <asp:ImageButton ImageUrl="~/img/download.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                                                             </ItemTemplate>                             
                                                         </asp:TemplateField>
                                                    </columns>





                                        </asp:GridView>


                                    </div>
                                    </div>
                                         
                                        
                                        
                                        
                                        </div>


                             </div>
                       


                         </div>
                 </div>
            </div>

             <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group">
                         <div class="card">
                              <div class="card-header">
                                Comment on Documents
                              </div>
                              <div class="card-body">
                                <h5 class="card-title"> Uploaded documents of the student</h5>
                                  
                                 
                                  
                                    <div class="row">
                                        <div class="col-sm-6">        
                                            <div class="form-group"> 
                                                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="Article" DataValueField="A_ID"></asp:DropDownList>
                             
                                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test %>" SelectCommand="SELECT [A_ID], [Article] FROM [Article] WHERE ([S_ID] = @S_ID)">
                                                      <SelectParameters>
                                                          <asp:ControlParameter ControlID="DropDownList1" Name="S_ID" PropertyName="SelectedValue" Type="Int32" />
                                                      </SelectParameters>
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

                                                    <asp:GridView ID="GridView4" runat="server" class="col-sm-12" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView4_RowDeleting" AutoGenerateColumns="false" DataKeyName="C_ID">
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

                               





                             </div>
                     </div>
                 </div>
            </div>


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
