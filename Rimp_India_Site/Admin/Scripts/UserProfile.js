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
            $("#MainHeading").text(data.FullName);
            $("#MainUsrHeading").text("@" + data.FullName);
            $("#UsrBio").text(data.Bio);
            $("#usrName").text(data.UserName);
            $("#usrFullname").text(data.FullName);
            var strMail = "<a href=mailto" + data.EmailID + ">" + data.EmailID + "</a>";
            $("#usrMail").html(strMail);
            $("#usrJoindate").text(new Date(data.JoinDate).format("MM/dd/yyyy"));
            var strWebsite = "<a href=" + data.Website + ">" + data.Website + "</a>";
            $("#usrWebsite").html(strWebsite);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function hide_show_div() {
    $("#divDetailsUser").css("display", "none");
    $("#EditProfileDiv").css("display", "block");
}
function ShowDetailDiv() {
    $("#divDetailsUser").css("display", "block");
    $("#EditProfileDiv").css("display", "none");
}