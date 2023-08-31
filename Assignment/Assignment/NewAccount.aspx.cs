using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your Page_Load logic here
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string serverName = "HP\\SQLEXPRESS";
            string databaseName = "UserLoginDB";
            string connectionString = $"Data Source={serverName};Initial Catalog={databaseName};Integrated Security=True";

            // Extract user input
            string userName = TextBox8.Text; // Username field
            string userPassword = TextBox6.Text; // Password field

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Check if the username already exists
                    string checkQuery = "SELECT COUNT(*) FROM Usedif WHERE UserName = @UserName";
                    SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                    checkCommand.Parameters.AddWithValue("@UserName", userName);

                    int userCount = (int)checkCommand.ExecuteScalar();

                    if (userCount > 0)
                    {
                        // Username already exists, show error or handle as needed
                        // Display a message to the user
                        Label1.Text = "Username already exists. Please choose a different username.";
                    }
                    else
                    {
                        // Username doesn't exist, insert the user's information
                        string insertQuery = "INSERT INTO Usedif (UserName, UserPassword) VALUES (@UserName, @UserPassword)";
                        SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                        insertCommand.Parameters.AddWithValue("@UserName", userName);
                        insertCommand.Parameters.AddWithValue("@UserPassword", userPassword);

                        insertCommand.ExecuteNonQuery();

                        // Redirect to a success page or show a success message
                        
                        Response.Redirect("~/Secure/Home.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                // Display an error message to the user
                Label1.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string username = TextBox8.Text.Trim();

            // Perform your database check here
            bool usernameExists = CheckIfUsernameExists(username);

            args.IsValid = !usernameExists;
        }

        private bool CheckIfUsernameExists(string username)
        {
            string serverName = "HP\\SQLEXPRESS";
            string databaseName = "UserLoginDB";
            string connectionString = $"Data Source={serverName};Initial Catalog={databaseName};Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string checkQuery = "SELECT COUNT(*) FROM Usedif WHERE UserName = @UserName";
                SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                checkCommand.Parameters.AddWithValue("@UserName", username);

                int userCount = (int)checkCommand.ExecuteScalar();

                return userCount > 0;
            }
        }
    }
}