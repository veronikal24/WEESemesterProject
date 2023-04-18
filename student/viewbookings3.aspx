<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewbookings3.aspx.cs" Inherits="student_viewbookings3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="headingspan">Select room and date to view current bookings:</span>
   
    <div class="floatright"> 

       <!-- DropDownList that shows all rooms in the database.
         When a new value is chosen I call the method DropDownBox1_Changed in the codebehind file  
       -->
       <asp:DropDownList ID="roomDropDownList" runat="server" AutoPostBack="true" 
           DataTextField="room" DataValueField="room" OnSelectedIndexChanged="DropDownBox1_Changed">
       </asp:DropDownList>  
 
       <!-- SQL statement that retrieves all rooms from the database -->
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [room] FROM [rooms]">
       </asp:SqlDataSource>
  
       <br /><br />

       <!-- Calendar used to select the week that bookings are shown for  -->
       <asp:Calendar ID="WeekCalendar" runat="server" OnSelectionChanged="WeekCalendar_SelectionChanged" NextMonthText="&gt;" NextPrevStyle-ForeColor="#FFFFFF" PrevMonthText="&lt;" SelectedDayStyle-BackColor="#003399" TitleStyle-BackColor="#003399" TitleStyle-ForeColor="#FFFFFF" BorderColor="#003399" ForeColor="#003399" CssClass="weekCalendar" OtherMonthDayStyle-ForeColor="#6699ff" CellPadding="1" DayNameFormat="Shortest"></asp:Calendar>
    </div>

    <br /><br />
       
    <!-- The appearance of this GridView was customized in "Design View", but no other 
         setup was made. Instead I will retrieve the necessary data in the code behind file,
         since that lets me format and display the data exactly as I want
    -->
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF"/>
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>

</asp:Content>

