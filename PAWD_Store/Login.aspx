<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PAWD_Store.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ms-hero-page-override ms-hero-img-city ms-hero-bg-dark-light">
    </div>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-lg-6">
                <div class="card card-hero card-primary animated fadeInUp animation-delay-7">
                    <div class="card-body">
                        <h1 class="color-primary text-center">Login</h1>
                            <section id="loginForm">
                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="FailureText" />
                                    </p>
                                </asp:PlaceHolder>
                                <fieldset>
                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-3 control-label">Email</asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                CssClass="text-danger" ErrorMessage="The email field is required." />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 control-label">Password</asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                        </div>
                                    </div>
                                </fieldset>
                                <asp:Label runat="server" id="LoginMessage" CssClass="text-danger"></asp:Label>
                                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-raised btn-primary btn-block" />
                                <p>
                                    <asp:HyperLink NavigateUrl="~/register" runat="server" ID="RegisterHyperLink">Register as a new user</asp:HyperLink>
                                </p>
                            </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
