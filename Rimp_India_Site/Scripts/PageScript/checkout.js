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
                    CheckoutStr += '<tr><td style="width: 255px;" title="' + Item[i].Product_Title + '">' + Item[i].Product_Title + '</td><td>₹ ' + addCommas(Item[i].Product_Price * Item[i].Quantity) + '</td></tr>';
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

        $("#SNameDiv").removeClass("has-error is-focused");
        $("#SEmailDiv").removeClass("has-error is-focused");
        $("#SMobileDiv").removeClass("has-error is-focused");
        $("#SAddressDiv").removeClass("has-error is-focused");
        $("#SCityDiv").removeClass("has-error is-focused");
        $("#SStateDiv").removeClass("has-error is-focused");
        $("#SZipcodeDiv").removeClass("has-error is-focused");


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
    var flage = true;
    var BName = $("#txtName").val().trim();
    var BEmail = $("#txtEmail").val().trim();
    var BMobile = $("#txtmobile").val().trim();
    var BAddress = $("#textAddress").val().trim();
    var BCity = $("#textCity").val().trim();
    var BState = $("#textState").val().trim();
    var BZipcode = $("#textZipcode").val().trim();

    var IsShippindAddress = $("#chkBilling").is(':checked');

    var SName = $("#txtSname").val().trim();
    var SEmail = $("#txtSemail").val().trim();
    var SMobile = $("#txtSmobile").val().trim();
    var SAddress = $("#txtSaddress").val().trim();
    var SCity = $("#textScity").val().trim();
    var SState = $("#textSstate").val().trim();
    var SZipcode = $("#textSzipcode").val().trim();

    if (BName == "" || BName == undefined || BName == null) {
        flage = false;
        $("#BNameDiv").addClass("has-error is-focused");
    }
    if (BEmail == "" || BEmail == undefined || BEmail == null) {
        flage = false;
        $("#BEmailDiv").addClass("has-error is-focused");
    }
    if (BMobile == "" || BMobile == undefined || BMobile == null) {
        flage = false;
        $("#BMobileDiv").addClass("has-error is-focused");
    }
    if (BAddress == "" || BAddress == undefined || BAddress == null) {
        flage = false;
        $("#BAddressDiv").addClass("has-error is-focused");
    }
    if (BCity == "" || BCity == undefined || BCity == null) {
        flage = false;
        $("#BCityDiv").addClass("has-error is-focused");
    }
    if (BState == "" || BState == undefined || BState == null) {
        flage = false;
        $("#BStateDiv").addClass("has-error is-focused");
    }
    if (BZipcode == "" || BZipcode == undefined || BZipcode == null) {
        flage = false;
        $("#BZipcodeDiv").addClass("has-error is-focused");
    }
    if (!IsShippindAddress) {
        if (SName == "" || SName == undefined || SName == null) {
            flage = false;
            $("#SNameDiv").addClass("has-error is-focused");
        } else
            $("#SNameDiv").removeClass("has-error is-focused");

        if (SEmail == "" || SEmail == undefined || SEmail == null) {
            flage = false;
            $("#SEmailDiv").addClass("has-error is-focused");
        }
        else
            $("#SEmailDiv").removeClass("has-error is-focused");

        if (SMobile == "" || SMobile == undefined || SMobile == null) {
            flage = false;
            $("#SMobileDiv").addClass("has-error is-focused");
        }
        else
            $("#SMobileDiv").removeClass("has-error is-focused");

        if (SAddress == "" || SAddress == undefined || SAddress == null) {
            flage = false;
            $("#SAddressDiv").addClass("has-error is-focused");
        } else
            $("#SAddressDiv").removeClass("has-error is-focused");

        if (SCity == "" || SCity == undefined || SCity == null) {
            flage = false;
            $("#SCityDiv").addClass("has-error is-focused");
        }
        else
            $("#SCityDiv").removeClass("has-error is-focused");

        if (SState == "" || SState == undefined || SState == null) {
            flage = false;
            $("#SStateDiv").addClass("has-error is-focused");
        }
        else
            $("#SStateDiv").removeClass("has-error is-focused");

        if (SZipcode == "" || SZipcode == undefined || SZipcode == null) {
            flage = false;
            $("#SZipcodeDiv").addClass("has-error is-focused");
        } else
            $("#SZipcodeDiv").removeClass("has-error is-focused");
    }
    if (flage) {
        if ($("input:radio[name=paymentMethod]:checked").length === 0) {
            swal("Warning", "Please select payment method.", "warning");
        } else {
            debugger;
            var obj = {
                BName: BName,
                BEmail: BEmail,
                BMobile: BMobile,
                BAddress: BAddress,
                BCity: BCity,
                BState: BState,
                BZipcode: BZipcode,
                IsShippindAddress: IsShippindAddress,
                SName: SName,
                SEmail: SEmail,
                SMobile: SMobile,
                SAddress: SAddress,
                SCity: SCity,
                SState: SState,
                SZipcode: SZipcode,
                paymentMethod: $("input[name='paymentMethod']:checked").val(),
                User_Address_ID: 0
            };
            $.ajax({
                async: false,
                type: "POST",
                url: "/WebPages/Checkout.aspx/PlaceOrder",
                data: JSON.stringify({ model: obj }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var ID = JSON.parse(result.d);
                    if (ID > 0) {
                        location.href = "/order_details?ID=" + ID;
                    }
                },
                error: function (response) {
                    swal("Error", "Opps! Some error", "error");
                }
            });
        }
    }
}