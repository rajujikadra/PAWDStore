<%@ Page Title="Contacts" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="PAWD_Store.Admin.Pages.ContactUs" %>

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
                    </div>
                    <div class="content mt-3">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">Contact Details</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="text-dark" style="font-style: oblique;" for="exampleInputEmail1">Name : </label>
                                                <span style="margin-left: 45px;" id="C_name">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Subject : </label>
                                                <span style="margin-left: 35px;" id="C_subject">N/A</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Mobile : </label>
                                                <span style="margin-left: 39px;" id="C_mobile">N/A</span>
                                            </div>
                                             <div class="form-group">
                                                <label for="exampleInputEmail1">Email : </label>
                                                <span style="margin-left: 50px;" id="C_email">N/A</span>
                                            </div>
                                             <div class="form-group">
                                                <label for="exampleInputEmail1">Address : </label>
                                                <span style="margin-left: 30px;" id="C_address">N/A</span>
                                            </div>
                                             <div class="form-group">
                                                <label for="exampleInputEmail1">Message : </label>
                                                <span style="margin-left: 26px;" id="C_message">N/A</span>
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
    </div>
</asp:Content>
