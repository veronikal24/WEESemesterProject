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

  <label for="email">Email address:</label>
  <input type="email" id="email" name="email" required>
    <br />
<h2>Adress</h2>
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
      
<asp:Button ID="Button1" runat="server" Text="Confirm" CssClass ="ToTheBasket" CommandName="select" OnClick="continue_toconfirm" />
                  <br/>
     <br/>

<style>

    /* apply some basic styles to the form elements */
input[type="text"], input[type="email"] {
  padding: 8px;
  border-radius: 4px;
  border: 1px solid #ccc;
  margin: 10px;
  font-size: 16px;
  width: 100%;
    margin-left:50px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
    margin-left:50px;
}

h1 {
  font-size: 24px;
  margin-bottom: 20px;
  margin-left:50px;
}

    h2 {
        font-size: 20px;
        margin-top: 30px;
        margin-bottom: 10px;
          margin-left:50px;
    }

.ToTheBasket {
  background-color: #9E425E;
  border: none;
  color: white;
    margin-left:50px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 20px;
  cursor: pointer;
  border-radius: 4px;
}

.ToTheBasket:hover {
  background-color: #3e8e41;
}

/* apply some styles to the error messages */
input:invalid {
  border-color: red;
}

input:invalid + span:before {
  content: "✖ ";
  color: red;
  font-size: 14px;
}

input:valid + span:before {
  content: "✓ ";
  color: #9E425E;
  font-size: 14px;
}

input:focus {
  outline: none;
  box-shadow: 0 0 5px #ccc;
}




</style>
<!-- JavaScript validation code -->
<script>
    function validateEmail() {
        var emailInput = document.getElementById("email");
        var email = emailInput.value;
        if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
            alert("Please enter a valid email address.");
            emailInput.focus();
            return false;
        }
        return true;
    }


    function validateFirstName() {
        var firstName = document.getElementById("firstName");
        var fname = firstName.value;
        if (!fname.match(/(?:[ -][A-Za-z]+)*/)) {
            alert("Please enter a valid firstName.");
            firstName.focus();
            return false;
        }
        return true;
    }
    function validateLastName() {
        var lastName = document.getElementById("lastName");
        var lname = lastName.value

        if (!lname.match(/(?:[ -][A-Za-z]+)*/)) {
            alert("Please enter a valid lastName.");
            lastName.focus();
            return false;
        }
        return true;
    }
    function validatecreditcard() {
        var x = document.getElementById("cardNumber");
        var xx= x.value
        // I will keep it simpla and will only do Visa Validation
     
        return true;
    }
    function validatetheCVCcard() {
        var x = document.getElementById("CVR");
        var xx = x.value
        // I will keep it simpla and will only do basic validation
        if (!xx.match(/^\d{3}$/)) {
            alert("Please enter a valid CVC number.");
            x.focus();
            return false;
        }
        return true;
    }
    // this methods makes sure every field is valid otherwise will not let you click it
    // smart I know

    var form = document.querySelector("form");
    form.addEventListener("submit", function (event) {
        if (!validateEmail() || !validateFirstName() || !validateLastName() || !validatetheCVCcard() || !validatecreditcard()) {
            event.preventDefault();
        }
    });
</script>
</asp:Content>

