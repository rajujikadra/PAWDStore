var ImageString;
var ProfileImage;
$(document).ready(function () {
    GetProfile();
});
function GetProfile() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/MyProfile.aspx/GetUserDetails",
        dataType: "json",
        success: function (res) {
            var data = JSON.parse(res.d);
            ProfileImage = data.ProfileImage;
            $("#userImg").attr("src", (data.ProfileImage == undefined || data.ProfileImage.trim() == "" || data.ProfileImage == null) ? "../ProfileImage/user_default.png" : "../ProfileImage/" + data.ProfileImage);
            $("#MainHeading").text((data.FullName == undefined || data.FullName.trim() == "" || data.FullName == null) ? "N/A" : data.FullName);
            $("#MainUsrHeading").text((data.UserName == undefined || data.UserName.trim() == "" || data.UserName == null) ? "" : "@" + data.UserName);
            $("#UsrBio").text((data.Bio == undefined || data.Bio == "" || data.Bio.trim() == null) ? "N/A" : data.Bio);
            $("#usrName").text((data.UserName == undefined || data.UserName == "" || data.UserName == null) ? "" : data.UserName);
          
            $("#usrFullname").text((data.FullName == undefined || data.FullName.trim() == "" || data.FullName == null) ? "N/A" : data.FullName);
            var strMail = "<a href=mailto:" + data.EmailID + ">" + data.EmailID + "</a>";
            $("#usrMail").html(strMail);
            $("#usrJoindate").text(new Date(data.JoinDate).format("MM/dd/yyyy"));
            var strWebsite = (data.Website == undefined || data.Website.trim() == "" || data.Website == null) ? "<a>N/A</a>" : "<a href='" + data.Website + "'>" + data.Website +"</a>";
            $("#usrWebsite").html(strWebsite);
            BindUserData(data);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function BindUserData(data) {
    $("#txtFname").val(data.FirstName);
    $("#txtLName").val(data.LastName);
    $("#txtWebsite").val(data.Website);
    $("#txtBio").val(data.Bio);
    $("#txtImageName").val(data.ProfileImage);
}
function AddUserDetails() {
    if (validationUser() == true) {
        var obj = {
            'FirstName': $("#txtFname").val().trim(),
            'LastName': $("#txtLName").val().trim(),
            'Website': $("#txtWebsite").val().trim(),
            'ProfileImage': ProfileImage,
            'Bio': $("#txtBio").val().trim(),
            'Image_binary': ImageString == undefined ? "" : ImageString
        };
        $.ajax({
            async: false,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/WebPages/MyProfile.aspx/AddUserDetails",
            data: JSON.stringify({
                'FirstName': $("#txtFname").val().trim(),
                'LastName': $("#txtLName").val().trim(),
                'Website': $("#txtWebsite").val().trim(),
                'ProfileImage': ProfileImage,
                'Bio': $("#txtBio").val().trim(),
                'Image_binary': ImageString == undefined ? "" : ImageString
            }),
            dataType: "json",
            success: function (res) {
                debugger;
                var status = JSON.parse(res.d);
                if (status == "success") {
                    $("#divDetailsUser").css("display", "block");
                    $("#EditProfileDiv").css("display", "none");
                    GetProfile();
                    toastr.success("Your profile details has been updated !!!");
                } else {
                    toastr.error("Opps some problecm occured.");
                }
            },
            error: function (xhr, status, err) {
                toastr.error(xhr.responseJSON.Message);
            }
        });
    }
}
function validationUser() {
    if ($("#txtFname").val().trim() == "" || $("#txtFname").val().trim() == undefined || $("#txtFname").val().trim() == null) {
        $("#errorFName").html('Please enter first name.');
        $('html, body').animate({
            scrollTop: $("#errorFName").parent().parent().offset().top - 100
        }, 500);
        $('#errorFName').fadeIn('fast').delay(2000).fadeOut('slow');
        return false;
    }
    if ($("#txtLName").val().trim() == "" || $("#txtLName").val().trim() == undefined || $("#txtLName").val().trim() == null) {
        $("#errorLName").html('Please enter last name.');
        $('html, body').animate({
            scrollTop: $("#errorLName").parent().parent().offset().top - 100
        }, 500);
        $('#errorLName').fadeIn('fast').delay(2000).fadeOut('slow');
        return false;
    }
    if ($("#txtWebsite").val().trim() == "" || $("#txtWebsite").val().trim() == undefined || $("#txtWebsite").val().trim() == null) {
        $("#errorWebsite").html('Please enter website.');
        $('html, body').animate({
            scrollTop: $("#errorWebsite").parent().parent().offset().top - 100
        }, 500);
        $('#errorWebsite').fadeIn('fast').delay(2000).fadeOut('slow');
        return false;
    }
    if ($("#txtBio").val().trim() == "" || $("#txtBio").val().trim() == undefined || $("#txtBio").val().trim() == null) {
        $("#errorBio").html('Please enter bio.');
        $('html, body').animate({
            scrollTop: $("#errorBio").parent().parent().offset().top - 100
        }, 500);
        $('#errorBio').fadeIn('fast').delay(2000).fadeOut('slow');
        return false;
    }
    return true;
}
function hide_show_div() {
    $("#divDetailsUser").css("display", "none");
    $("#EditProfileDiv").css("display", "block");
}
function ShowDetailDiv() {
    $("#divDetailsUser").css("display", "block");
    $("#EditProfileDiv").css("display", "none");
}


function fnFileUpload(obj) {
    var indexvalue = $(obj).attr("index");
    if ($(obj)[0].value !== "") {
        if ($(obj)[0].files.length > 0) {
            var selectedFile = $(obj)[0].files[0];
            var ext = selectedFile.name.split('.').pop();
            if (ext.toLowerCase() == "pdf" || ext.toLowerCase() == "jpeg" || ext.toLowerCase() == "png" || ext.toLowerCase() == "jpg" || ext.toLowerCase() == "gif") {
                if (selectedFile) {
                    if (selectedFile.size < 10485760) {
                        var reader = new FileReader();
                        var fileContent = "";
                        reader.onload = function (e) {
                            fileContent = reader.result;
                            var tempFileContent = fileContent.split(',');
                            if (tempFileContent.length > 0) {
                                ImageString = tempFileContent[tempFileContent.length - 1];
                                //$("#P_Image").attr("src", "data:image/" + ImageName.split('.')[1] + ";base64," + ImageString);
                            }
                        }
                        ProfileImage = selectedFile.name;
                        reader.readAsDataURL(selectedFile);
                    }
                    else {
                        toastr.error("Please select file lower then 10mb.");
                    }
                }
            }
            else {
                toastr.error("Opps some problem are occurred.");
            }
        }
    }
}