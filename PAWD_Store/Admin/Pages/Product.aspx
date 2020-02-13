<%@ Page Title="Product_add" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="PAWD_Store.Admin.Pages.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/product_page.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Products</strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Product                    
                    </button>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Product List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="ProductTable" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Title</th>
                                                        <th>Category</th>
                                                        <th>Sub Category</th>
                                                        <th>Third Category</th>
                                                        <th>Action</th>
                                                        <th>Images</th>
                                                        <th>CK_Editor</th>
                                                        <th>Specification</th>
                                                        <th>HotProduct</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="largeModalLabel">Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="txtProTitle" placeholder="Enter product title" />
                        <div id="ErrorMsgProTitle" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter title.
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="txtProShotDesc" placeholder="Enter short description" />
                        <div id="ErrorMsgProShortDesc" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter description.
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea name="textarea-input" id="txtProLongDesc" rows="3" placeholder="Enter long description" class="form-control"></textarea>
                        <div id="ErrorMsgProLongDesc" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter description.
                        </div>
                    </div>
                    <select class="form-control" id="DrdCat" onchange="ChangeCategory()">
                        <option value="">--Select Category--</option>
                    </select>
                    <div id="ErrorMsgCatDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                        <span class="badge badge-pill badge-danger"></span>
                        Please enter Category.
                    </div>
                    <br />
                    <select class="form-control" id="DrdSubCat" onchange="ChangeSubCategory()">
                        <option value="">--Select SubCategory--</option>
                    </select>
                    <div id="ErrorMsgSubCatDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                        <span class="badge badge-pill badge-danger"></span>
                        Please enter SubCategory.
                    </div>
                    <br />
                    <select class="form-control" id="DrdThirdCat">
                        <option value="">--Select ThirdCategory--</option>
                    </select>
                    <div id="ErrorMsgThirdCatDrp" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                        <span class="badge badge-pill badge-danger"></span>
                        Please enter ThirdCategory.
                    </div>
                    <br />
                    <div class="form-group">
                        <input type="text" onkeypress="return isNumberKey(event,this)" class="form-control" id="txtProPrice" placeholder="Enter price" />
                        <div id="ErrorMsgProPrice" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter price.
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="btnInsertSubCat" onclick="InsertProduct()" class="btn btn-primary">Submit</button>
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
                    <button type="button" id="btndeletemenu" onclick="ConfirmDeleteProduct()" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
