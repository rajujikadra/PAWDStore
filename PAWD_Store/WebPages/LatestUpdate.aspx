<%@ Page Title="LatestUpdate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LatestUpdate.aspx.cs" Inherits="PAWD_Store.WebPages.LatestUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container container-full">
        <div class="ms-paper">
            <div class="row">
                <div class="col-lg-12 ms-paper-content-container">
                    <div class="ms-paper-content">
                        <section class="ms-component-section">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-primary" id="bind_update">
                                        <%--<div class="card-header">
                                            <h3 class="card-title"><i class="zmdi zmdi-attachment-alt"></i>Card Title</h3>
                                        </div>
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit deleniti, amet quib us neque recusandae commodi.</p>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function get_single_latest_update(data) {
            if (data != null) {
                var str = "";
                str += '<div class="card-header"><h3 class="card-title"><i class="zmdi zmdi-attachment-alt"></i>' + data.Title + '</h3></div> <div class="card-body"><p>' + data.Description + '</p></div>';
                $("#bind_update").append(str);
            }
        }
    </script>
</asp:Content>
