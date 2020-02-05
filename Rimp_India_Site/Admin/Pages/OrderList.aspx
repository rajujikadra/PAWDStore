<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Rimp_India_Site.Admin.Pages.OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <style>
        .table td, .table th {
            vertical-align: middle !important;
        }
    </style>
    <script src="../Admin/Scripts/order_list.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Orders</strong>
                </div>
                <input type="hidden" id="hdnMenuID" />
                <div class="card-body">
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Order List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="example" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>#Order No</th>
                                                        <th>Email</th>
                                                        <th>Staus</th>
                                                        <th>Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title" id="CartTitles">Order Details</strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="card">
                                        <%--<div class="card-header">
                                            <strong class="card-title">Order Details</strong>
                                        </div>--%>
                                        <div class="card-header row">
                                            <strong class="card-title col-md-2 text-right">Order Number :</strong>
                                            <strong class="card-title col-md-2 text-left" id="Order_No">N/A</strong>
                                            <strong class="card-title col-md-2 text-right">Order Date :</strong>
                                            <strong class="card-title col-md-2 text-left" id="Order_date">N/A</strong>
                                            <strong class="card-title col-md-3 text-right">Paymnet Method :</strong>
                                            <strong class="card-title col-md-1 text-left" id="Order_Method">N/A</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Billing Details</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="text-dark" style="font-style: oblique;" for="exampleInputEmail1">Name : </label>
                                                <span style="margin-left: 45px;" id="B_name">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email : </label>
                                                <span style="margin-left: 49px;" id="B_email">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Mobile : </label>
                                                <span style="margin-left: 39px;" id="B_mobile">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Address : </label>
                                                <span style="margin-left: 34px;" id="B_address">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">City : </label>
                                                <span style="margin-left: 62px;" id="B_city">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">State : </label>
                                                <span style="margin-left: 53px;" id="B_state">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Zipcode : </label>
                                                <span style="margin-left: 31px;" id="B_zipcode">N/A</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Shipping Details</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="text-dark" style="font-style: oblique;" for="exampleInputEmail1">Name : </label>
                                                <span style="margin-left: 45px;" id="S_name">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email : </label>
                                                <span style="margin-left: 49px;" id="S_email">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Mobile : </label>
                                                <span style="margin-left: 39px;" id="S_mobile">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Address : </label>
                                                <span style="margin-left: 34px;" id="S_address">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">City : </label>
                                                <span style="margin-left: 62px;" id="S_city">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">State : </label>
                                                <span style="margin-left: 53px;" id="S_state">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Zipcode : </label>
                                                <span style="margin-left: 31px;" id="S_zipcode">N/A</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title" id="table_Heading">Product Details</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="ProductImage" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Image</th>
                                                        <th>Title</th>
                                                        <th>Quantity</th>
                                                        <th>Total Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4">No product available
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="btnChangeOrderStatus" style="display: none;">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
