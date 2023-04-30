using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Web.UI.WebControls;

public partial class _basket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void edit_products(object sender, EventArgs e)
    {

        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        System.Web.UI.Control control2 = (System.Web.UI.Control)sender;
        Label myLabel = (Label)control2.FindControl("productLabel");
        string labelText = "";
        if (myLabel != null)
        {
            labelText = myLabel.Text;
            Console.WriteLine(labelText); // Or any other operation with the labelText variable
        }
        else
        {
            Console.WriteLine("The label control was not found.");
        }
        int newAmount = 1;
        System.Web.UI.Control control = (System.Web.UI.Control)sender;
        Label amount = (Label)control.FindControl("amountLabel");
        if (amount != null)
        {
            string amountValue = amount.Text;
            newAmount = int.Parse(amountValue);
            Console.WriteLine(amountValue);
        }
        Session["product_name"] = labelText;
           // Gets the default connection string/path to our database from the web.config file
        string dbstring2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring2);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = " Delete from [dbo].[Basket]  where customer_id =  @customer_id and product_name = @product_name and amount = @amount";

        // Open the database connection
        con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@product_name", labelText);
        sqlCmd.Parameters.AddWithValue("@customer_id", this.User.Identity.Name);
        sqlCmd.Parameters.AddWithValue("@amount", newAmount);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        // Show the user that the booking has been added
        resultLabel.Text = "Item Deleted From Basket";


    }

    protected void EditAmount_p(object sender, EventArgs e)
    {

    
      
        try
        {
            int newAmount = 1;
            System.Web.UI.Control control = (System.Web.UI.Control)sender;
            TextBox amount = (TextBox)control.FindControl("amount");
            if (amount!= null)
            {
                string amountValue = amount.Text;
                newAmount = int.Parse(amountValue);
                Console.WriteLine(amountValue);
            }



            System.Web.UI.Control control2 = (System.Web.UI.Control)sender;
            Label myLabel = (Label)control2.FindControl("productLabel");
            string labelText = "";
            if (myLabel != null)
            {
                 labelText = myLabel.Text;
                Console.WriteLine(labelText); // Or any other operation with the labelText variable
            }
            else
            {
                Console.WriteLine("The label control was not found.");
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string sql = "UPDATE [dbo].[Basket] SET [amount] = @amount WHERE  customer_id = @customer_id and product_name = @product_name";
        
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {

                   

                    // Fill in the parameters in our prepared SQL statement
                    command.Parameters.AddWithValue("@amount", newAmount);
                    command.Parameters.AddWithValue("@product_name", labelText);
                    command.Parameters.AddWithValue("@customer_id", this.User.Identity.Name);


                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        resultLabel.Text = "Amount updated successfully!";
                    }
                    else
                    {
                        resultLabel.Text = "Failed to update amount.";
                    }
                }
            }
        }
        catch (Exception ex)
        {
              string errorMessage = "An error occurred: " + ex.Message;
            
        }
      

      
    }
    /*method for retrieving the customer_id for the query */
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["@customer_id"].Value = Context.User.Identity.Name;
    }

    protected void continue_topay(object sender, EventArgs e)
    {

        Response.Redirect("checkout.aspx");


    }
 
}