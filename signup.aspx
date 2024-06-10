<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="FYP2.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="stylesheet.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .validation-message {
            color: red; /* Set text color to red for error messages */
            font-size: 14px; /* Adjust font size */
            display: block; /* Ensure error message is displayed as a block element */
        }

        /* Additional styles for form container */
        .container {
            max-width: 400px; /* Adjust container width as needed */
            margin: 0 auto; /* Center the container horizontally */
            background-color: #fff; /* Set background color to white */
            padding: 20px; /* Add some padding around the form */
            border-radius: 5px; /* Add rounded corners to the container */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow for a subtle effect */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="text-align:center; margin-top:50px">DE'KUEH</h1>
        <div class="container">
            <h2>Sign Up</h2>
            <asp:TextBox ID="emailTextBox" runat="server" CssClass="input-field" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailRequiredValidator" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email is required." Display="Dynamic" CssClass="validation-message" />
            <asp:RegularExpressionValidator ID="emailFormatValidator" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" CssClass="validation-message" />

            <asp:TextBox ID="passwordTextBox" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password" OnTextChanged="passwordTextBox_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordRequiredValidator" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Password is required." Display="Dynamic" CssClass="validation-message" />

            <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" OnClick="SignUpButton_Click" CssClass="submit-button" />
            <a class="back-button" href="signin.aspx">Kembali</a>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>

            
        </div>
    </form>
</body>
</html>
