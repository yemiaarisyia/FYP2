<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="FYP2.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
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
            color: red;
            font-size: 14px;
            display: block;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<h1 style="text-align:center; margin-top:50px;">DE'KUEH</h1>
<div class="container">
    <h2>Sign In</h2>
    <form id="form1" runat="server">
        <asp:TextBox ID="emailTextBox" runat="server" CssClass="input-field" placeholder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailRequiredValidator" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email is required." Display="Dynamic" CssClass="validation-message" />
        <asp:RegularExpressionValidator ID="emailFormatValidator" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" CssClass="validation-message" />

        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="passwordRequiredValidator" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Password is required." Display="Dynamic" CssClass="validation-message" />

        <asp:Label ID="errorMessageLabel" runat="server" Text="" CssClass="validation-message"></asp:Label>

        <asp:Button ID="SignInButton" runat="server" Text="Sign In" OnClick="SignInButton_Click" CssClass="submit-button" />
        <p>Tiada akaun? Daftar akaun anda disini <a href="signup.aspx">Sign Up
            </a></p>
    </form>
</div>

</body>
</html>
