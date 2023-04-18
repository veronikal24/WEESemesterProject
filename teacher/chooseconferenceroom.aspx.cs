using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_chooseconferenceroom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   
    }

   /* Is called when an item in the ListView is selected. In this case "selected" means
   * that a button with the the attribute CommandName="select" is clicked
   */ 
    protected void selected(object sender, EventArgs e)
    {
        /* Take the value of the selected item's primary key (in this case the croom value) and
        * store it as a session variable with the name "conference". In this way we can see
        * which room the user selected on all pages. 
        * Then redirect to the page bookconferenceroom.aspx to complete the booking.
        */ 
        string str = ListView1.SelectedDataKey.Value.ToString();
        Session["conference"] = str;
        Response.Redirect("~/teacher/bookconferenceroom.aspx");
    }
}