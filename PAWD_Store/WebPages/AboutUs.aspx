<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="PAWD_Store.WebPages.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="ms-hero-page ms-hero-bg-dark-light ms-hero-img-airplane mb-4">
        <div class="container">
            <div class="text-center">
                <h1 class="color-primary mb-4 animated fadeInDown animation-delay-4">OUR PROMISE TO YOU</h1>
                <p class="lead lead-xl mw-800 center-block color-medium mb-2 animated fadeInDown animation-delay-4">
                    Get Only What You Need, Never Overpay for What You Don't 
                </p>
                <div class="row mb-6 mt-2">
                    <div class="col-md-6 col-sm-6 animated zoomInUp animation-delay-5">
                        <i class="glyphicon glyphicon-check color-primary zmdi-hc-4x"></i>
                        <h4 class="color-white text-uppercase">NEVER OVER SELL OR OVER COMPLICATE</h4>
                    </div>

                    <div class="col-md-6 col-sm-6 animated zoomInUp animation-delay-6">
                        <i class="glyphicon glyphicon-th color-primary zmdi-hc-4x"></i>
                        <h4 class="color-white text-uppercase">ONE STOP SOLUTIONS</h4>
                    </div>

                </div>
                <div class="row mb-6 mt-2">
                    <div class="col-md-6 col-sm-6 animated zoomInUp animation-delay-7">
                        <i class="glyphicon glyphicon-wrench color-primary zmdi-hc-4x"></i>
                        <h4 class="color-white text-uppercase">PRACICAL,EAST-TO-USE SOLUTIONS</h4>
                    </div>

                    <div class="col-md-6 col-sm-6 animated zoomInUp animation-delay-8">
                        <i class="zmdi zmdi-accounts color-primary zmdi-hc-4x"></i>
                        <h4 class="color-white text-uppercase">EXPERIENCE YOU CAN TRUST</h4>
                    </div>
                </div>
                <%--  <a href="<%: GetRouteUrl("home", null) %>" class="btn btn-raised btn-warning animated fadeInUp animation-delay-10">
                    <i class="zmdi zmdi-desktop-mac"></i>Home</a>
                <a href="<%: GetRouteUrl("contact", null) %>" class="btn btn-raised btn-info animated fadeInUp animation-delay-10">
                    <i class="zmdi zmdi-email"></i>Concact us</a>--%>
            </div>
        </div>
    </header>
    <div class="container wow fadeInUp">
        <div class="row">
            <div class="col-lg-6 text-justify">
                <h2 class="color-primary right-line">Our Vision</h2>
                <p class="dropcaps">
                    Our vision is to provide customers in industry, with solutions designed to meet their specific challenges and enable them to profit them from the advanced use of technology. We understand to build long term relationship based on mutual trust.
                </p>
                <p>
                    Provide our customers with the next generation of productivity gains and customer experience innovation through our deep knowledge of the changing global consumer and technology.
                </p>
            </div>
            <div class="col-lg-6">
                <h2 class="color-primary right-line">Our Approach</h2>
                <div class="ms-collapse" id="accordion2" role="tablist" aria-multiselectable="true">
                    <div class="mb-0 card card-primary wow fadeInUp animation-delay-2">
                        <div class="card-header" role="tab" id="headingOne2">
                            <h4 class="card-title">
                                <a class="withripple" role="button" data-toggle="collapse" href="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                                    <i class="fa fa-lightbulb-o"></i>OUR MISSION </a>
                            </h4>
                        </div>
                        <div id="collapseOne2" class="card-collapse collapse show" role="tabpanel" aria-labelledby="headingOne2" data-parent="#accordion2">
                            <div class="card-body color-dark">
                                <p>
                                    our mission of exceptional service and consistent performance.
