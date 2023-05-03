using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

public partial class customer_checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void edit_products(object sender, EventArgs e)
    {
        // You wannna verify the credit card information here
        // just fake something and maybe show a new page with your confirmation has been created this
        //this is your order, and move the basket information to Order Table and show that in that page

        //OMG you are soooo creative
    }
    protected void continue_toconfirm(object sender, EventArgs e)
    {
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string sql = "BEGIN TRANSACTION  INSERT INTO [ORDER] (order_id, customer_id, product_name, price, amount, image_url) SELECT COALESCE((SELECT MAX(order_id) FROM [ORDER]), 0) + ROW_NUMBER() OVER (ORDER BY [timestamp]), [customer_id], [product_name], [price], [amount], [image_url] FROM [Basket]WHERE [customer_id] =  @customer_id DELETE FROM [Basket] WHERE [customer_id] =  @customer_id COMMIT TRANSACTION ";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {

                    // Fill in the parameters in our prepared SQL statement
                    command.Parameters.AddWithValue("@customer_id", this.User.Identity.Name);
                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {

                    }
                    else
                    {

                    }
                }
            }
        }
        catch (Exception ex)
        {
            string errorMessage = "An error occurred: " + ex.Message;
        }

        Response.Redirect("order_confirmation.aspx");
    }
}