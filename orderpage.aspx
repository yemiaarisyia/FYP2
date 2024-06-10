<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderpage.aspx.cs" Inherits="FYP2.orderpage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="stylesheet.css" />
    <style>
        body {
            margin: 0;
            padding-top: 0;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg bg-brown">
            <h1 class="navbar-brand">DE'KUEH</h1>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.aspx">Rumah</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="orderpage.aspx">Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signin.aspx">Log Masuk</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5">
            <h2>Your Cart</h2>
            <asp:Repeater ID="CartRepeater" runat="server">
    <ItemTemplate>
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title"><%# Eval("Name") %></h5>
                <p class="card-text">Price: RM <%# Eval("Price") %></p>
                <p class="card-text">Quantity: 
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control" Width="60px"></asp:TextBox>
                </p>
                <asp:Button ID="UpdateQuantityButton" runat="server" Text="Update" CommandName="UpdateQuantity" CommandArgument='<%# Eval("MenuID") %>' CssClass="btn btn-primary" />
                <asp:Button ID="DeleteItemButton" runat="server" Text="Delete" CommandName="DeleteItem" CommandArgument='<%# Eval("MenuID") %>' CssClass="btn btn-danger" />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Button ID="AddMoreMenuButton" runat="server" Text="Add More Menu" OnClick="AddMoreMenuButton_Click" CssClass="btn btn-secondary mt-3" />
<h2 class="mt-5">Order Details</h2>
<div class="form-group">
    <label for="Name">Name</label>
    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="TelNumber">Telephone Number</label>
    <asp:TextBox ID="TelNumberTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="Address">Address</label>
    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="Time">Time</label>
    <asp:TextBox ID="time" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="Date">Date</label>
    <asp:TextBox ID="date" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<asp:Button ID="PlaceOrderButton" runat="server" Text="Place Order" OnClick="PlaceOrderButton_Click" CssClass="btn btn-success" />

        </div>
    </form>
</body>
</html>
