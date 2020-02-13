<%@ Page Title="My Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="PAWD_Store.WebPages.MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/myorder.js"></script>
    <div class="col-lg-12 ms-paper-content-container">
        <div class="ms-paper-content">
            <section class="ms-component-section">
                <!-- /example -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="zmdi zmdi-graduation-cap"></i>My Order</h3>
                    </div>
                    <table id="MyOrderTbl" class="table table-no-border table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- ms-paper-content -->
    </div>
</asp:Content>
