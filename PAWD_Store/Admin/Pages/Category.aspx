<%@ Page EnableEventValidation="false" Title="Category" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="PAWD_Store.Admin.Pages.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/category.js"></script>
    <div class="animated">
        <div class="card">
            <div class="card-header">
                <i class="mr-2 fa fa-align-justify"></i>
                <strong class="card-title" v-if="headerText">Filter</strong>
            </div>
            <div class="card-body">
                <select class="form-control" id="FilterMenu" onchange="GetAllCategory()">
                    <option value="">--Select Menu--</option>
                </select>
            </div>
        </div>
    </div>

    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Category</strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Category                     
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
                                            <table id="CategoryTable" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Category Name</th>
                                                        <th>Menu Name</th>
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
                            <h5 class="modal-title" id="largeModalLabel">Category</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category Name</label>
                                <input type="text" class="form-control" id="txtCatName" placeholder="Enter category" />
                                <div id="ErrorMsgCat" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter Category.
                                </div>
                            </div>
                            <select class="form-control" id="DrdMenu">
                                <option value="">--Select Menu--</option>
                            </select>

                            <div id="ErrorMsgMenuDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                <span class="badge badge-pill badge-danger"></span>
                                Please select menu.
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btnInsertCat" onclick="InsertCategory()" class="btn btn-primary">Submit</button>
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
