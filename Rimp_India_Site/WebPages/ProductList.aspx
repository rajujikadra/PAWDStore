<%@ Page Title="Product list" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Rimp_India_Site.WebPages.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/product_list.js"></script>
    <style type="text/css">
        .product_box {
            display: block;
            width: 215px;
            height: 144px;
        }

            .product_box img {
                width: 80%;
                height: 100%;
            }

        .product_title {
            height: 20px !important;
            overflow: hidden;
        }

        .short_description {
            height: 48px !important;
            overflow: hidden;
        }
    </style>
    <div class="ms-hero-page ms-hero-img-city2 ms-hero-bg-info mb-6">
        <div class="text-center color-white mt-6 mb-6 index-1">
            <h1 id="header"></h1>
            <p class="lead lead-lg" id="Description">
            </p>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3" id="SideBar">
            </div>
            <div class="col-lg-9">
                <div class="row" id="Bind_all_products">
                    <%-- Here is bind all products sub-category wise --%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
