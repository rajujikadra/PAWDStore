<%@ Page Title="Email-Send" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SendEmail.aspx.cs" Inherits="PAWD_Store.Admin.Pages.SendEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminDashboard" runat="server">
    <script src="../Admin/Scripts/send_email.js"></script>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header"><strong>Email Send</strong></div>
                <div class="card-body card-block">
                    <div class="form-group">
                        <label for="company" class=" form-control-label">Group</label>
                        <select class="form-control" id="DrdEmailGrp">
                            <option value="">--Select Email Group--</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="company" class=" form-control-label">Upload Image</label>
                        <input type="file" onchange="fnFileUpload(this)" class="form-control" id="uploadImage" />
                    </div>
                  <%--  <div class="form-group">
                        <label class="card-title" id="lblImage"></label>
                    </div>--%>
                    <div class="form-group">
                        <label for="vat" class=" form-control-label">Description</label>
                        <textarea name="textarea-input" id="txtMessage" rows="5" placeholder="Content..." class="form-control"></textarea>
                    </div>

                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary btn-sm">
                        <i class="fa fa-dot-circle-o"></i>&nbsp;Send                       
                    </button>
                    <button type="reset" id="btnReset" onclick="clear()" class="btn btn-danger btn-sm">
                        <i class="fa fa-ban"></i>&nbsp; Reset                       
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
