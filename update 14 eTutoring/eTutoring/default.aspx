<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="eTutoring._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

          <div class="col-sm-12">
            <div class="row">
                   <div class="col-sm-12">        
                    <div class="form-group"> 
                     <asp:Button ID="btnWrite" runat="server" Text="Want to write a Blog" class="btn btn-lg btn-success col-sm-12" OnClick="btnWrite_Click"  />
                    </div>
                    </div>
            </div>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="gridview col-sm-12" ShowHeader="false" GridLines="None">
            <Columns>
            <asp:TemplateField ShowHeader="false">
            <ItemTemplate>
            <tr>
            <td>
            <div class="BlogHead">
            <h2><a href='<%# Eval("Id", "details.aspx?Id={0}") %>' class="BlogHead">
            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Title") %>'></asp:Label></a></h2>
    
            </div>
            <div class="post_meta">
                <span class="post_author blackLink nocursor"><asp:Label ID="Label2" runat="server" Text='<%#Eval("Author") %>'></asp:Label>,</span>
                <span class="date blackLink nocursor"><asp:Label ID="Label11" runat="server" Text='<%#Eval("BlogDate") %>'></asp:Label></span>
            </div>
            <br />
            <div id="blbodythumb" style="text-align:justify;">
            <p><asp:Label ID="Label100" runat="server" Text='<%#Eval("BContent") %>' ></asp:Label></p></div><hr class="style-one" />
            </td>
            </tr>
            </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
            No data
            </EmptyDataTemplate>
            </asp:GridView>
          </div>


</asp:Content>
