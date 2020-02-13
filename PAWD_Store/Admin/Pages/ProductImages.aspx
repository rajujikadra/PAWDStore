<%@ Page Title="Product Images" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductImages.aspx.cs" Inherits="PAWD_Store.Admin.Pages.ProductImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/product_image.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" id="pro_title_image" v-if="headerText"></strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Image                    
                    </button>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title" id="table_Heading"></strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="ProductImage" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Title</th>
                                                        <th>Image Name</th>
                                                        <th>Image</th>
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
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="largeModalLabel">Product Image</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-group">
                            <input type="file" onchange="fnFileUpload(this)" class="form-control" id="uploadImage" />
                        </div>
                        <img id="P_Image" height="200" width="200" src="" alt="" />
                        <div id="ErrorMsgProImg" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please upload image.
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="btnInsertSubCat" onclick="InsertProductImage()" class="btn btn-primary">Submit</button>
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
                    <button type="button" id="btndeletemenu" onclick="ConfirmDeleteProductImage()" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
