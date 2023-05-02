<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_confirmation.aspx.cs" Inherits="customer_order_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <h1>Your Order Has Been Succesfully placed</h1>

    <h2>Order Information:</h2>
        
     <asp:ListView ID="BasketProducts" runat="server" DataKeyNames="product_name" 
         DataSourceID="SqlDataSource1">
         
      
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No products have been ordered.
        </EmptyDataTemplate>
      
        <ItemTemplate>
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName") 
         --> 
         <div class ="grid-container">
        
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
                          <div class ="grid-item">  
                           
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png"  : Eval("image_url") %>' AlternateText="Basket Image"/>
            </div>
                   
          <div class="description">
       
                  Name: <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product_name") %>' />
                  <br />
                 Amount: <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
               <br />
              Unit Price: <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>' />
                  <br />
               Total Price: <asp:Label ID="Label1" runat="server" Text='<%# Eval("total_price") %>' />
                  <br />
            
 
        </div>
        </ItemTemplate>
            
                 <LayoutTemplate> 
       
           </LayoutTemplate>

        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
          
            </div>
        
        </LayoutTemplate>
      </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
   ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT 
    ROUND([price] * [amount], 2) AS total_price, 
    ROUND([price], 2) AS price, 
    [amount], 
    [image_url], 
    [product_name],
    [customer_id], 
    SUM(ROUND([price] * [amount], 2)) AS customer_total_price
FROM [ORDER] 
WHERE [customer_id] = @customer_id
AND [timestamp] >= DATEADD(minute, -1, 
    (SELECT MAX([timestamp]) FROM [ORDER] WHERE [customer_id] = @customer_id))
GROUP BY [price], [amount], [image_url], [product_name], [customer_id]"
    OnSelecting="SqlDataSource1_Selecting">
    <SelectParameters>
        <asp:Parameter Name="customer_id"/>
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>


