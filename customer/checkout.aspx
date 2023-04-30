<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="customer_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Checkout</h1>

    <h2>Customer Information:</h2>
<label for="firstName">First Name:</label>
<input id="firstName" type="text" />
<br />
<label for="lastName">Last Name:</label>
<input id="lastName" type="text" />
<br />
<label>Address:</label>
<br />
<label for="street">Street:</label>
<input id="street" type="text" />
<br />
<label for="postCode">Post Code:</label>
<input id="postCode" type="text" />
<br />
<label for="apartmentNumber">Apartment Number:</label>
<input id="apartmentNumber" type="text" />

<h2>Credit Card Information:</h2>
<label for="cardNumber">Card Number:</label>
<input id="cardNumber" type="text" />
<br />
<label for="expirationDate">Expiration Date:</label>
<input id="expirationDate" type="text" />
<br />
<input id="CVR" type="text" />
   <br/>
      <br/>
      
<asp:Button ID="Button1" runat="server" Text="Confirm" CssClass ="ToTheBasket" CommandName="select" OnClick="edit_products" />
                  <br/>
     <br/>



</asp:Content>

