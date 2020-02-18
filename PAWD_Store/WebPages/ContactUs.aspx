<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="PAWD_Store.WebPages.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/PageScript/contact_us.js"></script>
    <div class="ms-hero-page-override ms-hero-img-team ms-hero-bg-primary">
        <div class="container">
            <div class="text-center">
                <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Contact Us</h1>
                <p class="lead lead-lg color-light text-center center-block mt-2 mw-800 text-uppercase fw-300 animated fadeInUp animation-delay-7">
                    Do you need a boost in your project?
              <br>
                    Contact us we will help you to finish your dream.
                </p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card card-hero animated fadeInUp animation-delay-7">
            <div class="card-body">
                <form class="form-horizontal">
                    <fieldset class="container">
                        <div class="form-group row has-error is-focused" id="NameDiv">
                            <label for="inputName" autocomplete="false" class="col-lg-2 control-label">Name</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" id="inputName" placeholder="Name">
                            </div>
                        </div>
                        <div class="form-group row has-error is-focused" id="MobileDiv">
                            <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">Mobile No</label>
                            <div class="col-lg-9">
                                <input type="text" maxlength="10" onkeypress="return isNumberKey(event)" class="form-control" id="inputMobile" placeholder="Mobile">
                                <span id="msgMobile" style="display: none; color: #f44336;">Please enter valid mobile number</span>
                            </div>
                        </div>
                        <div class="form-group row has-error is-focused" id="AddressDiv">
                            <label for="textArea" class="col-lg-2 control-label">Address</label>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="2" id="inputAddress" placeholder="Yort address..."></textarea>
                            </div>
                        </div>
                        <div class="form-group row has-error is-focused" id="EmailDiv">
                            <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">Email</label>
                            <div class="col-lg-9">
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                <span id="msgEmail" style="display: none; color: #f44336;">Please enter valid email</span>
                            </div>
                        </div>
                        <div class="form-group row has-error is-focused" id="SubjectDiv">
                            <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">Subject</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" id="inputSubject" placeholder="Subject">
                            </div>
                        </div>
                        <div class="form-group row has-error is-focused" id="MessageDiv">
                            <label for="textArea" class="col-lg-2 control-label">Message</label>
                            <div class="col-lg-9">
                                <textarea class="form-control" rows="3" id="inputMessage" placeholder="Yout message..."></textarea>
                            </div>
                        </div>
                        <div class="form-group row justify-content-end">
                            <div class="col-lg-10">
                                <button type="button" onclick="ContactAdd()" class="btn btn-raised btn-primary">Submit</button>
                                <button type="button" onclick="ClearContactForm()" class="btn btn-danger">Cancel</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="card card-primary">
            <div class="row">
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="card-body wow fadeInUp">
                        <div class="mb-2">
                            <img src="../assets/img/Header_Logo.png" style="height: 100px; width: 100px;">
                        </div>
                        <address class="no-mb" style="width: 300px;">
                            <p>
                                <i class="color-danger-light zmdi zmdi-pin mr-1"></i>H.no 82, Sector 37,
                            </p>
                            <p>
                                <i class="color-warning-light zmdi zmdi-map mr-1"></i>Faridabad, Haryana - 121003
                            </p>
                            <p>
                                <i class="color-info-light zmdi zmdi-email mr-1"></i>
                                <a href="mailto:test@example.com">nishant.prabhakar1@gmail.com</a>
                            </p>
                            <p>
                                <i class="color-royal-light zmdi zmdi-phone mr-1"></i>+91 9986703954
                            </p>
                        </address>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-7">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3506.992168467475!2d77.31186691455605!3d28.479782497729733!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjjCsDI4JzQ3LjIiTiA3N8KwMTgnNTAuNiJF!5e0!3m2!1sen!2sus!4v1582008945889!5m2!1sen!2sus" width="100%" height="340"></iframe>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/jquery.dataTables.min.js"></script>
</asp:Content>
