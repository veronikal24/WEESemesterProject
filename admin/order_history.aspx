<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_history.aspx.cs" Inherits="customer_order_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Order Overview</title>
    <link rel="stylesheet" href="style.css">

    <h1>Order Overview</h1>
    <div class="order-history">
        <h2>Order Information:</h2>
        <asp:GridView ID="OrderHistoryGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="customer_id" DataFormatString="{0:C}" HeaderText="Customer" />
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="amount" HeaderText="Amount" />
                <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="Unit Price" />
                <asp:BoundField DataField="total_price" DataFormatString="{0:C}" HeaderText="Total Price" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT 
                ROUND(price * amount, 2) AS total_price, 
                ROUND(price, 2) AS price, 
                amount, 
                product_name,
                customer_id
                FROM [ORDER]"
            OnSelecting="SqlDataSource1_Selecting">
        
        </asp:SqlDataSource>
    </div>
</asp:Content>
