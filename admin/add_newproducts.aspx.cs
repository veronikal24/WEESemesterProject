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


public partial class admin_add_newproducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void add_new_product(object sender, EventArgs e)
    {
        if (fileUploadControl.HasFile)
        {
            // Get the file name and extension
            string fileName = Path.GetFileName(fileUploadControl.FileName);
            string fileExtension = Path.GetExtension(fileName);

            // Check if the file is a valid image file
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                // Save the file to disk
                string filePath = Server.MapPath("~/images/product_images/" + fileName);
                fileUploadControl.SaveAs(filePath);

                // Process the uploaded file here (for example, display it on the page)
                uploadedImage.ImageUrl = "~/images/product_images/" + fileName;
                uploadedImage.Visible = true;
            
                System.Web.UI.Control control = (System.Web.UI.Control)sender;
                TextBox amount = (TextBox)control.FindControl("name");
                string name = "";
                if (amount != null)
                {
                    name = amount.Text;
                 
                }

               
                TextBox cat = (TextBox)control.FindControl("category");
                string category = "";
                if (amount != null)
                {
                    category =cat.Text;

                }
               
                TextBox desc = (TextBox)control.FindControl("description");
                string descrip = "";
                if (descrip != null)
                {
                    descrip = desc.Text;
               
                }
                amount = (TextBox)control.FindControl("price");
                float price = 0 ;
                if (amount != null)
                {
                    string amountValue = amount.Text;
                    price= float.Parse(amountValue);

                }
               

                string dbstring2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Creates a connection to our database
                SqlConnection con = new SqlConnection(dbstring2);
                string sqlStr = " INSERT INTO [dbo].[Product] ([name], [price],[category], [description], [image_url]) VALUES (@product_name, @price,@category, @desciption, @filepath)";

                // Open the database connection
                con.Open();

                // Create an executable SQL command containing our SQL statement and the database connection
                SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

                // Fill in the parameters in our prepared SQL statement
                sqlCmd.Parameters.AddWithValue("@product_name", name);
                sqlCmd.Parameters.AddWithValue("@price", price);
                sqlCmd.Parameters.AddWithValue("@category", category);
                sqlCmd.Parameters.AddWithValue("@desciption", descrip);
                sqlCmd.Parameters.AddWithValue("@filepath", uploadedImage.ImageUrl);

                // Execute the SQL command
                sqlCmd.ExecuteNonQuery();

                // Close the connection to the database
                con.Close();

            }
            else
            {
                // Display an error message if the file is not a valid image file
                errorMessageLabel.Text = "Please upload a valid image file (jpg, jpeg, or png).";
                errorMessageLabel.Visible = true;
            }
        }
    }

  

   
}