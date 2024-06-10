using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FYP2
{
    public partial class orderpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart == null)
            {
                cart = new List<CartItem>();
            }
            CartRepeater.DataSource = cart;
            CartRepeater.DataBind();
        }

        protected void AddMoreMenuButton_Click(object sender, EventArgs e)
        {
            // Add logic to handle adding more menu items to the cart
            // For example, redirect to another page to select more items
            Response.Redirect("home.aspx"); // Example redirection
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string insertOrderQuery = "INSERT INTO [Orders] (Name, TelNumber, Address, Time, Date, Id, CartID) OUTPUT INSERTED.OrderID VALUES (@Name, @TelNumber, @Address, @Time, @Date, @Id, @CartID)";
                using (SqlCommand orderCommand = new SqlCommand(insertOrderQuery, connection))
                {
                    orderCommand.Parameters.AddWithValue("@Name", NameTextBox.Text);
                    orderCommand.Parameters.AddWithValue("@TelNumber", TelNumberTextBox.Text);
                    orderCommand.Parameters.AddWithValue("@Address", AddressTextBox.Text);
                    orderCommand.Parameters.AddWithValue("@Time", time.Text);
                    orderCommand.Parameters.AddWithValue("@Date", date.Text);

                    int userId = (int)Session["UserID"]; // Ensure you have the user ID stored in session
                    orderCommand.Parameters.AddWithValue("@Id", userId);
                    orderCommand.Parameters.AddWithValue("@CartID", DBNull.Value); // Assuming you might want to link CartID later

                    int orderId = (int)orderCommand.ExecuteScalar();

                    // Save Cart Items
                    List<CartItem> cart = Session["Cart"] as List<CartItem>;
                    if (cart != null)
                    {
                        foreach (CartItem item in cart)
                        {
                            string insertCartQuery = "INSERT INTO [Cart] (MenuID, qty, total, Id) VALUES (@MenuID, @qty, @total, @Id)";
                            using (SqlCommand cartCommand = new SqlCommand(insertCartQuery, connection))
                            {
                                cartCommand.Parameters.AddWithValue("@MenuID", item.MenuID);
                                cartCommand.Parameters.AddWithValue("@qty", item.Quantity);
                                cartCommand.Parameters.AddWithValue("@total", item.Price * item.Quantity);
                                cartCommand.Parameters.AddWithValue("@Id", userId);
                                cartCommand.ExecuteNonQuery();
                            }
                        }
                    }

                    // Clear the cart after placing the order
                    Session["Cart"] = null;
                }
            }

            // Redirect to a confirmation or home page
            Response.Redirect("home.aspx");
        }


       
    }

    public class CartItem
    {
        public int MenuID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}
