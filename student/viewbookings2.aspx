<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewbookings2.aspx.cs" Inherits="student_viewbookings2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <span class="headingspan">Select room to view current bookings:</span><br /><br />

     <!-- DropDownList that shows all rooms in the database.
         AutoPostBack="true" makes the page refresh when a new value is chosen -->
    <asp:DropDownList ID="roomDropDownList" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="room" DataValueField="room" AutoPostBack="true">
    </asp:DropDownList>
  
    <!-- SQL statement that retrieves all rooms from the database -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [room] FROM [rooms]">
    </asp:SqlDataSource>
      
    <br/><br /> 

    <!-- ListView controls display data as very customizable lists. 
        This ListView was setup in "Design View" and then manually customized in "Source View" 
    -->
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
        <!-- The AlternatingItemTemplate can be used to make every second item displayed differently.
             So item 1, 3, 5, etc. will appear as defined in the ItemTemplate, and item 2, 4, 6, etc. will 
             be displayed as defined in this AlternatingItemTemplate 
        -->
        
         <div class="lightblue">
            <br />
            Room: 
            <span class="boldtext"> 
              <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
            </span>
            is booked by:
            <span class="boldtext">
              <asp:Label ID="bookedbyLabel" runat="server" Text='<%# Eval("bookedby") %>' />
            </span>
            <br />
            On:
            <span class="boldtext">
              <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:d}") %>' />
            </span>
            at:
            <span class="boldtext">
               <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
            </span>
            <br /><br />
          </div>
        </AlternatingItemTemplate>
     
        <EmptyDataTemplate>
            No bookings found.
        </EmptyDataTemplate>
     
        <ItemTemplate>
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName")
            -->
            <br/>
            Room: 
            <span class="boldtext"> 
                <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
           </span>
           is booked by:
           <span class="boldtext">
                <asp:Label ID="bookedbyLabel" runat="server" Text='<%# Eval("bookedby") %>' />
           </span>
           <br />
            On:
            <span class="boldtext">
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:d}") %>' />
            </span>
            at:
            <span class="boldtext">
               <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
            </span>
            <br /><br />
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align:center">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
     
     </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [room], [bookedby], [date], [time] FROM [bookings] WHERE ([room] = @room)">
         <SelectParameters>
             <asp:ControlParameter ControlID="roomDropDownList" Name="room" 
                 PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>

</asp:Content>

