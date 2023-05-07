using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;


using System.Diagnostics;
using System.IO;


public partial class _product: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        // Rebind the ListView with the new search term
        Products.DataBind();
    }

    protected void selected_product_addtobasket(object sender, EventArgs e)
    {

        string product_id = Products.SelectedDataKey.Value.ToString();
        Session["product_id"] = product_id;
        string userName = User.Identity.Name;
        if (!string.IsNullOrEmpty(userName))
        {
           
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
        /* use this to put it into a basket
        */
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "SELECT name,price, image_url FROM Product WHERE id = @id";
        string image_url = "";
        float price = 0;
        string product_name = "";
        using (SqlConnection connection = new SqlConnection(dbstring))
        {
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@id", product_id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string column1Value = reader["price"].ToString(); ;
                image_url = reader["image_url"].ToString();
                product_name = reader["name"].ToString();
                price = float.Parse(column1Value);

            }
        }

        // Gets the default connection string/path to our database from the web.config file
        string dbstring2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring2);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = "INSERT INTO [dbo].[Basket] ([customer_id], [product_id],[product_name], [amount], [price], [image_url]) VALUES (@customer_id,@product_id, @product_name, @amount, @price, @image_url)";

        // Open the database connection
        con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@product_id", product_id);
        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@product_name", product_name);
        sqlCmd.Parameters.AddWithValue("@customer_id", this.User.Identity.Name);
        sqlCmd.Parameters.AddWithValue("@amount", 1);
        sqlCmd.Parameters.AddWithValue("@price", price);
        sqlCmd.Parameters.AddWithValue("@image_url", image_url);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        resultLabel.Text = "Item Added to the Basket";

   
    
    
    }
    protected void edit_name(object sender, EventArgs e)
    {
        try
        {
            string newAmount = "";
            System.Web.UI.Control control = (System.Web.UI.Control)sender;
            TextBox amount = (TextBox)control.FindControl("name");
            if (amount != null)
            {
                string amountValue = amount.Text;
                newAmount = amountValue;
                Console.WriteLine(amountValue);
            }
            System.Web.UI.Control control2 = (System.Web.UI.Control)sender;
            Label myLabel = (Label)control2.FindControl("ProductLabel");
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
            string sql = "UPDATE [dbo].[Product] SET [name] = @name WHERE name = @product_name";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {

                    // Fill in the parameters in our prepared SQL statement
                    command.Parameters.AddWithValue("@name", newAmount);
                    command.Parameters.AddWithValue("@product_name", labelText);
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
    protected void edit_description(object sender, EventArgs e)
    {
        try
        {
            string newAmount = "";
            System.Web.UI.Control control = (System.Web.UI.Control)sender;
            TextBox amount = (TextBox)control.FindControl("desc");
            if (amount != null)
            {
                string amountValue = amount.Text;
                newAmount = amountValue;
                Console.WriteLine(amountValue);
            }
            System.Web.UI.Control control2 = (System.Web.UI.Control)sender;
            Label myLabel = (Label)control2.FindControl("description");
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
            string sql = "UPDATE [dbo].[Product] SET [description] = @name WHERE description = @product_name";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {

                    // Fill in the parameters in our prepared SQL statement
                    command.Parameters.AddWithValue("@name", newAmount);
                    command.Parameters.AddWithValue("@product_name", labelText);
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
    protected void edit_price(object sender, EventArgs e)
    {
        try
        {
            float newAmount = 0;
            System.Web.UI.Control control = (System.Web.UI.Control)sender;
            TextBox amount = (TextBox)control.FindControl("price");
            if (amount != null)
            {
                string amountValue = amount.Text;
                newAmount = float.Parse(amountValue);
                Console.WriteLine(amountValue);
            }
            System.Web.UI.Control control2 = (System.Web.UI.Control)sender;
            Label myLabel = (Label)control2.FindControl("ProductLabel");
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
            string sql = "UPDATE [dbo].[Product] SET [price] = @name WHERE name = @product_name";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {

                    // Fill in the parameters in our prepared SQL statement
                    command.Parameters.AddWithValue("@name", newAmount);
                    command.Parameters.AddWithValue("@product_name", labelText);
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
    protected void selected_product_delete(object sender, EventArgs e)
    {

        string product_name = Products.SelectedDataKey.Value.ToString();
        Session["product_name"] = product_name;
        string userName = User.Identity.Name;
        if (!string.IsNullOrEmpty(userName))
        {

        }
        else
        {
            // The user is not authenticated.
        }
        /* use this to put it into a basket
        */
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "DELETE FROM Product WHERE id = @name";
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
                string column1Value = reader["price"].ToString(); ;
                image_url = reader["image_url"].ToString();
                price = float.Parse(column1Value);

            }
        }



        // Show the user that the booking has been added
        resultLabel.Text = "Deleted Item";



    }

   
 
}