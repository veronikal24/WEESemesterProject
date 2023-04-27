

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits ="_product"  %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="headingspan">Products:</span> <br /><br />
      <div class="container">
  <div class="heading">
  
        <asp:Image ID="AvocadoMask"  runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/AvacadoMask.jpg" />
        <asp:Image ID="Cakemask" runat="server"  CssClass ="product"   ImageUrl="~/images/product_images/CakeMask.jpg"  />
        <asp:Image ID="CoconatHairOil" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/CoconatHairOil.jpg"  />
        <asp:Image ID="CoreanMasks" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/CoreanMasks.jpg"  />
        <asp:Image ID="exfoliatingmasks"  runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/exfoliatingmasks.jpg" />
        <asp:Image ID="facialserum" runat="server"  CssClass ="product"   ImageUrl="~/images/product_images/FacialSerum.jpg"  />
        <asp:Image ID="LipMask" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/LipMask.jpg"  />
        <asp:Image ID="LipMasks" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/LipMasks.jpg"  />
        <asp:Image ID="refiningserum" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/refiningserum.jpg"  />
        <asp:Image ID="rosewater" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/RoseWater.jpg"  />
        <asp:Image ID="setofserums"  runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/setofserums.jpg" />
        <asp:Image ID="strawberryGlow" runat="server"  CssClass ="product"   ImageUrl="~/images/product_images/StrawberryGlow.jpg"  />
        <asp:Image ID="sugarsrubs" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/SugarScrubs.jpg"  />
        <asp:Image ID="vitamina" runat="server"  CssClass ="product"  ImageUrl="~/images/product_images/Vitamin A shot.jpg"  />

            </div>
    </div>
  

    
   <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>


</asp:Content>

