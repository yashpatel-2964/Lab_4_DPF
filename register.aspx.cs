using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Login_Demo
{
    public partial class Register : Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string userName = UserName.Text;
            string email = Email.Text; // This will still collect the email, but no validation will be performed
            string password = Password.Text;

            // Replace with your actual connection string
            string connectionString = "Server=KIRAN_BARAIYA;Database=Register;Trusted_Connection=True;Encrypt=False;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Users (UserName, Email, Password) VALUES (@UserName, @Email, @Password)", conn);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Email", email); // Email will still be inserted into the database
                    cmd.Parameters.AddWithValue("@Password", password);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        // Handle registration failure (e.g., display a message)
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception message
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}
