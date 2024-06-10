<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="FYP2.adminhome" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DE'KUEH</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="stylesheet.css" />
    <style>
        body {
            margin: 0;
            padding-top: 0;
        }

        .navbar-brand {
            font-size: 30px;
            font-weight: bold;
            color: antiquewhite;
            margin-left: 20px;
        }

        .navbar-nav .nav-link {
            font-size: 14px;
            color: white;
        }

        .bg-brown {
            background-color: navy;
        }

        /* Centering the menu */
        .menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Ensures the menu is centered vertically */
        }

        @media screen and (max-width:768px) {
            .menu-item {
                padding: 5px;
                width: calc(100% - 20px);
                margin: 0 auto;
            }
        }

        @media screen and (min-width:768px) {
            .menu-item {
                padding: 5px;
                width: calc(33.33% - 30px);
                margin: 0 10px;
            }
        }

        .auto-style1 {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        .card-img-top {
            max-height: 150px;
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
                        <a class="nav-link" href="adminhome.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addmenu.aspx">Add Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="vieworder.aspx">View Order</a>
                    </li>
                </ul>
            </div>
        </nav>
       
        <div class="menu-container">
            <div class="row">
                <asp:Repeater ID="MenuRepeater" runat="server" OnItemCommand="MenuRepeater_ItemCommand1">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-12 mb-3 menu-item" style="margin-top: 60px;">
                            <div class="card" style="height: 350px; width:280px;">
                                <img class="card-img-top" src='<%# "data:image/jpeg;base64," + Eval("ImageBase64") %>' alt='<%# Eval("Name") %>' style="height: 200px; object-fit: cover;" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <p class="card-text mx-10">Harga: RM <%# Eval("Price") %> | Quantity: <%# Eval("Quantity") %></p>
                                    <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-block" CommandArgument='<%# Eval("ID") %>' OnClick="DeleteButton_Click" />
                                    <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="btn btn-primary btn-block" CommandArgument='<%# Eval("ID") %>' OnClick="UpdateButton_Click" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </form>
</body>
</html>
