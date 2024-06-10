using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP2
{
    public partial class home : System.Web.UI.Page
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
            menuItemsTable.Columns.Add("ImageBase64", typeof(string));
            menuItemsTable.Columns.Add("Name", typeof(string));
            menuItemsTable.Columns.Add("Price", typeof(decimal));
            menuItemsTable.Columns.Add("Quantity", typeof(int));
            menuItemsTable.Columns.Add("MenuID", typeof(int));

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
                            string name = reader["Name"].ToString();
                            decimal price = (decimal)reader["Price"];
                            int quantity = (int)reader["Quantity"];
                            int menuID = (int)reader["MenuID"];

                            DataRow dr = menuItemsTable.NewRow();
                            dr["ImageBase64"] = Convert.ToBase64String(imageBytes);
                            dr["Name"] = name;
                            dr["Price"] = price;
                            dr["Quantity"] = quantity;
                            dr["MenuID"] = menuID;
                            menuItemsTable.Rows.Add(dr);
                        }
                    }
                }
            }

            MenuRepeater.DataSource = menuItemsTable;
            MenuRepeater.DataBind();
        }

        protected void OrderButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string menuName = btn.CommandArgument;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT [MenuID], [menuPrice], [menuName] FROM [Menu] WHERE [menuName] = @menuName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@menuName", menuName);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int menuID = (int)reader["MenuID"];
                            decimal price = (decimal)reader["menuPrice"];
                            string name = reader["menuName"].ToString();

                            // Add to cart
                            List<CartItem> cart = Session["Cart"] as List<CartItem>;
                            if (cart == null)
                            {
                                cart = new List<CartItem>();
                            }

                            CartItem existingItem = cart.Find(item => item.MenuID == menuID);
                            if (existingItem != null)
                            {
                                existingItem.Quantity++;
                            }
                            else
                            {
                                cart.Add(new CartItem { MenuID = menuID, Name = name, Price = price, Quantity = 1 });
                            }

                            Session["Cart"] = cart;

                            // Debugging output
                            System.Diagnostics.Debug.WriteLine("Cart updated with item: " + name);
                            foreach (var item in cart)
                            {
                                System.Diagnostics.Debug.WriteLine("CartItem: " + item.Name + " Quantity: " + item.Quantity);
                            }
                        }
                    }
                }
            }

            // Redirect to the order page
            Response.Redirect("orderpage.aspx");
        }




        public class CartItem
        {
            public int MenuID { get; set; }
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }

    }
}
