<%@ Page Title="Contacts" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Rimp_India_Site.Admin.Pages.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Scripts/PageScript/contact_us.js"></script>
    <div class="content mt-3">
        <div class="animated">
            <div class="card">
                <div class="card-header">
                    <i class="mr-2 fa fa-align-justify"></i>
                    <strong class="card-title" v-if="headerText">Contacts</strong>
                </div>
                <input type="hidden" id="hdnMenuID" />
                <div class="card-body">
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Contact List</strong>
                                        </div>
                                        <div class="card-body">
                                            <table id="example" class="table table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Mobile</th>
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
                        <!-- .animated -->
                    </div>
                </div>
            </div>
            <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="largeModalLabel">Menu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Menu</label>
                                <input type="text" class="form-control" id="txtMenuName" placeholder="Enter menu" />

                                <div id="ErrorMsgMenu" class="sufee-alert alert with-close alert-danger alert-dismissible fade show" style="display: none;">
                                    <span class="badge badge-pill badge-danger"></span>
                                    Please enter menu name.
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnCancel" onclick="ClearModal()" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="btnInsertMenu" onclick="InsertMenu()" class="btn btn-primary" data-dismiss="">Submit</button>
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
