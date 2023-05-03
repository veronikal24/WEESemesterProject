<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-color: #E6C7C2;
            font-family: Arial, sans-serif;
            font-size: 16px;
        }

        #login-box {
            background-color: #F6E1D3;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
            max-width: 400px;
            padding: 20px;
        }

        #login-box h2 {
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group input[type="submit"] {
            background-color: #9E425E;
            color: #F6E1D3;
            border: none;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color:#9E425E;
        }

        #create-account {
            text-align: center;
        }

        #create-account a {
            color: #9E425E;
            text-decoration: none;
        }

        #create-account a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="login-box">
        <h2>Login</h2>
        <asp:Login ID="Login1" runat="server" CssClass="form-group" />
        <div id="create-account">
            <p>Don't have an account? <a id="A1" href="#" runat="server" onserverclick="create_account_nav">Create one now.</a></p>
        </div>
    </div>
</asp:Content>
