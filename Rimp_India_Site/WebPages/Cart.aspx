﻿<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Rimp_India_Site.WebPages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/cart.js"></script>
    <style>
        .ImageClass {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
            width: 150px;
        }
    </style>
    <div class="container">
        <h1 class="right-line mb-4">Cart</h1>
        <div class="row">
            <div class="col-md-9" id="CartDiv">
                <%-- cart items --%>
            </div>
            <div class="col-md-3">
                <div class="card card-primary">
                    <div class="card-header">
                        <i class="fa fa-list-alt" aria-hidden="true"></i>Summary
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li>
                                <strong>Price: </strong>₹ 1984.26</li>
                            <li>
                                <strong>Tax: </strong>₹ 47.22</li>
                            <li>
                                <strong>Shipping costs: </strong>
                                <span class="color-warning">₹ 5.25</span>
                            </li>
                        </ul>
                        <h3>
                            <strong>Total:</strong>
                            <span class="color-primary">₹ 2456.45</span>
                        </h3>
                        <a href="javascript:void(0)" class="btn btn-raised btn-primary btn-block btn-raised mt-2 no-mb">
                            <i class="zmdi zmdi-shopping-cart-plus"></i>Purchase</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
