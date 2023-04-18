using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Gives access to the static "Roles" class 
using System.Web.Security;
   
public partial class createuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Only do the following when the page is actually loaded, not when we click on buttons, etc
        if (!IsPostBack) 
        {
            // I create a DropDownList object representing the DropDownList in my page.
            // Since I converted the CreateUserWizard to a template the DropDownList is hidden inside the ContentTemplateContainer tag
            DropDownList theRoles = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleList");

            // I set the data source of the DropDownList to a list of all defined roles in the database, by
            // using the static Roles class
            theRoles.DataSource = Roles.GetAllRoles();

            // Bind the DropDownList object and its datasource to the actual DropDownList in my page
            theRoles.DataBind();

            // Run through the list of roles. If a "Student" role exist, then make that the start value in the DropDownList. 
            // If someone forgets to change the role it's better to create too many students than admins.
            for (int i = 0; i < theRoles.Items.Count; i++)
            {
                if ((theRoles.Items[i].Value).Equals("Student"))
                {
                    theRoles.SelectedIndex = i;
                }
            }

        }
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        // Set the role of the created user to the selected role in the DropDownList
        Roles.AddUserToRole(CreateUserWizard1.UserName, ((DropDownList)(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleList"))).SelectedValue);
  
        /* If newly created users should always belong to the same role (e.g. on a site where 
         * users can register themselves, they would probably all belong to "userRole"), we don't
         * need a DropDownList, and the role could simply be hardcoded like this:
         * Roles.AddUserToRole(CreateUserWizard1.UserName, "userRole");
         */

    }
    
}