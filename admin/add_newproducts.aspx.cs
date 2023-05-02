using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Web.Mvc;

using System.IO;


public partial class admin_add_newproducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // Assuming the HTML code is inside a form element and submitted via HTTP POST
    public ActionResult UploadFile(HttpPostedFileBase file)
    {
        if (file != null && file.ContentLength > 0)
        {
            var fileName = Path.GetFileName(file.FileName);
            var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
            file.SaveAs(path);
            // 'path' variable will contain the file path on the server where the uploaded file is saved.
        }
        return RedirectToAction("Index");
    }

   
}