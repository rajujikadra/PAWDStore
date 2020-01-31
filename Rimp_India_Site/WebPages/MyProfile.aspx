<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Rimp_India_Site.WebPages.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Admin/Scripts/UserProfile.js"></script>
    <div class="container" id="divDetailsUser">
        <div class="row">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-12 col-md-6 order-md-1">
                        <div class="card animated fadeInUp animation-delay-7">
                            <div class="ms-hero-bg-primary ms-hero-img-coffee">
                                <h3 class="color-white index-1 text-center no-m pt-4" id="MainHeading">Victoria Smith</h3>
                                <div class="color-medium index-1 text-center np-m" id="MainUsrHeading">@vic_smith</div>
                                <img id="userImg"  src="../assets/img/demo/avatar1.jpg" alt="..." class="img-avatar-circle"  onerror="this.src='../assets/img/No_Image_Available.png'" />
                            </div>
                            <div class="card-body pt-4 text-center">
                                <h3 class="color-primary">Bio</h3>
                                <p id="UsrBio">Lorem ipsum dolor sit amet, consectetur alter adipisicing elit. Facilis, natuse inse voluptates officia repudiandae beatae magni es magnam autem molestias.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 order-md-3 order-lg-2">
                        <a onclick="hide_show_div();" class="btn btn-warning btn-raised btn-block animated fadeInUp animation-delay-12">
                            <i class="zmdi zmdi-edit"></i>Edit Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card card-info card-body text-center wow zoomInUp animation-delay-2">
                            <h2 class="counter color-info">450</h2>
                            <i class="fa fa-4x fa-file-text color-info"></i>
                            <p class="mt-2 no-mb lead small-caps color-info">articles</p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card card-success card-body text-center wow zoomInUp animation-delay-5">
                            <h2 class="counter color-success">64</h2>
                            <i class="fa fa-4x fa-briefcase color-success"></i>
                            <p class="mt-2 no-mb lead small-caps color-success">projects done</p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card card-royal card-body text-center wow zoomInUp animation-delay-4">
                            <h2 class="counter color-royal">600</h2>
                            <i class="fa fa-4x fa-comments-o color-royal"></i>
                            <p class="mt-2 no-mb lead small-caps color-royal">comments</p>
                        </div>
                    </div>
                </div>
                <div class="card card-primary animated fadeInUp animation-delay-12">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="zmdi zmdi-account-circle"></i>General Information</h3>
                    </div>
                    <table class="table table-no-border table-striped">
                        <tr>
                            <th>
                                <i class="zmdi zmdi-account mr-1 color-success"></i>User Name</th>
                            <td id="usrName">vic_smith</td>
                        </tr>
                        <tr>
                            <th>
                                <i class="zmdi zmdi-face mr-1 color-warning"></i>Fullname</th>
                            <td id="usrFullname">Victoria Smith</td>
                        </tr>
                        <tr>
                            <th>
                                <i class="zmdi zmdi-email mr-1 color-danger"></i>Email</th>
                            <td id="usrMail">
                                
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <i class="zmdi zmdi-link mr-1 color-info"></i>Website</th>
                            <td id="usrWebsite">
                                
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <i class="zmdi zmdi-calendar mr-1 color-royal"></i>Member Since</th>
                            <td id="usrJoindate">12/11/2015</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="EditProfileDiv" style="display:none;">
        <div class="row">
            <div class="col-xl-12 col-lg-12">
                <div class="card card-primary animated fadeInUp animation-delay-7">
                    <div class="ms-hero-bg-primary ms-hero-img-mountain">
                        <h2 class="text-center no-m pt-4 pb-4 color-white index-1">Contact</h2>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <fieldset class="container">
                                <div class="form-group row">
                                    <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">First Name</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="txtFname" placeholder="First name" />
                                        <span class="text-danger" id="errorFName"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">Last Name</label>
                                    <div class="col-lg-9">
                                        <input type="email" class="form-control" id="txtLName" placeholder="Last name" />
                                        <span class="text-danger" id="errorLName"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputEmail" autocomplete="false" class="col-lg-2 control-label">Website</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="txtWebsite" placeholder="Website" />
                                        <span class="text-danger" id="errorWebsite"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="textArea" class="col-lg-2 control-label">Bio</label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" rows="3" id="txtBio" placeholder="Yout bio..."></textarea>
                                        <span class="text-danger" id="errorBio"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="textArea" class="col-lg-2 control-label">Phpto</label>
                                    <div class="col-lg-9">
                                        <input type="file" id="uploadImage" onchange="fnFileUpload(this)"/>
                                        <div class="input-group">
                                            <input id="txtImageName" type="text" readonly="" class="form-control" placeholder="Placeholder w/file chooser..." />
                                            <span class="input-group-btn input-group-sm">
                                                <button type="button" class="btn btn-fab btn-fab-mini">
                                                    <i class="material-icons">attach_file</i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row justify-content-end">
                                    <div class="col-lg-10">
                                        <button type="button" onclick="AddUserDetails();" class="btn btn-raised btn-primary">Submit</button>
                                        <button type="button" class="btn btn-danger" onclick="ShowDetailDiv()">Cancel</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