To innovate, identify, design and implement cost effective and efficient smart solutions for smart customers to satisfy the need of the customer for development of sound infrastructure for the customers.
We deliver innovative technology and services that make businesses better through a powerful combination of customer knowledge, inspired thinking and attentive associates.
                                </p>
                            </div>
                        </div>
                    </div>
                    <%--         <div class="mb-0 card card-primary wow fadeInUp animation-delay-5">
                        <div class="card-header" role="tab" id="headingTwo2">
                            <h4 class="card-title">
                                <a class="collapsed withripple" role="button" data-toggle="collapse" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
                                    <i class="fa fa-desktop"></i>Design and code </a>
                            </h4>
                        </div>
                        <div id="collapseTwo2" class="card-collapse collapse" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordion2">
                            <div class="card-body color-dark">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit dignissimos inventore cupiditate expedita saepe enim nobis nostrum? Laborum, laudantium, maiores, cupiditate, perspiciatis at ad accusamus.</p>
                                <p>Incidunt, harum itaque voluptatum asperiores recusandae explicabo maiores. Alias, quos, ex impedit at error id laborum fugit architecto qui beatae molestiae dolorum rem veritatis quia aliquam totam.</p>
                            </div>
                        </div>
                    </div>--%>
                    <div class="mb-0 card card-primary wow fadeInUp animation-delay-7">
                        <div class="card-header" role="tab" id="headingThree3">
                            <h4 class="card-title">
                                <a class="collapsed withripple" role="button" data-toggle="collapse" href="#collapseThree2" aria-expanded="false" aria-controls="collapseThree2">
                                    <i class="fa fa-user"></i>OUR APPROACH </a>
                            </h4>
                        </div>
                        <div id="collapseThree2" class="card-collapse collapse" role="tabpanel" aria-labelledby="headingThree2" data-parent="#accordion2">
                            <div class="card-body color-dark">
                                <p>Our business model focuses on having long-term strategic relations with our clients by providing a combination of high quality, cost effective and on time delivery of solutions. In each client project, we work beyond the norms of a conventional client relationship by investing more time to understand customer current and future business needs. We assure to deliver high quality and reliable IT solutions at a competitive cost to our client. After all, “our clients are our first priority”!!!</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-6">
        <h2 class="right-line no-mt mb-4 wow fadeInUp">Our Services</h2>
        <div class="row">
            <div class="col-lg-4 col-md-8 col-sm-8 mb-2">
                <div class="ms-icon-feature wow flipInX animation-delay-4">
                    <div class="ms-icon-feature-icon">
                        <span class="ms-icon ms-icon-lg ms-icon-inverse">
                            <i class="fa fa-laptop"></i>
                        </span>
                    </div>
                    <div class="ms-icon-feature-content">
                        <h4 class="color-primary">Computing (IT)</h4>
                        <p>We offer service for the Computer Maintenance, Server Maintenance, Computer Networking, Computer Printer Maintenance, Local area Networking, Wireless Networking, Laptop Maintenance, Data backup and data Recovery.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 col-sm-8 mb-2">
                <div class="ms-icon-feature wow flipInX animation-delay-4">
                    <div class="ms-icon-feature-icon">
                        <span class="ms-icon ms-icon-lg ms-icon-inverse">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <div class="ms-icon-feature-content">
                        <h4 class="color-primary">Security System</h4>
                        <p>We Provide CCTV Camera, Stand alone DVR, Video Door Phone, Access Control, Bio-metric Attendance System, Cables & Connectors for Security purpose</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 col-sm-8 mb-2">
                <div class="ms-icon-feature wow flipInX animation-delay-4">
                    <div class="ms-icon-feature-icon">
                        <span class="ms-icon ms-icon-lg ms-icon-inverse">
                            <i class="glyphicon glyphicon-expand"></i>
                        </span>
                    </div>
                    <div class="ms-icon-feature-content">
                        <h4 class="color-primary">Audio - Video System</h4>
                        <p>We provide all types of Projectors, Projector Screen, Ceiling Mount Kit, Projector Screen Tripod, Cables & Connectors, Amplifier, Speaker for your HOME THEATER or CONFERENCE ROOM</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
