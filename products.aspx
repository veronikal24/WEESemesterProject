

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
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName") 
         --> 
         <div class ="grid-container">
        
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
                          <div class ="grid-item">  
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image_url").ToString() == "" ? "~/images/header.png"  : Eval("image_url") %>' AlternateText="Room Image"/>
            </div>
                   
          <div class="description">
       
                  Name: <asp:Label ID="croomidLabel" runat="server" Text='<%# Eval("name") %>' />
                  <br />
                 Description: <asp:Label ID="seatsLabel" runat="server" Text='<%# Eval("description") %>' />
                  <br />
             
                  <asp:Button ID="Button1" runat="server" Text="Add To Basket" CssClass ="ToTheBasket" CommandName="select"/>
                  <br/>
        </div>
          
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
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
      </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [name], [description], [image_url] FROM [Product] ORDER BY [name]">
     </asp:SqlDataSource>
    <asp:Label ID="resultLabel" runat="server"></asp:Label>



</asp:Content>

