using System;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        static string conStr = "Data Source=HP\\SQLEXPRESS;Initial Catalog=UserLoginDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(conStr))
                {
                    connection.Open();

                    string query = "SELECT COUNT(*) FROM Usedif WHERE UserName = @UserName AND UserPassword = @UserPassword";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@UserName", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@UserPassword", TextBox2.Text);

                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            // Redirect to the Home.aspx page upon successful login
                            Response.Redirect("~/Secure/Home.aspx");
                        }
                        else
                        {
                            Label1.Text = "Invalid UserName or Password!";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewAccount.aspx");
        }
    }
}
