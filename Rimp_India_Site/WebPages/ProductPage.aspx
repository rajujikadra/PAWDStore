<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="Rimp_India_Site.WebPages.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/product_page.js"></script>

   <%-- <style type="text/css">
        .carousel-item img {
            -webkit-transition: all 1s ease; /* Safari and Chrome */
            -moz-transition: all 1s ease; /* Firefox */
            -ms-transition: all 1s ease; /* IE 9 */
            -o-transition: all 1s ease; /* Opera */
            transition: all 1s ease;
        }

        .carousel-item:hover img {
            -webkit-transform: scale(1.75) /* Safari and Chrome */ -moz-transform: scale(1.75); /* Firefox */
            -ms-transform: scale(1.75); /* IE 9 */
            -o-transform: scale(1.75); /* Opera */
            transform: scale(1.75);
        }
    </style>--%>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div id="carousel-product" class="ms-carousel ms-carousel-thumb carousel slide animated zoomInUp animation-delay-5" data-ride="carousel" data-interval="0">
                    <div class="card card-body">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox" id="bind_image">
                            <%--<div class="carousel-item active">
                                <img src="../assets/img/demo/products/1.jpg" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/img/demo/products/2.jpg" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/img/demo/products/3.jpg" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/img/demo/products/4.jpg" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/img/demo/products/5.jpg" alt="...">
                            </div>--%>
                        </div>
                    </div>
                    <!-- Indicators -->
                    <ol class="carousel-indicators carousel-indicators-tumbs carousel-indicators-tumbs-outside" id="bind_small_image">
                        <%--<li data-target="#carousel-product" data-slide-to="0" class="active">
                            <img src="../assets/img/demo/products/m1.png" alt="">
                        </li>
                        <li data-target="#carousel-product" data-slide-to="1">
                            <img src="../assets/img/demo/products/m2.png" alt="">
                        </li>
                        <li data-target="#carousel-product" data-slide-to="2">
                            <img src="../assets/img/demo/products/m3.png" alt="">
                        </li>
                        <li data-target="#carousel-product" data-slide-to="3">
                            <img src="../assets/img/demo/products/m4.png" alt="">
                        </li>
                        <li data-target="#carousel-product" data-slide-to="4">
                            <img src="../assets/img/demo/products/m5.png" alt="">
                        </li>--%>
                    </ol>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card animated zoomInDown animation-delay-5" id="bind_product_data">
                    <%-- Bind Product Information in this part --%>
                </div>
            </div>
        </div>
        <div class="row" id="bind_ck_editor">
            <%-- Bind ck editor information in this part --%>
        </div>

        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title" style="font-size: 22px;">
                    <i class="zmdi zmdi-graduation-cap"></i>SPECIFICATION</h3>
            </div>
            <div id="bind_product_specification">
            </div>
            <%--<table class="table table-no-border table-striped">
                <tbody id="bind_product_specification">
                
                </tbody>
            </table>--%>
        </div>

    </div>
</asp:Content>
