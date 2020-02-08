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
            var CartStr = "";

            if (Item.length == 0) {
                $("#PriceDiv").css('display', 'none');
                $("#BtnShoppingDiv").css('display', 'none');
                $("#CartDiv").removeClass('col-md-9').addClass('col-md-12');
                CartStr += '<div class="text-center"><i class="glyphicon glyphicon-shopping-cart color-primary" style="font-size: 77px;"></i><h1>Your cart is currently empty</h1>';
                CartStr += '<p class="lead lead-lg">Before proceed to checkout you must add some products to your shopping cart.<br>You will find a lot of interesting products on our "Shop" page.</p>';
                CartStr += '<a href="/home" class="btn btn-raised btn-white color-primary"><i class="fa fa-product-hunt"></i>Start Shopping</a>';
                CartStr += '</div>';
            } else {
                var SubTotal = 0;
                for (var i = 0; i < Item.length; i++) {
                    SubTotal = SubTotal + Item[i].Product_Price * Item[i].Quantity;
                    CartStr += '<div class="card mb-1">';
                    CartStr += '<table class="table table-responsive table-no-border vertical-center">';
                    CartStr += '<tr>';
                    CartStr += '<td class="d-none d-sm-block"><img class="ImageClass" src="../ProductImage/' + Item[i].ProductImage + '" alt=""  onError="imgError(this);"/></td>';
                    CartStr += '<td style="width: 305px;"><h4 class=""><a target="_blank" href="product?ID=' + Item[i].Product_ID + '">' + Item[i].Product_Title + '</a></h4>';
                    if (Item[i].Size != "" && Item[i].Size != null && Item[i].Size != undefined) {
                        CartStr += '<br /><p>Size : ' + Item[i].Size + '</p>'
                    }
                    CartStr += '</td>';
                    CartStr += '<td><div class="form-inline input-number"><input type="text" onchange="UpdateQuantity(this,\'' + Item[i].Quantity + '\',\'' + Item[i].Cart_ID + '\')" onkeypress="return isNumberOrNot(event)" class="form-control form-control-number" value="' + Item[i].Quantity + '" /></div></td>';
                    CartStr += '<td><span class="color-primary">₹ ' + addCommas(Item[i].Product_Price * Item[i].Quantity) + '</span></td>';
                    CartStr += '<td class="d-none d-sm-block">';
                    CartStr += '<button type="button" class="btn btn-danger" onclick="DeleteCartItem(\'' + Item[i].Product_Title + '\',\'' + Item[i].Cart_ID + '\');"><i class="zmdi zmdi-delete"></i>Remove</button>';
                    CartStr += '</td>';
                    CartStr += '</tr>';
                    CartStr += '</table>'
                    CartStr += '</div>';
                }
                $("#txtSubTotal").empty().append('<strong>Sub Total: </strong>₹ ' + addCommas(SubTotal) + '</li>');
                $("#PriceDiv").css('display', 'block');
                $("#BtnShoppingDiv").css('display', 'block');
                //var TaxArray = [30, 35, 40, 45, 50, 55];
                //var ShippigArray = [20, 25, 30, 35, 40];
                //var Tax = TaxArray[Math.floor(Math.random() * TaxArray.length)];
                //var Shipping = ShippigArray[Math.floor(Math.random() * ShippigArray.length)];
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
                $("#txtTax").empty().append('<strong>Tax: </strong>₹ ' + Tax + '</li>');
                $("#txtShippingCosts").empty().append('<strong>Shipping costs: </strong><span class="color-warning">₹ ' + Shipping + '</span>');
                var GrandTotal = (SubTotal + Tax + Shipping);
                $("#txtTotal").empty().append('<strong>Total:</strong><span class="color-primary">₹ ' + addCommas(GrandTotal) + '</span>');
            }
            $("#CartDiv").empty();
            $("#CartDiv").append(CartStr);
        },
        error: function (response) {
            IsValid = false;
        }
    });
}
function isNumberOrNot(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function UpdateQuantity(e, old_qty, Cart_ID) {
    //alert(e.value + " " + Cart_ID);
    if (parseInt(e.value) > 0) {
        if (parseInt(e.value) < 11) {
            HoldOn.open();
            $.ajax({
                async: false,
                type: "POST",
                url: "/WebPages/Cart.aspx/UpdateQuantity",
                data: JSON.stringify({ Cart_ID: Cart_ID, Qty: e.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var staus = JSON.parse(result.d);
                    if (staus == true) {
                        GetCartItems();
                        GetCartItemCount();
                        HoldOn.close();
                        swal("Success", Product_Title + " has been successfully removed.", "success");
                    }
                },
                error: function (response) {
                    IsValid = false;
                }
            });
        } else {
            e.value = old_qty;
            swal("Error", "You can enter only maximum 10 quantity.", "error")
        }
    } else {
        e.value = old_qty;
        swal("Error", "You can't enter zero quantity.", "error");
    }
}
function DeleteCartItem(Product_Title, CartID) {
    swal({
        title: Product_Title,
        text: "Are you sure you want to remove this product in cart ?",
        icon: "warning",
        buttons: true,
        dangerMode: false
    }).then(function (willDelete) {
        if (willDelete) {
            HoldOn.open();
            $.ajax({
                async: false,
                type: "POST",
                url: "/WebPages/Cart.aspx/DeleteProductInCart",
                data: JSON.stringify({ Cart_ID: CartID }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var staus = JSON.parse(result.d);
                    if (staus == true) {
                        GetCartItems();
                        GetCartItemCount();
                        HoldOn.close();
                        swal("Success", Product_Title + " has been successfully removed.", "success");
                    }
                },
                error: function (response) {
                    IsValid = false;
                }
            });
        }
    });
}
