<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="FYP2.home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="stylesheet.css" />
    <style>
        body {
            margin: 0;
            padding-top: 0;
            font-family: Arial, sans-serif; 
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

        /* Define column widths for different screen sizes */
        @media screen and (max-width:768px) {
            .menu-item {
                padding: 5px; /* Adjust padding for smaller items */
                width: calc(100% - 20px); /* Set width for smaller screens */
                margin: 0 auto; /* Center align the columns */
            }
        }

        @media screen and (min-width:768px) {
            .menu-item {
                padding: 5px;
                width: calc(33.33% - 30px); /* Set width for larger screens */
                margin: 0 10px; /* Add some margin between columns */
            }
        }

        .auto-style1 {
            max-width: 1000px; /* Ensure the image scales down to fit the width of its container */
            height: 500px; /* Allow the image to maintain its aspect ratio */
            display: block; /* Ensure the image behaves as a block element */
            margin:50px auto; /* Center the image horizontally */
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
        <p>
            <img class="auto-style1" alt="Kuih" src="Aneka%20Kuih%20Tradisional%20disajikan%20disini.jpg" />
        </p>
        
        <div class="menu-container">
            <div class="row">
                <asp:Repeater ID="MenuRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-3 menu-item">
                            <div class="card" style="height: 350px; width:280px;">
                                <img class="card-img-top" src='<%# "data:image/jpeg;base64," + Eval("ImageBase64") %>' alt='<%# Eval("Name") %>' style="height: 200px; object-fit: cover;" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <p class="card-text mx-10" style="margin-bottom: 0;">Harga: RM <%# Eval("Price") %></p>
                                    <asp:Button ID="OrderButton" runat="server" Text="Order" CssClass="btn btn-primary btn-block" CommandArgument='<%# Eval("Name") %>' OnClick="OrderButton_Click" />
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