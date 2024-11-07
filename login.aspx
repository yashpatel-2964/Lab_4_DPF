<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_Demo.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-lg mx-auto mt-12 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-6 text-center">Login</h2>

        <div class="mb-6">
            <asp:Label Text="Email" runat="server" CssClass="block text-lg font-medium text-gray-700 mb-2"></asp:Label>
            <asp:TextBox ID="Email" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email" 
                ErrorMessage="Email is required." CssClass="text-red-500 text-sm" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="Email" 
                ErrorMessage="Invalid email format." ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                CssClass="text-red-500 text-sm" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        
        <div class="mb-6">
            <asp:Label Text="Password" runat="server" CssClass="block text-lg font-medium text-gray-700 mb-2"></asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="Password" 
                ErrorMessage="Password is required." CssClass="text-red-500 text-sm" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="w-full bg-blue-500 text-white py-3 rounded-lg hover:bg-blue-600 transition duration-200" OnClick="Button1_Click" />
        
        <div class="mt-6 text-center">
            <a href="/register.aspx" class="text-blue-500 hover:text-blue-700 hover:underline transition duration-200">Don't have an account yet? Sign up</a>
        </div>
    </div>
</asp:Content>
