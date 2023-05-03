

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits ="_product"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ListView ID="Products" runat="server" DataKeyNames="name" 
         DataSourceID="SqlDataSource1" OnSelectedIndexChanged="selected_product">
         
      
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No products availaible.
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
                            <asp:Label ID="productLabel" runat="server" Text='<%# Eval("name") %>' /></p>
                        <p><strong>Amount:</strong> 
                            <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("description") %>' /></p>
                
                           <asp:Button ID="Button1" runat="server" Text="Add To Basket" CssClass ="ToTheBasket" CommandName="select"/>
                  <br/>
                    </div>
                </div>
            </ItemTemplate>




     <LayoutTemplate>
    <div id="itemPlaceholderContainer" runat="server" style="background-color: #ffe0e6; padding: 10px;">
        <span runat="server" id="itemPlaceholder" />
    </div>
        <div style="clear: both; text-align: center; background-color: #FFE4E1; padding: 10px;">
<asp:DataPager ID="DataPager1" runat="server" PageSize="6">
    <Fields>
        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="Left" />
             <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="Lef" />
        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="Left" />
    </Fields>
</asp:DataPager>
    </div>
</LayoutTemplate>

      </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [name], [description], [image_url] FROM [Product] ORDER BY [name]">
     </asp:SqlDataSource>
    <asp:Label ID="resultLabel" runat="server"></asp:Label>



</asp:Content>

