﻿<%@ Page Title="Third category" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThirdCategory.aspx.cs" Inherits="PAWD_Store.Admin.Pages.ThirdCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/third_category.js"></script>
    <div class="animated">
        <div class="card">
            <div class="card-header">
                <i class="mr-2 fa fa-align-justify"></i>
                <strong class="card-title" v-if="headerText">Filter</strong>
            </div>
            <div class="card-body">
                <select class="form-control" id="FilterCat" onchange="FilterSubCategory()">
                    <option value="">--Select Category--</option>
                </select>
                <br />
                <select class="form-control" id="FilterSubCat" onchange="FilterThirdCategory()">
                    <option value="">--Select Sub Category--</option>
                </select>
            </div>
        </div>
    </div>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Third Category</strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Sub Category                     
                    </button>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Menu List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="ThirdCategoryTable" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Third Category Name</th>
                                                        <th>Sub Category Name</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- .animated -->
                    </div>
                </div>
            </div>
            <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="largeModalLabel">Third Category</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtThirdCat" placeholder="Enter Third Category" />
                                <div id="ErrorMsgThirdCat" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter Category.
                                </div>
                            </div>
                            <select class="form-control" id="DrdCategory" onchange="ChangeCategory()">
                                <option value="">--Select Category--</option>
                            </select>
                            <div id="ErrorMsgCategory" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                <span class="badge badge-pill badge-danger"></span>
                                Please select category.
                            </div>
                            <br />
                            <select class="form-control" id="DrdSubCat" disabled>
                                <option value="">--Select Sub Category--</option>
                            </select>
                            <div id="ErrorMsgSubCatDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                <span class="badge badge-pill badge-danger"></span>
                                Please select sub category.
                            </div>
                            <br />
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btnInsertThirdCat" onclick="InsertThirdCategory()" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="DeleteConfirm" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="largeModalLabel1">Confirm Delete</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                Are you sure want to delete this record ?
                               
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btndeletemenu" onclick="ConfirmDeleteMenu()" class="btn btn-primary">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .animated -->
    </div>
</asp:Content>
