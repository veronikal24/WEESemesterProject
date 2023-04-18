<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bookroom.aspx.cs" Inherits="bookroom" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="headingspan">Book a classroom:</span> <br /><br />

    <asp:Label ID="userLabel" runat="server" Width="60px" Text="User:"></asp:Label> 
   <asp:LoginName ID="userLoginName" Width="120px" runat="server" />
   <br /><br /> 
  
   <asp:Label ID="roomLabel" runat="server" Width="60px" Text="Room:"></asp:Label>
   <asp:DropDownList ID="roomDropDownList" runat="server"  Width="120px" 
       DataSourceID="SqlDataSource1" DataTextField="room" DataValueField="room">
   </asp:DropDownList> 
     
   <!-- SQL statement that retrieves all rooms from the database -->
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
       ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
       SelectCommand="SELECT [room] FROM [rooms] WHERE ([conference] = @conference)">
       <SelectParameters>
           <asp:Parameter DefaultValue="False" Name="conference" Type="Boolean" />
       </SelectParameters> 
   </asp:SqlDataSource> 
   
    <br /><br />

   <asp:Label ID="timeLabel" runat="server" Width="60px" Text="Time:"></asp:Label>
   <asp:DropDownList ID="timeDropDownList" runat="server" Width="120px" 
        DataSourceID="SqlDataSource2" DataTextField="time" DataValueField="time">
   </asp:DropDownList>

     <!-- SQL statement that retrieves all times from the database -->
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
       ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
       SelectCommand="SELECT [time] FROM [times]">
   </asp:SqlDataSource>
   <br /><br />

    <asp:Label ID="dateLabel" runat="server" Width="60px" Text="Date:"></asp:Label>
   <asp:TextBox ID="dateTextBox" runat="server" Width="114px"></asp:TextBox>
   <br /><br />

    <!-- AJAXControl that makes a calendar appear when the dateTextBox is clicked -->
    <asp:CalendarExtender TargetControlID="dateTextBox" ID="CalendarExtender1" runat="server" 
        FirstDayOfWeek="Monday" Format="dd/MM-yyyy">
    </asp:CalendarExtender>

     <!-- When this button is clicked the method "BookingButton_Click" in the code behind file is called -->
   <asp:Button ID="BookingButton" runat="server" Text="Create Booking" onclick="BookingButton_Click" />
   <br /><br />
    
   <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>


</asp:Content>

