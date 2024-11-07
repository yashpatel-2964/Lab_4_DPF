<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Login_Demo.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body {
            background-color: #f0f4f8; /* Light grayish-blue background */
            font-family: Arial, sans-serif; /* Clean font for better readability */
        }
        .container {
            background-color: #ffffff; /* White background for the main container */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            transition: transform 0.2s; /* Smooth hover effect */
        }
        .container:hover {
            transform: translateY(-2px); /* Slight lift on hover */
        }
        h2 {
            color: #333; /* Darker color for the heading */
        }
        .welcome-label {
            color: #555; /* Medium gray for the welcome message */
            margin-top: 10px; /* Margin above the label */
        }
        .btn-logout {
            background-color: #e53e3e; /* Red background for the logout button */
            transition: background-color 0.3s; /* Smooth transition for hover */
        }
        .btn-logout:hover {
            background-color: #c53030; /* Darker red on hover */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto mt-10 p-6 max-w-md bg-white shadow-lg rounded-lg">
        <h2 class="text-2xl font-bold mb-4">Welcome to the Home Page</h2>
        
        <asp:Label ID="WelcomeLabel" runat="server" Text="" CssClass="text-lg font-medium text-gray-700"></asp:Label>
        
        <br />
        
        <asp:Button ID="LogoutButton" runat="server" Text="Logout" CssClass="mt-6 px-4 py-2 bg-red-500 text-white font-semibold rounded-md hover:bg-red-600" OnClick="LogoutButton_Click" />
    </div>
</asp:Content>
