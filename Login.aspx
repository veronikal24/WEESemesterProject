<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   <!-- Login control with textfields for username and password. Automatically handles 
        everything required for logging into the web site, and provides a fairly good
        protection against SQL injection 
       nk
       xx
   -->
   <asp:Login ID="Login1" runat="server"></asp:Login> 
         <br />
    <h2>Create an Account:</h2>
          <br />
    <asp:Button ID="Button1" runat="server" Text="Create An Account" CssClass ="ToTheBasket" CommandName="select" OnClick="create_account_nav" />
      <br />
          <br />
</asp:Content>  

