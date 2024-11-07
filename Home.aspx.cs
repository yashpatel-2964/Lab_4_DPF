using System;
using System.Web.UI;

namespace Login_Demo
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                WelcomeLabel.Text = $"Hello, {Session["UserName"].ToString()}!";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
