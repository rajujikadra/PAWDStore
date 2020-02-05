<%@ Page Title="Confirm Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="Rimp_India_Site.WebPages.ConfirmOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/order_details.js"></script>

    <div class="material-background"></div>
    <div class="container text-center mb-6">
        <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Thanks for order</h1>
        <p class="lead lead-lg color-white text-center center-block mt-2 mw-800 fw-300 animated fadeInUp animation-delay-7">
            Thanks for shopping with PAWD stores. You will find a summary of your recent purchase below. Please allow up to 3 business days (excluding weekends, holidays and sale days) to process and ship your order.
          <span class="colorStar">tricks</span> and
          <span class="colorStar">discounts</span>.
        </p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-3 text-right">Order Number :</div>
                            <div class="col-md-3 text-left" id="Order_No">1212121212121</div>
                            <div class="col-md-3 text-right">Order Date :</div>
                            <div class="col-md-3 text-left" id="Order_date">01-01-2020</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="OrderDetailsDiv">
                <article class="card card-primary wow zoomInRight animation-delay-5 mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-3">
                                <img src="../assets/img/black_wall.png" alt="" class="img-fluid mb-4">
                            </div>
                            <div class="col-xl-9">
                                <h3 class="no-mt">
                                    <a href="javascript:void(0)">Earum delectus libero ipsa temporibus in minus</a>
                                </h3>
                                <p>Lorem ipsum dolor sit amet, consectetur alter adipisicing elit. Facilis, natuse inse voluptates officia repudianda beatae magni es repudiandae beatae magni magnam autem natuse inse on voluptates elit sit molestias.</p>
                                <ul class="list-unstyled">
                                    <li><strong>Quantity: </strong>5</li>

                                </ul>
                                <h4 class="color-success no-m text-normal">₹ 6,199</h4>
                            </div>
                        </div>
                    </div>
                </article>
                
                
               
            </div>
        </div>
    </div>
</asp:Content>
