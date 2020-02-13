<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PAWD_Store._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .product_box {
            display: block;
            width: 215px;
            height: 144px
        }

            .product_box img {
                width: 75%;
                height: 100%
            }

        .product_title {
            height: 42px !important;
            overflow: hidden
        }

        .last_pro {
            margin-top: 3px;
            height: 51px;
            overflow: hidden;
            width: 348px
        }

        @media screen and (min-width:320px) {
            .last_pro {
                width: 200px
            }
        }

        @media screen and (min-width:768px) {
            .last_pro {
                width: 300px
            }
        }

        @media screen and (min-width:1024px) {
            .last_pro {
                width: 300px
            }
        }
    </style>
    <div id="carousel-example-generic" class="ms-carousel carousel slide" style="margin-top: -40px;">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <img class="d-block img-fluid" src="../assets/bannerfinal/banner1.png" alt="..." />
            </div>
            <div class="carousel-item">
                <img class="d-block img-fluid" src="../assets/bannerfinal/banner2.jpg" alt="..." />
            </div>
            <div class="carousel-item">
                <img class="d-block img-fluid" src="../assets/bannerfinal/Banner3.jpg" alt="..." />
            </div>
            <div class="carousel-item">
                <img class="d-block img-fluid" src="../assets/bannerfinal/PAWDSTORE.jpg" alt="..." />
            </div>
            <div class="carousel-item">
                <img class="d-block img-fluid" src="../assets/bannerfinal/banner4.jpg" alt="..." />
            </div>
        </div>
        <!-- Controls -->
        <a href="#carousel-example-generic" class="btn-circle btn-circle-xs btn-circle-raised btn-circle-primary left carousel-control-prev" role="button" data-slide="prev">
            <i class="zmdi zmdi-chevron-left"></i>
        </a>
        <a href="#carousel-example-generic" class="btn-circle btn-circle-xs btn-circle-raised btn-circle-primary right carousel-control-next" role="button" data-slide="next">
            <i class="zmdi zmdi-chevron-right"></i>
        </a>
    </div>
    <div class="wrap bg-warning">
        <div class="container">
            <h1 class="color-white text-center mb-4">Hot Product</h1>
            <div class="row color-dark" id="hot_product">
                <%-- Bind hot product here --%>
            </div>
        </div>        
        <!-- container -->
    </div>
    <div class="container mt-6">
        <h1 class="text-center mb-4">Category</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="row" id="ContainerHome">
                    <%-- Bind Sub-Category only maximum bind 12 sub-category --%>
                </div>
            </div>
        </div>
    </div>

    <style type="text/css">
        .Set_slide_img {
            height: 61%;
            width: 89%;
            margin-top: 55px;
            margin-left: 33px;
            @media ( id (max- idth
                  Set_eight
                  width: 84%;
                margin-left: 23px; } 
                }
    </style>

</asp:Content>
