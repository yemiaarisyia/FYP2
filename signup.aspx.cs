using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FYP2
{
    public partial class signup : System.Web.UI.Page
    {
        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Text;
            string password = passwordTextBox.Text;

            // Check if email and password are not empty
            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                // Insert data into the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "INSERT INTO [user] (email, [password]) VALUES (@email, @password)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@password", password);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Determine the role of the user
                string userType = DetermineUserType(email, password);

                // Store user type in session
                Session["UserType"] = userType;

                // Redirect the user to the appropriate page based on their role
                if (userType == "admin")
                {
                    Response.Redirect("adminhome.aspx");
                }
                else if (userType == "user")
                {
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
               
            }
        }

       
        private string DetermineUserType(string email, string password)
        {
            
            return "user";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void passwordTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
