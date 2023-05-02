<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_history.aspx.cs" Inherits="customer_order_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Order Overview</title>
    <link rel="stylesheet" href="style.css">

    <h1>Order Overview</h1>
    <div class="order-history">
        <h2>Order Information:</h2>
        <asp:ListView ID="BasketProducts" runat="server" DataKeyNames="product_name" 
             DataSourceID="SqlDataSource1">
            <EmptyDataTemplate>
                <p>No products have been ordered.</p>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="order-item">
                    <div class="order-item-image">
                        <asp:Image ID="image" runat="server" 
                            ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png" : Eval("image_url") %>'
                            AlternateText="Basket Image" />
                    </div>
                    <div class="order-item-details">
                        <p><strong>Product Name:</strong> 
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product_name") %>' /></p>
                        <p><strong>Amount:</strong> 
                            <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' /></p>
                        <p><strong>Unit Price:</strong> 
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("price", "{0:C}") %>' /></p>
                        <p><strong>Total Price:</strong> 
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("total_price", "{0:C}") %>' /></p>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" class="order-items">
                    <span runat="server" id="itemPlaceholder"></span>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT 
            ROUND(price * amount, 2) AS total_price, 
            ROUND(price, 2) AS price, 
            amount, 
            image_url, 
            product_name,
            customer_id
            FROM [ORDER] 
            WHERE customer_id = @customer_id"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="customer_id" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>