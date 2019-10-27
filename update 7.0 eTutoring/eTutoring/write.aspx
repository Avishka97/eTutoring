<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="write.aspx.cs" Inherits="eTutoring.write" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>



            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                        Title:<asp:TextBox ID="txbxTitle" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                    Author:<asp:TextBox ID="txbxAuthor" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    </div>
           
    </div>
            <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                       Blog : <br />
                    <asp:TextBox ID="txbxContent" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                    </div>
                    </div>
        </div>           
            <div class="row">
                   <div class="col-sm-12">        
                    <div class="form-group"> 
                    <asp:Button ID="Button1" runat="server" Text="Submit your blog" class="btn btn-lg btn-success col-sm-12" OnClick="Button1_Click" />
                        
                    </div>

                   </div>

        </div>
    
    
    </div>
    
    



</asp:Content>
