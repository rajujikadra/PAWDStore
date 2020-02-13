<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="PAWD_Store.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-8 col-md-offset-2">
            <div class="card animated fadeInUp animation-delay-7 color-primary withripple">
                <div class="card-body-big color-dark">
                    <div class="text-center">
                        <h1 class="color-primary">Error 404</h1>
                        <h2>Page Not Found</h2>
                        <p class="lead lead-sm">
                            We have not found what you are looking for.
                    <br>
                            We have put our robots to search.
                        </p>
                        <a href="<%: GetRouteUrl("home", null) %>" class="btn btn-primary btn-raised">
                            <i class="zmdi zmdi-home"></i>Go Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
