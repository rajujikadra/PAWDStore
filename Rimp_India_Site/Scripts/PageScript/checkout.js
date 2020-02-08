var User_Address_ID = 0;
$(document).ready(function () {
    GetCheckoutItems();
    GetAllAddress();
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
            if (Item.length === 0) {
                location.href = "/home";
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
        $("#SNameDiv").removeClass("label-floating is-empty has-error");
        $("#SNameDiv").addClass("label-floating label-float");
        $("#txtSname").val($("#txtName").val());

        $("#SEmailDiv").removeClass("label-floating is-empty has-error");
        $("#SEmailDiv").addClass("label-floating label-float");
        $("#txtSemail").val($("#txtEmail").val());

        $("#SMobileDiv").removeClass("label-floating is-empty has-error");
        $("#SMobileDiv").addClass("label-floating label-float");
        $("#txtSmobile").val($("#txtmobile").val());

        $("#SAddressDiv").removeClass("label-floating is-empty has-error");
        $("#SAddressDiv").addClass("label-floating label-float");
        $("#txtSaddress").val($("#textAddress").val());

        $("#SCityDiv").removeClass("label-floating is-empty has-error");
        $("#SCityDiv").addClass("label-floating label-float");
        $("#textScity").val($("#textCity").val());

        $("#SStateDiv").removeClass("label-floating is-empty has-error");
        $("#SStateDiv").addClass("label-floating label-float");
        $("#textSstate").val($("#textState").val());

        $("#SZipcodeDiv").removeClass("label-floating is-empty has-error");
        $("#SZipcodeDiv").addClass("label-floating label-float");
        $("#textSzipcode").val($("#textZipcode").val());
    } else {
        $("#SNameDiv").removeClass("label-floating label-float");
        $("#SNameDiv").addClass("label-floating is-empty");
        $("#txtSname").val("");

        $("#SEmailDiv").removeClass("label-floating label-float");
        $("#SEmailDiv").addClass("label-floating is-empty");
        $("#txtSemail").val("");

        $("#SMobileDiv").removeClass("label-floating label-float");
        $("#SMobileDiv").addClass("label-floating is-empty");
        $("#txtSmobile").val("");

        $("#SAddressDiv").removeClass("label-floating label-float");
        $("#SAddressDiv").addClass("label-floating is-empty");
        $("#txtSaddress").val("");

        $("#SCityDiv").removeClass("label-floating label-float");
        $("#SCityDiv").addClass("label-floating is-empty");
        $("#textScity").val("");

        $("#SStateDiv").removeClass("label-floating label-float");
        $("#SStateDiv").addClass("label-floating is-empty");
        $("#textSstate").val("");

        $("#SZipcodeDiv").removeClass("label-floating label-float");
        $("#SZipcodeDiv").addClass("label-floating is-empty");
        $("#textSzipcode").val("");
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
                User_Address_ID: User_Address_ID
            };
            $.ajax({
                async: true,
                type: "POST",
                url: "/WebPages/Checkout.aspx/PlaceOrder",
                data: JSON.stringify({ model: obj }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    HoldOn.open();
                },
                success: function (result) {
                    var ID = JSON.parse(result.d);
                    HoldOn.close();
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

function GetAllAddress() {
    $.ajax({
        async: false,
        type: "POST",
        url: "/WebPages/Checkout.aspx/GetAllAddress",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var Item = JSON.parse(result.d);
            if (Item.length > 0) {
                var str = '';
                for (var i = 0; i < Item.length; i++) {
                    str += '<div class="col-md-4">';
                    str += '<div class="card card-success">';
                    str += '<div class="card-header"><h3 class="card-title">Address ' + i + '</h3></div>';
                    str += '<div class="card-body">';
                    str += '<table class="table table-no-border table-striped">';
                    str += '<tbody><tr><td style="width: 50%;"><b>Name </b></td><td>' + Item[i].BName + '</td></tr></tbody>';
                    str += '<tbody><tr><td style="width: 50%;"><b>Email </b></td><td>' + Item[i].BEmail + '</td></tr></tbody>';
                    str += '<tbody><tr><td style="width: 50%;"><b>Address </b></td><td>' + Item[i].BAddress + '</td></tr></tbody>';
                    str += '<tbody><tr><td style="width: 50%;"><b>Select Address </b></td><td> <div class="checkbox"><label><input type="checkbox" class="subject-list" value=' + Item[i].User_Address_ID + ' /></label></div></td></tr></tbody>';
                    str += '</table>';
                    str += '</div>';
                    str += '</div>';
                    str += '</div>';
                }
                //onchange="SelectAddress(this, \'' + Item[i].User_Address_ID + '\')"
                $("#addressDiv").empty();
                $("#addressDiv").append(str);
            } else {
                $("#addressDiv").css('display', 'none');
            }
        },
        error: function (response) {
            IsValid = false;
        }
    });
}

//function SelectAddress(obj, UserAddressID) {
//    if (obj.checked) {

//    }
//}
$(document).on('change', '.subject-list', function () {
    $('.subject-list').not(this).prop('checked', false);
    if (this.checked) {
        User_Address_ID = this.value;
        $.ajax({
            async: false,
            type: "POST",
            url: "/WebPages/Checkout.aspx/GetAddressByID",
            data: JSON.stringify({ User_Address_ID: this.value }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                var Item = JSON.parse(result.d);
                if (Item !== null) {
                    $("#BNameDiv").removeClass("label-floating is-empty has-error");
                    $("#BNameDiv").addClass("label-floating label-float");
                    $("#txtName").val(Item.BName);

                    $("#BEmailDiv").removeClass("label-floating is-empty has-error");
                    $("#BEmailDiv").addClass("label-floating label-float");
                    $("#txtEmail").val(Item.BEmail);

                    $("#BMobileDiv").removeClass("label-floating is-empty has-error");
                    $("#BMobileDiv").addClass("label-floating label-float");
                    $("#txtmobile").val(Item.BMobile);

                    $("#BAddressDiv").removeClass("label-floating is-empty has-error");
                    $("#BAddressDiv").addClass("label-floating label-float");
                    $("#textAddress").val(Item.BAddress);

                    $("#BCityDiv").removeClass("label-floating is-empty has-error");
                    $("#BCityDiv").addClass("label-floating label-float");
                    $("#textCity").val(Item.BCity);

                    $("#BStateDiv").removeClass("label-floating is-empty has-error");
                    $("#BStateDiv").addClass("label-floating label-float");
                    $("#textState").val(Item.BState);

                    $("#BZipcodeDiv").removeClass("label-floating is-empty has-error");
                    $("#BZipcodeDiv").addClass("label-floating label-float");
                    $("#textZipcode").val(Item.BZipcode);

                    //

                    $("#SNameDiv").removeClass("label-floating is-empty has-error");
                    $("#SNameDiv").addClass("label-floating label-float");
                    $("#txtSname").val(Item.SName);

                    $("#SEmailDiv").removeClass("label-floating is-empty has-error");
                    $("#SEmailDiv").addClass("label-floating label-float");
                    $("#txtSemail").val(Item.SEmail);

                    $("#SMobileDiv").removeClass("label-floating is-empty has-error");
                    $("#SMobileDiv").addClass("label-floating label-float");
                    $("#txtSmobile").val(Item.SMobile);

                    $("#SAddressDiv").removeClass("label-floating is-empty has-error");
                    $("#SAddressDiv").addClass("label-floating label-float");
                    $("#txtSaddress").val(Item.SAddress);

                    $("#SCityDiv").removeClass("label-floating is-empty has-error");
                    $("#SCityDiv").addClass("label-floating label-float");
                    $("#textScity").val(Item.SCity);

                    $("#SStateDiv").removeClass("label-floating is-empty has-error");
                    $("#SStateDiv").addClass("label-floating label-float");
                    $("#textSstate").val(Item.SState);

                    $("#SZipcodeDiv").removeClass("label-floating is-empty has-error");
                    $("#SZipcodeDiv").addClass("label-floating label-float");
                    $("#textSzipcode").val(Item.SZipcode);
                }
            },
            error: function (response) {
                IsValid = false;
            }
        });
    } else {
        User_Address_ID = 0;
        $("#BNameDiv").removeClass("label-floating label-float");
        $("#BNameDiv").addClass("label-floating is-empty");
        $("#txtName").val("");

        $("#BEmailDiv").removeClass("label-floating label-float");
        $("#BEmailDiv").addClass("label-floating is-empty");
        $("#txtEmail").val("");

        $("#BMobileDiv").removeClass("label-floating label-float");
        $("#BMobileDiv").addClass("label-floating is-empty");
        $("#txtmobile").val("");

        $("#BAddressDiv").removeClass("label-floating label-float");
        $("#BAddressDiv").addClass("label-floating is-empty");
        $("#textAddress").val("");

        $("#BCityDiv").removeClass("label-floating label-float");
        $("#BCityDiv").addClass("label-floating is-empty");
        $("#textCity").val("");

        $("#BStateDiv").removeClass("label-floating label-float");
        $("#BStateDiv").addClass("label-floating is-empty");
        $("#textState").val("");

        $("#BZipcodeDiv").removeClass("label-floating label-float");
        $("#BZipcodeDiv").addClass("label-floating is-empty");
        $("#textZipcode").val("");

        //
        $("#SNameDiv").removeClass("label-floating label-float");
        $("#SNameDiv").addClass("label-floating is-empty");
        $("#txtSname").val("");

        $("#SEmailDiv").removeClass("label-floating label-float");
        $("#SEmailDiv").addClass("label-floating is-empty");
        $("#txtSemail").val("");

        $("#SMobileDiv").removeClass("label-floating label-float");
        $("#SMobileDiv").addClass("label-floating is-empty");
        $("#txtSmobile").val("");

        $("#SAddressDiv").removeClass("label-floating label-float");
        $("#SAddressDiv").addClass("label-floating is-empty");
        $("#txtSaddress").val("");

        $("#SCityDiv").removeClass("label-floating label-float");
        $("#SCityDiv").addClass("label-floating is-empty");
        $("#textScity").val("");

        $("#SStateDiv").removeClass("label-floating label-float");
        $("#SStateDiv").addClass("label-floating is-empty");
        $("#textSstate").val("");

        $("#SZipcodeDiv").removeClass("label-floating label-float");
        $("#SZipcodeDiv").addClass("label-floating is-empty");
        $("#textSzipcode").val("");
    }
});