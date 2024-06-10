using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace FYP2
{
    public partial class addmenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            string menuName = TextBox1.Text;
            int menuQty = Convert.ToInt32(TextBox2.Text);
            decimal menuPrice = Convert.ToDecimal(TextBox3.Text);

            byte[] menuImg = null;
            if (FileUpload1.HasFile)
            {
                // Convert the uploaded file to a byte array
                menuImg = FileUpload1.FileBytes;
            }

            // Insert data into the database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "INSERT INTO Menu (menuName, menuQty, menuPrice, menuImg) VALUES (@menuName, @menuQty, @menuPrice, @menuImg)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@menuName", menuName);
                    command.Parameters.AddWithValue("@menuQty", menuQty);
                    command.Parameters.AddWithValue("@menuPrice", menuPrice);
                    command.Parameters.AddWithValue("@menuImg", menuImg);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Redirect the user to another page after adding the menu
            Response.Redirect("adminhome.aspx");
        }

        
    }
}
