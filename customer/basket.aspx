<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="basket.aspx.cs" Inherits="_basket" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ListView ID="BasketProducts" runat="server" DataKeyNames="product_name" 
         DataSourceID="SqlDataSource1">
         
      
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No products in the Basket.
        </EmptyDataTemplate>
     
        <ItemTemplate>
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName") 
         --> 
        
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
                          <div class ="grid-item">  
                           
               <asp:Image ID="image" CssClass ="grid-item" runat="server" ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png"  : Eval("image_url") %>' AlternateText="Basket Image"/>
   
                   
          <div class="description">
       
                  Name: <asp:Label ID="productLabel" runat="server" Text='<%# Eval("product_name") %>' />
                  <br />
                 Amount: <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
               <br />
              Edit Amount:    <asp:TextBox ID="amount" runat="server" Enabled="true" Text='<%# Eval("amount") %>' ></asp:TextBox>
 <asp:Button ID="EditAmount" runat="server" Text="Save" CssClass ="Save" CommandName="select" OnClick="edit_amount" />
               <br />
              Unit Price: <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>' />
                  <br />
               Total Price: <asp:Label ID="Label1" runat="server" Text='<%# Eval("total_price") %>' />
                  <br />
            
                  <asp:Button ID="Button1" runat="server" Text="Remove From THe Basket" CssClass ="ToTheBasket" CommandName="select" OnClick="delete_products" />
                  <br/>
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

      <asp:ListView ID="ListView2" runat="server" DataKeyNames="total_price" 
         DataSourceID="SqlDataSource2">
               <ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
                 <div class="proceed-to-payment">
                  Total Price: <asp:Label ID="productLabel" runat="server" Text='<%# Eval("total_price") %>' />
                  <br />       
                  <asp:Button ID="Button1" runat="server" Text="Proceed to Payment" CssClass ="ToTheBasket" CommandName="select" OnClick="continue_topay" />
                  <br/>
                          </div>
            </div>
            <div style="clear:both;text-align: center;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
               </ItemTemplate>
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
FROM [Basket] 
WHERE [customer_id] = @customer_id
GROUP BY [price], [amount], [image_url], [product_name], [customer_id]
"
    OnSelecting="SqlDataSource1_Selecting">
    <SelectParameters>
        <asp:Parameter Name="customer_id"/>
    </SelectParameters>
</asp:SqlDataSource>
    <asp:Label ID="resultLabel" runat="server"></asp:Label>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
   ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT SUM(ROUND([price] * [amount], 2)) as total_price, [customer_id]
FROM [Basket]
WHERE [customer_id] = @customer_id
GROUP BY [customer_id]"
    OnSelecting="SqlDataSource1_Selecting">
    <SelectParameters>
        <asp:Parameter Name="customer_id"/>
    </SelectParameters>
</asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server"></asp:Label>



</asp:Content>

