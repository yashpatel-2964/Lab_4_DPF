using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Login_Demo
{
    public partial class Login : Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            string password = Password.Text;

            // Replace with your connection string
            string connectionString = "Server=KIRAN_BARAIYA;Database=Register;Trusted_Connection=True;Encrypt=False;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT UserName FROM Users WHERE Email = @Email AND Password = @Password", conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                var userName = cmd.ExecuteScalar();
                if (userName != null)
                {
                    Session["UserName"] = userName.ToString();
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    // Handle login failure (e.g., display a message)
                }
            }
        }
    }
}
