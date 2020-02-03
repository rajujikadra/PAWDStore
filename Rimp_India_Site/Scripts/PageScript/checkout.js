$(document).ready(function () {
    GetCheckoutItems();
});
function GetCheckoutItems() {
    $.ajax({
        async: false,
        type: "POST",
        url: "/WebPages/Cart.aspx/GetAllCartItems",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var Item = JSON.parse(result.d);
            var CheckoutStr = "";
            if (Item.length == 0) {

            } else {
                var SubTotal = 0;
                for (var i = 0; i < Item.length; i++) {
                    SubTotal = SubTotal + Item[i].Product_Price * Item[i].Quantity;
                    CheckoutStr += '<tr><td style="width: 255px;" title="' + Item[i].Product_Title +'">' + Item[i].Product_Title + '</td><td>₹ ' + addCommas(Item[i].Product_Price * Item[i].Quantity) + '</td></tr>';
                }
                var Tax = 0;
                var Shipping = 0;
                if (SubTotal < 1000 && SubTotal > 0)
                    Tax = 30;
                else if (SubTotal < 5000 && SubTotal > 1001)
                    Tax = 35;
                else if (SubTotal < 10000 && SubTotal > 5001)
                    Tax = 40;
                else
                    Tax = 50;

                if (SubTotal < 1000 && SubTotal > 0)
                    Shipping = 35;
                else if (SubTotal < 5000 && SubTotal > 1001)
                    Shipping = 40;
                else if (SubTotal < 10000 && SubTotal > 5001)
                    Shipping = 45;
                else
                    Shipping = 50;
                CheckoutStr += '<tr><td>Tax</td><td>₹ ' + Tax + '</td></tr>';
                CheckoutStr += '<tr><td>Shipping costs</td><td>₹ ' + Shipping + '</td></tr>';
                var GrandTotal = (SubTotal + Tax + Shipping);
                CheckoutStr += '<tr class="primary"><td class="text-primary">Total</td><td class="text-primary">₹ ' + addCommas(GrandTotal) + '</td></tr>';
              
            }
            $("#tblCheckout tbody").empty();
            $("#tblCheckout tbody").append(CheckoutStr);
        },
        error: function (response) {
            IsValid = false;
        }
    });
}

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
        $("#txtSname").attr('disabled', true);
        $("#txtSemail").attr('disabled', true);
        $("#txtSmobile").attr('disabled', true);
        $("#textSaddress").attr('disabled', true);
        $("#textScity").attr('disabled', true);
        $("#textSstate").attr('disabled', true);
        $("#textSzipcode").attr('disabled', true);
    } else {
        $("#txtSname").attr('disabled', false);
        $("#txtSemail").attr('disabled', false);
        $("#txtSmobile").attr('disabled', false);
        $("#textSaddress").attr('disabled', false);
        $("#textScity").attr('disabled', false);
        $("#textSstate").attr('disabled', false);
        $("#textSzipcode").attr('disabled', false);
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