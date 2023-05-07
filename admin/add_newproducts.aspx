<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_newproducts.aspx.cs" Inherits="admin_add_newproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <h1>Here you can add new products: 
    </h1>
    
    <asp:FileUpload ID="fileUploadControl" runat="server" CssClass="file-upload" />
              <br />
       
        <h2>Product Information:</h2>
<label for="Name">Name:</label>
    <asp:TextBox ID="name" runat="server" Enabled="true" ></asp:TextBox>
<br />
<label for="description">Description:</label>
    <asp:TextBox ID="description" runat="server" Enabled="true" ></asp:TextBox>
 <br />
    <label for="Category">Category:</label>
    <asp:TextBox ID="category" runat="server" Enabled="true" ></asp:TextBox>
<br />
         <label for="price">Price</label>
    <asp:TextBox ID="price" runat="server" Enabled="true" ></asp:TextBox>
        <br />
           <br />
           <br />
           <br />
           <br />
<br />


    <br />
    <style>     /* Headings */
    h1, h2 {
        color:black;
        font-weight: bold;
        margin: 0 0 20px 0;
             margin-left:150px;
       
    }

    /* Labels */
    label {
        color: black;
        display: block;
        font-weight: bold;
        margin-bottom: 10px;
             margin-left:150px;
    }

    /* Textboxes */
    input[type="text"] {
        background-color: #E6D2D4;
        border: 1px solid #E6D2D4;
        color: #333333;
        font-size: 16px;
        padding: 10px;
        width: 250px;
        margin-left:150px;
    }

    /* File upload */
    input[type="file"] {
        margin-bottom: 20px;
    }

    /* Buttons */
    input[type="button"], input[type="submit"] {
        background-color: #E6D2D4;
        border: none;
        color: #FFFFFF;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        text-transform: uppercase;
             margin-left:150px;
    }

    input[type="button"]:hover, input[type="submit"]:hover {
        background-color: #E6D2D4;
        color: #333333;
    }
        /* Style for file upload control */
    .file-upload {
        background-color: #f5e4ea; /* Light pink */
        border: none;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
             margin-left:150px;
    }

    /* Style for file upload button */
    .file-upload-button {
        background-color:#F2ACB9;
        border: none;
        color: white;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
             margin-left:190px;
    }

    /* Error message */
    .error-message {
        color: #FF69B4;
        font-weight: bold;
        margin-top: 20px;
        text-align: center;
    }
</style>
<asp:Button ID="uploadButton" runat="server" Text="Upload File" OnClick="add_new_product" />
              <br />
    <asp:Image ID="uploadedImage" runat="server" Visible="false" />
              <br />
<asp:Label ID="errorMessageLabel" runat="server" Visible="false" ForeColor="Red" />
              <br />
         
</asp:Content>

