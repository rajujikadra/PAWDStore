<%@ Page EnableEventValidation="false" Title="Sub_Category" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="PAWD_Store.Admin.Pages.SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/sub_category.js"></script>
    <div class="animated">
        <div class="card">
            <div class="card-header">
                <i class="mr-2 fa fa-align-justify"></i>
                <strong class="card-title" v-if="headerText">Filter</strong>
            </div>
            <div class="card-body">
                <select class="form-control" id="FilterCat" onchange="GetAllSubCategory()">
                    <option value="">--Select Category--</option>
                </select>
            </div>
        </div>
    </div>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Sub Category</strong>
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
                                            <strong class="card-title">Sub Category List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="SubCategoryTable" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Sub Category Name</th>
                                                        <th>Category Name</th>
                                                        <th>Menu Name</th>
                                                        <th>Action</th>
                                                        <th>HomePage</th>
                                                        <th>Up</th>
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
                            <h5 class="modal-title" id="largeModalLabel">Sub Category</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtSubCat" placeholder="Enter Sub Category" />
                                <div id="ErrorMsgSubCat" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter Category.
                                </div>
                            </div>
                            <select class="form-control" id="DrdCat">
                                <option value="">--Select Category--</option>
                            </select>
                            <div id="ErrorMsgCatDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                <span class="badge badge-pill badge-danger"></span>
                                Please enter Category.
                            </div>
                            <br />
                            <div class="form-group">
                                <input type="file" onchange="fnFileUpload(this)" class="form-control" id="uploadImage" />
                            </div>
                            <div class="form-group">
                                <label class="card-title" id="lblImage"></label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtSubCatTitle" placeholder="Enter Title" />
                                <div id="ErrorMsgSubCaTitlet" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please Title
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="textarea-input" id="txtSubCatDes" rows="3" placeholder="Enter description" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="file" onchange="fnFileUploadHeader(this)" class="form-control" id="uploadImageHeader" />
                            </div>
                            <div class="form-group">
                                <label class="card-title" id="lblImageHeader"></label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btnInsertSubCat" onclick="InsertSubCategory()" class="btn btn-primary">Submit</button>
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
