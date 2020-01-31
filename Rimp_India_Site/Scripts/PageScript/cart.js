$(document).ready(function () {
    GetCartItems();
});
function GetCartItems() {
    $.ajax({
        async: false,
        type: "POST",
        url: "/WebPages/Cart.aspx/GetAllCartItems",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var Item = JSON.parse(result.d);
            if (Item.length == 0) {

            } else {

            }
        },
        error: function (response) {
            IsValid = false;
        }
    });
}