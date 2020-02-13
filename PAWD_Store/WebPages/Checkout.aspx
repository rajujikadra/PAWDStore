<%@ Page Title="ConfirmOrder" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PAWD_Store.WebPages.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/checkout.js"></script>
    <style>
        #checkoutDiv .form-group {
            margin: 12px 0 0 0 !important;
        }
    </style>
    <div class="container">
        <div class="row" id="addressDiv">
            
        </div>
        <div class="row" id="checkoutDiv">
            <div class="col-lg-4">
                <div class="card card-primary wow fadeInUp">
                    <div class="card-header">
                        <h3 class="card-title">Billing Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group label-floating" id="BNameDiv">
                            <label for="inputName" class="control-label">Name</label>
                            <input type="text" class="form-control" id="txtName" />
                        </div>
                        <div class="form-group label-floating" id="BEmailDiv">
                            <label for="inputEmail" class="control-label">Email</label>
                            <input type="email" class="form-control" id="txtEmail" />
                            <span id="msgEmail" style="display: none; color: #f44336;">Please enter valid email</span>
                        </div>
                        <div class="form-group label-floating" id="BMobileDiv">
                            <label for="inputEmail" class="control-label">Mobile</label>
                            <input type="text" class="form-control" id="txtmobile" maxlength="10" onkeypress="return isNumberKey(event)" />
                        </div>
                        <div class="form-group label-floating" id="BAddressDiv">
                            <label for="inputSubject" class="control-label">Address</label>
                            <textarea class="form-control" rows="2" id="textAddress"></textarea>
                        </div>
                        <div class="form-group label-floating" id="BCityDiv">
                            <label for="inputSubject" class="control-label">City</label>
                            <input type="text" class="form-control" id="textCity" />
                        </div>
                        <div class="form-group label-floating" id="BStateDiv">
                            <label for="inputSubject" class="control-label">State</label>
                            <input type="text" class="form-control" id="textState" />
                        </div>
                        <div class="form-group label-floating" id="BZipcodeDiv">
                            <label for="inputSubject" class="control-label">Zipcode</label>
                            <input type="text" class="form-control" id="textZipcode" />
                        </div>
                        <div class="form-group mt-1">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="chkBilling" />
                                    Shipping address same as billing
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card card-primary wow fadeInUp">
                    <div class="card-header">
                        <h3 class="card-title">Shipping Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group label-floating" id="SNameDiv">
                            <label for="inputName" class="control-label">Name</label>
                            <input type="text" class="form-control" id="txtSname" />
                        </div>
                        <div class="form-group label-floating" id="SEmailDiv">
                            <label for="inputEmail" class="control-label">Email</label>
                            <input type="email" class="form-control" id="txtSemail" />
                            <span id="msgSEmail" style="display: none; color: #f44336;">Please enter valid email</span>
                        </div>
                        <div class="form-group label-floating" id="SMobileDiv">
                            <label for="inputEmail" class="control-label">Mobile</label>
                            <input type="email" class="form-control" id="txtSmobile" maxlength="10" onkeypress="return isNumberKey(event)" />
                        </div>
                        <div class="form-group label-floating" id="SAddressDiv">
                            <label for="inputSubject" class="control-label">Address</label>
                            <textarea class="form-control" rows="2" id="txtSaddress"></textarea>
                        </div>
                        <div class="form-group label-floating" id="SCityDiv">
                            <label for="inputSubject" class="control-label">City</label>
                            <input type="text" class="form-control" id="textScity" />
                        </div>
                        <div class="form-group label-floating" id="SStateDiv">
                            <label for="inputSubject" class="control-label">State</label>
                            <input type="text" class="form-control" id="textSstate" />
                        </div>
                        <div class="form-group label-floating" id="SZipcodeDiv">
                            <label for="inputSubject" class="control-label">Zipcode</label>
                            <input type="text" class="form-control" id="textSzipcode" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="zmdi zmdi-graduation-cap"></i>Product Details</h3>
                    </div>
                    <table class="table table-no-border table-striped" id="tblCheckout">
                        <thead>
                            <tr class="primary">
                                <th class="text-primary">Product</th>
                                <th class="text-primary">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Aquadene Ruby Red Fish Food 1 Ltr</td>
                                <td>₹ 2,000</td>
                            </tr>
                            <tr>
                                <td>Arden Grange Adult Cat Fresh</td>
                                <td>₹ 2,000</td>
                            </tr>
                            <tr>
                                <td>Arden Grange Adult</td>
                                <td>₹ 2,000</td>
                            </tr>
                            <tr class="primary">
                                <td class="text-primary">Total</td>
                                <td class="text-primary">₹ 6,000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Payment Method</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="radio radio-primary">
                                    <label>
                                        <input type="radio" name="paymentMethod" id="paymentMethodCard" value="Card" />
                                        Card
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="radio radio-primary">
                                    <label>
                                        <input type="radio" name="paymentMethod" id="paymentMethodCash" value="Cash" />
                                        Cash
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="radio radio-primary">
                                    <label>
                                        <input type="radio" name="paymentMethod" id="paymentMethodWallet" value="Wallet" />
                                        Wallet
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group" style="margin: -18px !important;">
                                    <button type="button" onclick="PlaceOrder()" class="btn btn-raised btn-primary"><i class="mr-2 fa fa-first-order"></i>Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
