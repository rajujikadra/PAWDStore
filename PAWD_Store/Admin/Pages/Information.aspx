<%@ Page Title="Information" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Information.aspx.cs" Inherits="PAWD_Store.Admin.Pages.Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/footer_information.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Information</strong>
                </div>
                <div class="card-body">
                    <button type="button" onclick="SetMode()" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#largeModal">
                        Add Information                     
                    </button>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Information List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="information_table" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Title</th>
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
                            <h5 class="modal-title" id="largeModalLabel">Information</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtTitle" placeholder="Enter title" />
                                <div id="ErrorMsgTitle" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter Title.
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="textarea-input" id="txtDesc" rows="3" placeholder="Enter long description" class="form-control"></textarea>
                                <div id="ErrorDesc" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter description.
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btnInsertMenu" onclick="InsertInformation()" class="btn btn-primary" data-dismiss="">Submit</button>
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
                            <button type="button" id="btndeletemenu" onclick="ConfirmDeleteIfo()" class="btn btn-primary">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- .animated -->
    </div>
</asp:Content>
