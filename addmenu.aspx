<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addmenu.aspx.cs" Inherits="FYP2.addmenu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
            background-color: #f4f4f4; 
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

        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 50%;
            background-color: #fff; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style for textboxes */
        .form-container .input-group {
            margin-bottom: 15px;
        }

        .form-container .input-group-addon {
            min-width: 100px;
            text-align: left;
        }

        .form-container input[type="text"] {
            width: calc(100% - 120px); /* Adjust width based on the width of the addon */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
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

        <div class="center-container">
            <div class="form-container">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Nama Kuih</span>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">Kuantiti</span>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">Harga</span>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" />
            </div>
        </div>
    </form>
</body>
</html>
