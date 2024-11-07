using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_Demo
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string connectionString = "Server=KIRAN_BARAIYA;Database=Register;Trusted_Connection=True;Encrypt=False;"; // Replace with your actual connection string
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Id, UserName, Email FROM Users", conn); // Selecting Id instead of UserId
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                UsersGridView.DataSource = dt;
                UsersGridView.DataBind();
            }
        }

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UsersGridView.EditIndex = e.NewEditIndex; // Set the row to edit
            BindGridView(); // Rebind the grid
        }

        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userId = Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value); // Get the user ID from the data key
            string userName = ((TextBox)UsersGridView.Rows[e.RowIndex].FindControl("UserNameTextBox")).Text; // Get updated username
            string email = ((TextBox)UsersGridView.Rows[e.RowIndex].FindControl("EmailTextBox")).Text; // Get updated email

            string connectionString = "Server=KIRAN_BARAIYA;Database=Register;Trusted_Connection=True;Encrypt=False;"; // Replace with your actual connection string
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Users SET UserName = @UserName, Email = @Email WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Id", userId);

                cmd.ExecuteNonQuery(); // Execute the update
                UsersGridView.EditIndex = -1; // Exit edit mode
                BindGridView(); // Rebind the grid
            }
        }

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UsersGridView.EditIndex = -1; // Exit edit mode
            BindGridView(); // Rebind the grid
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value); // Get the user ID from the data key

            string connectionString = "Server=KIRAN_BARAIYA;Database=Register;Trusted_Connection=True;Encrypt=False;"; // Replace with your actual connection string
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", userId);

                cmd.ExecuteNonQuery(); // Execute the delete
                BindGridView(); // Rebind the grid
            }
        }
    }
}
