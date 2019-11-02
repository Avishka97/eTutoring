<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="eTutoring.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
         <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" Width="100%" GridLines="None" class="col-sm-12">
<Fields>
<asp:TemplateField ShowHeader="false">
<ItemTemplate>
<tr>
<div>
<h2>
<asp:Label ID="lblBlogPostTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label></h2>
<div>
<span>
<asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'></asp:Label></span>
<span>
<asp:Label ID="lblBlogDate" runat="server" Text='<%#Eval("BlogDate") %>'></asp:Label></span>
</div>
<div style="text-align: justify;">
<p>
<asp:Label ID="lblMessage" runat="server" Text='<%#Eval("BContent") %>'></asp:Label></p>
</div>
</div>
</tr>
</ItemTemplate>
</asp:TemplateField>
</Fields>
</asp:DetailsView>
                        
                    </div>

                    </div>

         </div>
</div>
<div>
<hr />
comments:
<br />
     <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
<asp:GridView ID="GridViewcomment" runat="server" class="col-sm-12" AutoGenerateColumns="false" ShowHeader="false" GridLines="None" Width="100%" CellSpacing="10">
<Columns>
<asp:TemplateField>
<ItemTemplate>
<tr>
<td>
<div>
<asp:Label ID="lblauthor" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Italic="true" Font-Size="Large"></asp:Label>
<asp:Label ID="LabelCommentDate" runat="server" Text='<%# Eval("Date") %>' Font-Size="Smaller"></asp:Label>
</div>
<div>
<p>
<asp:Label ID="Lblcomment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label></p>
</div>
</td>
</tr>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
                       
                    </div>

                    </div>

     </div>
    <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group"> 
                     <asp:Label ID="LabelNoComment" runat="server" class="form-control" Text="No comments yet." Visible="false"></asp:Label>
                        
                    </div>

                    </div>

    </div>
</div>
    
<div id="comment_form">
    <div class="row">
    <h3>Post a comment</h3>
    </div>
    <div class="row">
        <div class="col-sm-12">        
                    <div class="form-group"> 
                    <label>Name</label>
                    <asp:TextBox ID="txbxcommentauthor" class="form-control"  runat="server" MaxLength="30"></asp:TextBox>
                    </div>
        </div>
    </div>

    <div class="row">
           <div class="col-sm-12">        
           <div class="form-group">

            <label>Comment</label>
            <asp:TextBox ID="txbxcomment" class="form-control"  runat="server" TextMode="MultiLine"></asp:TextBox>
               
           </div>

           </div>

    </div>

     <div class="row">
                    <div class="col-sm-12">        
                    <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" class="btn btn-lg btn-success col-sm-12" />
                        
                    </div>

                    </div>

     </div>
</div>







</asp:Content>
