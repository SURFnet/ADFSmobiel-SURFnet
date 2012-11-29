<%@ Page Language="C#" MasterPageFile="~/MasterPages/MobileMasterPage.master" AutoEventWireup="true"  ValidateRequest="false"
    CodeFile="FormsSignIn.aspx.cs" Inherits="FormsSignIn" Title="<%$ Resources:CommonResources, FormsSignInPageTitle%>"
    EnableViewState="false" runat="server"%>
<%@ OutputCache Location="None" %>

<asp:Content ID="FormsSignInContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- LOGIN VELD MET BIJBEHOREN -->
<div class="item">
  <h1><asp:Label ID="WelcomeHeader" runat="server" Text="<%$ Resources:MobileResources, WelcomeHeader %>"></asp:Label></h1>
  <p class="info"><asp:Label ID="WelcomeText" runat="server" Text="<%$ Resources:MobileResources, WelcomeText %>"></asp:Label></p>
  <asp:Label ID="ErrorTextLabel" runat="server" Text="" Visible="False"></asp:Label>
  <form id="login" method="POST" action="?" name="f">
  <label for="username"><asp:Label Text="<%$ Resources:CommonResources, UsernameLabel%>" runat="server" /></label> <!-- <span class="example">(bv. 123456@catherijne.nl)</span> -->
  <asp:TextBox runat="server" ID="UsernameTextBox" ></asp:TextBox>
  <label for="password"><asp:Label Text="<%$ Resources:CommonResources, PasswordLabel%>" runat="server" /></label>
  <asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password" ></asp:TextBox>
  <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:CommonResources, FormsSignInButtonText%>" OnClick="SubmitButton_Click" CssClass="Resizable"/>
  </form>
</div>
<!-- EINDE LOGIN VELD MET BIJBEHOREN -->
</asp:Content>
