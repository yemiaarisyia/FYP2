using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FYP2
{
    public partial class updatemenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string menuID = Request.QueryString["MenuID"];
                if (!string.IsNullOrEmpty(menuID))
                {
                    PopulateMenuDetails(int.Parse(menuID));
                }
            }
        }

        private void PopulateMenuDetails(int menuID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT menuName, menuQty, menuPrice FROM Menu WHERE menuID = @MenuID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MenuID", menuID);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            TextBox1.Text = reader["menuName"].ToString();
                            TextBox2.Text = reader["menuQty"].ToString();
                            TextBox3.Text = reader["menuPrice"].ToString();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int menuID = int.Parse(Request.QueryString["MenuID"]);
            string menuName = TextBox1.Text;
            int menuQty = int.Parse(TextBox2.Text);
            decimal menuPrice = decimal.Parse(TextBox3.Text);
            byte[] menuImgBytes = null;

            if (FileUpload1.HasFile)
            {
                using (var reader = new System.IO.BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    menuImgBytes = reader.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "UPDATE Menu SET menuName = @MenuName, menuQty = @MenuQty, menuPrice = @MenuPrice" +
                           (menuImgBytes != null ? ", menuImg = @MenuImg" : "") + " WHERE menuID = @MenuID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MenuID", menuID);
                    command.Parameters.AddWithValue("@MenuName", menuName);
                    command.Parameters.AddWithValue("@MenuQty", menuQty);
                    command.Parameters.AddWithValue("@MenuPrice", menuPrice);

                    if (menuImgBytes != null)
                    {
                        command.Parameters.AddWithValue("@MenuImg", menuImgBytes);
                    }

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Redirect back to adminhome after update
            Response.Redirect("adminhome.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Redirect back to adminhome without making any changes
            Response.Redirect("adminhome.aspx");
        }
    }
}
