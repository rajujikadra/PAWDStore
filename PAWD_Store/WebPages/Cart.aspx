<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="PAWD_Store.WebPages.Cart" %>

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
            <div class="col-md-3" id="PriceDiv">
                <div class="card card-primary">
                    <div class="card-header">
                        <i class="fa fa-list-alt" aria-hidden="true"></i>Summary
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li id="txtSubTotal">
                                <strong>Sub Total: </strong>₹ 0</li>
                            <li id="txtTax">
                                <strong>Tax: </strong>₹ 02</li>
                            <li id="txtShippingCosts">
                                <strong>Shipping costs: </strong>
                                <span class="color-warning">₹ 0</span>
                            </li>
                        </ul>
                        <h3 id="txtTotal">
                            <strong>Total:</strong>
                            <span class="color-primary">₹ 0</span>
                        </h3>
                        <a href="<%: GetRouteUrl("confirm", null) %>" class="btn btn-raised btn-primary btn-block btn-raised mt-2 no-mb">
                            <i class="zmdi zmdi-shopping-cart-plus"></i>Checkout</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group" id="BtnShoppingDiv">
            <div class="col-lg-10">
                <a href="/home" class="btn btn-raised btn-primary">Continue Shopping</a>
            </div>
        </div>
    </div>
</asp:Content>
