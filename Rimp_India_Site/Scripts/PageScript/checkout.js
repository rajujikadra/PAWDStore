function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function emailValidOrNot(value) {
    var re = /([A-Z0-9a-z_-][^@])+?@[^$#<>?]+?\.[\w]{2,4}/.test(value);
    if (!re) {
        $("#EmailDiv").addClass("has-error is-focused");
        return false;
    } else {
        $("#EmailDiv").removeClass("has-error is-focused");
        return true;
    }
}
$(document).on('change', '#chkBilling', function (e) {
    if ($(this).is(':checked')) {
        $("#txtSname").val($("#txtName").val().trim());
        $("#txtSemail").val($("#txtEmail").val().trim());
        $("#txtSmobile").val($("#txtmobile").val().trim());
        $("#textSaddress").val($("#textAddress").val().trim());
        $("#textScity").val($("#textCity").val().trim());
        $("#textSstate").val($("#textState").val().trim());
        $("#textSzipcode").val($("#textZipcode").val().trim());
    } else {

    }
});
function PlaceOrder() {
    var BName = $("#txtName").val().trim();
    var BEmail = $("#txtEmail").val().trim();
    var BMobile = $("#txtmobile").val().trim();
    var BAddress = $("#textAddress").val().trim();
    var BCity = $("#textCity").val().trim();
    var BState = $("#textState").val().trim();
    var BZipcode = $("#textZipcode").val().trim();
}