using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FYP2
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            if (ValidateUser(emailTextBox.Text, passwordTextBox.Text, out int userID, out bool isAdmin))
            {
                Session["UserID"] = userID;
                Session["IsAdmin"] = isAdmin;

                if (isAdmin)
                {
                    Response.Redirect("adminhome.aspx");
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                errorMessageLabel.Text = "Invalid email or password.";
            }
        }

        private bool ValidateUser(string userEmail, string userPassword, out int userID, out bool isAdmin)
        {
            bool isValidUser = false;
            userID = -1;
            isAdmin = false;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Check in Admin table
                string adminQuery = "SELECT AdminId FROM [Admin] WHERE email = @Email AND password = @Password";
                using (SqlCommand cmd = new SqlCommand(adminQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", userEmail);
                    cmd.Parameters.AddWithValue("@Password", userPassword);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userID = Convert.ToInt32(reader["AdminId"]);
                            isAdmin = true;
                            isValidUser = true;
                            return isValidUser;
                        }
                    }
                }

                // Check in User table
                string userQuery = "SELECT Id FROM [user] WHERE email = @Email AND password = @Password";
                using (SqlCommand cmd = new SqlCommand(userQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", userEmail);
                    cmd.Parameters.AddWithValue("@Password", userPassword);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userID = Convert.ToInt32(reader["Id"]);
                            isAdmin = false;
                            isValidUser = true;
                        }
                    }
                }
            }

            return isValidUser;
        }
    }
}
