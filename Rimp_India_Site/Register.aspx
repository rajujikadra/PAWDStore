<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Rimp_India_Site.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="ms-hero-page-override ms-hero-img-airplane ms-bg-fixed ms-hero-bg-dark-light">
        <div class="container">
            <div class="text-center">
                <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Register</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card card-primary card-hero animated fadeInUp animation-delay-7">
            <div class="card-body">
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <fieldset>
                    <div class="row form-group">
                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                CssClass="text-danger" ErrorMessage="The name field is required." />
                        </div>
                    </div>
                    <div class="row form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="row form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="row form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        </div>
                    </div>
                     <asp:Label runat="server" id="EmailAlreadyMessage" CssClass="text-danger"></asp:Label>
                    <div class="row mt-2">
                        <div class="col-lg-3">
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-raised btn-primary btn-block" />
                        </div>
                    </div>
                    <p>
                        <asp:HyperLink NavigateUrl="~/Login" runat="server" ID="RegisterHyperLink">Login</asp:HyperLink>
                    </p>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
