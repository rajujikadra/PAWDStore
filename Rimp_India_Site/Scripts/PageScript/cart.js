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
                CartStr += '<div class="text-center"><i class="glyphicon glyphicon-shopping-cart color-primary" style="font-size: 77px;"></i><h1>Your cart is currently empty</h1>';
                CartStr += '<p class="lead lead-lg">Before proceed to checkout you must add some products to your shopping cart.<br>You will find a lot of interesting products on our "Shop" page.</p>';
                CartStr += '<a href="/home" class="btn btn-raised btn-white color-primary"><i class="fa fa-product-hunt"></i>Start Shopping</a>';
                CartStr += '</div>';
            } else {
                for (var i = 0; i < Item.length; i++) {
                    CartStr += '<div class="card mb-1">';
                    CartStr += '<table class="table table-responsive table-no-border vertical-center">';
                    CartStr += '<tr>';
                    CartStr += '<td class="d-none d-sm-block"><img class="ImageClass" src="../ProductImage/' + Item[i].ProductImage + '" alt=""  onError="imgError(this);"/></td>';
                    CartStr += '<td style="width: 305px;"><h4 class="">' + Item[i].Product_Title + '</h4></td>';
                    CartStr += '<td><div class="form-inline input-number"><input type="text" class="form-control form-control-number" value="' + Item[i].Quantity + '" /></div></td>';
                    CartStr += '<td><span class="color-primary">₹ ' + addCommas(Item[i].Product_Price) + '</span></td>';
                    CartStr += '<td class="d-none d-sm-block">';
                    CartStr += '<button type="button" class="btn btn-danger" onclick="DeleteCartItem(\'' + Item[i].Product_Title + '\',\'' + Item[i].Cart_ID + '\');"><i class="zmdi zmdi-delete"></i>Remove</button>';
                    CartStr += '</td>';
                    CartStr += '</tr>';
                    CartStr += '</table>'
                    CartStr += '</div>';
                }
            }
            $("#CartDiv").empty();
            $("#CartDiv").append(CartStr);
        },
        error: function (response) {
            IsValid = false;
        }
    });
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