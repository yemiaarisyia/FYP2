using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FYP2
{
    public partial class adminhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateMenu();
            }
        }

        private void PopulateMenu()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT [menuImg], [menuPrice] AS Price, [menuName] AS Name, [menuQty] AS Quantity, [MenuID] FROM [Menu]";

            DataTable menuItemsTable = new DataTable();
            menuItemsTable.Columns.Add("ID", typeof(int));
            menuItemsTable.Columns.Add("ImageBase64", typeof(string));
            menuItemsTable.Columns.Add("Name", typeof(string));
            menuItemsTable.Columns.Add("Price", typeof(decimal));
            menuItemsTable.Columns.Add("Quantity", typeof(int));

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            byte[] imageBytes = (byte[])reader["menuImg"];
                            int id = (int)reader["MenuID"];
                            string name = reader["Name"].ToString();
                            decimal price = (decimal)reader["Price"];

                            DataRow dr = menuItemsTable.NewRow();
                            dr["ID"] = id;
                            dr["ImageBase64"] = Convert.ToBase64String(imageBytes);
                            dr["Name"] = name;
                            dr["Price"] = price;
                            int quantity = (int)reader["Quantity"];
                            dr["Quantity"] = quantity;
                            menuItemsTable.Rows.Add(dr);
                        }
                    }
                }
            }

            MenuRepeater.DataSource = menuItemsTable;
            MenuRepeater.DataBind();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int menuID = Convert.ToInt32(btn.CommandArgument);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "DELETE FROM Menu WHERE MenuID = @MenuID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MenuID", menuID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            PopulateMenu();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string menuID = btn.CommandArgument;

            Response.Redirect($"updatemenu.aspx?MenuID={menuID}");
        }

        
        protected void MenuRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Handle the command here
        }

        protected void MenuRepeater_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
