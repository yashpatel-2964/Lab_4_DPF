<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Login_Demo.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-2xl font-bold mb-4">Manage Users</h1>

    <asp:GridView ID="UsersGridView" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200" 
    OnRowEditing="UsersGridView_RowEditing" 
    OnRowUpdating="UsersGridView_RowUpdating" 
    OnRowCancelingEdit="UsersGridView_RowCancelingEdit" 
    OnRowDeleting="UsersGridView_RowDeleting" 
    DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
        <asp:TemplateField HeaderText="User Name">
            <ItemTemplate>
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

</asp:Content>
