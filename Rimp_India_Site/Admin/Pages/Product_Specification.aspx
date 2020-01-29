<%@ Page Title="Specification" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product_Specification.aspx.cs" Inherits="Rimp_India_Site.Admin.Pages.Product_Specification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/product_specification.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" id="pro_title_image" v-if="headerText"></strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Specification                    
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
                                            <table id="Product_specification" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Specification Title</th>
                                                        <th>Specification Value</th>
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
                    <h5 class="modal-title" id="largeModalLabel">Product Specification</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="txtProSpecTitle" placeholder="Enter title" />
                        <div id="ErrorMsgProSpecTitle" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter title.
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="txtProSpecValue" placeholder="Enter value" />
                        <div id="ErrorMsgProSpecValue" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                            <span class="badge badge-pill badge-danger"></span>
                            Please enter value.
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="btnInsertSubCat" onclick="InsertProductSpec()" class="btn btn-primary">Submit</button>
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
                    <button type="button" id="btndeletemenu" onclick="ConfirmDeleteProductCK()" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
