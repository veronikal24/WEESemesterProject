using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class _product: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void selected_product(object sender, EventArgs e)
    {
        /* Take the value of the selected item's primary key (in this case the croom value) and
        * store it as a session variable with the name "conference". In this way we can see
        * which room the user selected on all pages. 
        * Then redirect to the page bookconferenceroom.aspx to complete the booking.
        */
        string product_name = Products.SelectedDataKey.Value.ToString();
        Session["product_name"] = product_name;
        string userName = User.Identity.Name;
        if (!string.IsNullOrEmpty(userName))
        {
            // The user is authenticated, and their name is stored in the userName variable.
            // You can use this name to display a personalized message, for example.
        }
        else
        {
            // The user is not authenticated.
        }
        /* use this to put it into a basket
        */
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "DELETE FROM Product WHERE name = @name";
        string image_url = "";
        float price = 0;
        using (SqlConnection connection = new SqlConnection(dbstring))
        {
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", product_name);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string column1Value = reader["price"].ToString();;
                image_url= reader["image_url"].ToString();
                price = float.Parse(column1Value);
            
            }
        }
  
       

        // Show the user that the booking has been added
        resultLabel.Text = "Deleted Item";

        
        Response.Redirect("products.aspx");
    
    
    }
 
}