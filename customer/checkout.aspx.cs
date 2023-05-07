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
   
    protected void continue_toconfirm(object sender, EventArgs e)
    {
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string sql = "DECLARE @max_order_id INT;SELECT @max_order_id = COALESCE(MAX(order_id), 0) FROM [ORDER];SET @max_order_id = @max_order_id + 1; BEGIN TRANSACTION; INSERT INTO [ORDER] (order_id, customer_id, product_name, price, amount, image_url) SELECT @max_order_id, [customer_id], [product_id], [price], [amount], [image_url] FROM [Basket] WHERE [customer_id] = @customer_id; DELETE FROM [Basket] WHERE [customer_id] = @customer_id;COMMIT TRANSACTION;";
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