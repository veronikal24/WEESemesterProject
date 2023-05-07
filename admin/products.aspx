

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/products.aspx.cs" Inherits ="_product"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ListView ID="Products" runat="server" DataKeyNames="name" 
         DataSourceID="SqlDataSource1" >
         
      
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No products availaible.
        </EmptyDataTemplate>

<ItemTemplate>
  <div class="grid-container">
    <div class="product">
      <asp:Image ID="image" runat="server" CssClass="product-image" ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png" : Eval("image_url") %>' AlternateText="Room Image" />
      <div class="product-description">
        <p><strong>Name:</strong> <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("name") %>' /></p>
        <p><strong>Description:</strong> <asp:Label ID="seatsLabel" runat="server" Text='<%# Eval("description") %>' /></p>
        <button class="delete-btn" type="button" onclick ="selected_product_delete">Delete Product</button>
      </div>
    </div>
  </div>
</ItemTemplate>

                  <ItemTemplate>
                <div class="order-item">
                    <div class="order-item-image">
                        <asp:Image ID="image" runat="server" 
                            ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png" : Eval("image_url") %>'
                            AlternateText="Basket Image" />
                    </div>
                                </div>
                    <div class="order-item-details">
                        <p><strong>Product Name:</strong> 
                            
                            <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("name") %>' /></p>
                            Edit Name:    
                        
                        <asp:TextBox ID="name" runat="server" Enabled="true" Text='<%# Eval("name") %>' ></asp:TextBox>
 <asp:Button ID="EditName" runat="server" Text="Save" CssClass ="Save" CommandName="select" OnClick="edit_name" />
                            <p><strong>Description:</strong> 
                            <asp:Label ID="description" runat="server" Text='<%# Eval("description") %>' /></p>

                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' /></p>
                            Edit Description:    
                        
                        <asp:TextBox ID="desc" runat="server" Enabled="true" Text='<%# Eval("description") %>' ></asp:TextBox>
 <asp:Button ID="descbutton" runat="server" Text="Save" CssClass ="Save" CommandName="select" OnClick="edit_description" />


                        <p><strong>Price:</strong> 
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("price") %>' /></p>

                          Edit Price:    
                        
                        <asp:TextBox ID="price" runat="server" Enabled="true" Text='<%# Eval("price") %>' ></asp:TextBox>
 <asp:Button ID="pricebutton" runat="server" Text="Save" CssClass ="Save" CommandName="select" OnClick="edit_price" />

        
                          
                          <button class="delete-btn" type="button">Delete Product</button>
                  <br/>
           
                </div>
            </ItemTemplate>

        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
        <div style="clear: both; text-align: center; background-color: #FFE4E1; padding: 10px;">
<asp:DataPager ID="DataPager1" runat="server" PageSize="6">
    <Fields>
        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"   ButtonCssClass="Left"/>
        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="Lef" />
        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  ButtonCssClass="Left" />
    </Fields>
</asp:DataPager>

            </div>
        </LayoutTemplate>
      </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [name], [description],[price], [image_url] FROM [Product] ORDER BY [name]">
     </asp:SqlDataSource>
    <asp:Label ID="resultLabel" runat="server"></asp:Label>



</asp:Content>

