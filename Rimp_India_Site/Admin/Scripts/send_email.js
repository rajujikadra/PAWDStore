
$(document).ready(function () {
    GetAllEmailgroup();
})

function GetAllEmailgroup() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SendEmail.aspx/GetAll_EmailGroup",
        dataType: "json",
        success: function (res) {
            var AllGroup = JSON.parse(res.d);
            if (AllGroup != null && AllGroup != undefined) {
                for (i = 0; i < AllGroup.length; i++) {
                    $("#DrdEmailGrp").append($("<option></option>").val(AllGroup[i].Email_Group_ID).html(AllGroup[i].Email_Group_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function clear() {
    $("#txtMessage").val("");
}


function SendMail() {

}