var all_spec_group = [];
$(document).ready(function () {

});

function Product_data_bind(product_data) {
    debugger;
    var bind_product_datas = "";
    if (product_data != null) {
        bind_product_datas += '<div class="card-body">' +
            ' <h2><b>' + product_data.Product_Title + '</b></h2>' +
            ' <h3><b>' + product_data.Product_short_description + '</b></h3>' +
            '<p>' + product_data.Product_long_description + '</p>' +
            '<ul class="list-unstyled">' +
            '<li><strong> Category: </strong > ' + product_data.ThirdCategory_Name + '</li>' +
            '<li>';
        debugger;
        if (product_data.SubCategory_Name.toLowerCase().includes('clothe')) {
            bind_product_datas += '<div class="form-group row">';
            bind_product_datas += '<strong>Select Size: </strong>';
            bind_product_datas += '<div class="col-lg-9" style="margin-top: -19px;">';
            bind_product_datas += '<select id="select_size" class="form-control selectpicker" data-dropup-auto="false">';
            bind_product_datas += '<option value="">-- Select Size --</option>';
            bind_product_datas += '<option value="S">S</option>';
            bind_product_datas += '<option value="M">M</option>';
            bind_product_datas += '<option value="L">L</option>';
            bind_product_datas += '<option value="XL">XL</option>';
            bind_product_datas += '<option  value="XXL">XXL</option>';
            bind_product_datas += '</select>';
            bind_product_datas += '<span id="msgSize" style="display:none; color: #f44336;">Please select size for your product</span>';
            bind_product_datas += '</div>';
            bind_product_datas += '</div>';
        }

        bind_product_datas += '<strong>Number of items: </strong><div class="form form-inline input-number">' +
            '<button onclick="DecreaseQty()" class="btn-circle btn-circle-primary btn-circle-xs" type="button"><i class="fa fa-minus"></i></button>' +
            '<input type="text" class="form-control form-control-number" pattern="[0-9]*"  onkeypress="return isNumberOrNot(event)" id="txtQuantity" value="1">' +
            '<button onclick="IncreaseQty()" class="btn-circle btn-circle-primary btn-circle-xs" type="button"><i class="fa fa-plus"></i></button>' +
            '</div>' +
            '</li>' +
            ' <li style="margin-top: 23px !important;">' +
            ' <h2 class="color-success no-m text-normal">₹ ' + addCommas(product_data.Product_Price) + '</h2>' +
            '</li>' +
            '<li style="margin-top: 26px !important;" class="mb-2">' +
            '<strong>Availability: </strong>' +
            ' <span class="ms-tag ms-tag-success">in stock</span>' +
            '</li>' +
            '</ul>' +
            ' <a href="javascript:void(0)" onclick="AddProductInCart(\'' + product_data.Product_Title + '\',\'' + product_data.Product_ID + '\',\'' + product_data.SubCategory_Name + '\')" class="btn btn-primary btn-block btn-raised mt-2 no-mb"><i class="fa fa-shopping-cart"></i>Add to cart</a>' +
            '</div>';
    }
    $("#bind_product_data").append(bind_product_datas);
    bind_images(product_data.Product_ID);
    bind_ck_details(product_data.Product_ID);
    get_all_group_by_pid(product_data.Product_ID);
    bind_specification(product_data.Product_ID);
}
function get_all_group_by_pid(productID) {

    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/ProductPage.aspx/Get_spec_all_group",
        data: JSON.stringify(
            {
                "PID": productID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            all_spec_group = status;
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function bind_ck_details(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/ProductPage.aspx/GetCkEditor",
        data: JSON.stringify(
            {
                "PID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status.length > 0) {
                var ck_string = "";
                for (var i = 0; i < status.length; i++) {
                    ck_string += '<div class="col-md-4">' +
                        '<div class="card ms-feature wow zoomInUp animation-delay-3">' +
                        '<div class="card-body text-center">' +
                        '<h4 class="text-normal text-center"><b>' + status[i].CK_Title + '</b></h4>' +
                        '<p style="height: 180px !important; overflow: hidden;">' + status[i].Description + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                }
                $("#bind_ck_editor").append(ck_string);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function bind_specification(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/ProductPage.aspx/GetSpecification",
        data: JSON.stringify(
            {
                "PID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            var specification_string = "";
            if (status.length > 0) {

                specification_string += '<table class="table table-no-border table-striped">' +
                    '<thead><tr><th style="color:#a92e09;"></th></tr></thead>';
                for (var x = 0; x < status.length; x++) {
                    specification_string += '<tbody><tr><td style="width: 50%;"><b>' + status[x].Specification_Title + '</b></td><td>' + status[x].Specification_Value + '</td></tr></tbody>';
                }
                specification_string += '</table>';
                $("#bind_product_specification").append(specification_string);
            } else {
                var empty_string = '<table class="table table-no-border table-striped"><thead><tr><th>NO SPECIFICATION AVAILABLE</th></tr></thead></table>';
                $("#bind_product_specification").append(empty_string);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function bind_images(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/ProductPage.aspx/GetImages",
        data: JSON.stringify(
            {
                "PID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status.length > 0) {
                var image_string = "";
                var image_string_1 = "";
                image_string += '<div class="carousel-item active" style="height: 351px;"><img id="mainImg" style="height: 100%; width: 78%; margin-left: 55px;" src="../ProductImage/' + status[0].Image_name + '"  alt="' + status[0].Image_name.split('.')[0] + '"></div>';

                $("#bind_image").append(image_string);
                image_string_1 += '<li id="' + status[0].Image_name + '" onclick="change_image(\'' + status[0].Image_name + '\')" style="height: 103px; width: 130px;" data-target="#carousel-product" data-slide-to="0" > <img src="../ProductImage/' + status[0].Image_name + '" style="height: 90%; width: 73%;" alt="' + status[0].Image_name.split('.')[0] + '"> </li>';
                for (var i = 1; i < status.length; i++) {
                    image_string_1 += ' <li id="' + status[i].Image_name + '" onclick="change_image(\'' + status[i].Image_name + '\')" style="height: 103px; width: 130px;" data-target="#carousel-product" data-slide-to="' + status[i].Procut_image_ID + '"><img src="../ProductImage/' + status[i].Image_name + '" style="height: 90%; width: 73%;" alt="' + status[i].Image_name.split('.')[0] + '"></li>';
                }
                $("#bind_small_image").append(image_string_1);
            } else {
                var string = '<div class="carousel-item active" style="height: 351px;"><img id="mainImg" style="height: 100%; width: 73%; margin-left: 55px;" src="https://vignette.wikia.nocookie.net/citrus/images/6/60/No_Image_Available.png/revision/latest?cb=20170129011325"  alt="..."></div>';
                $("#bind_image").append(string);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function change_image(imageName) {
    $("#mainImg").attr("src", "../ProductImage/" + imageName);
    $("#" + imageName).css('border-color', '#03a9f4');
    //border-color: #03a9f4;
}

function IncreaseQty() {
    var qty = $("#txtQuantity").val().trim();
    if (qty != "" && qty != undefined && qty != null) {
        $("#txtQuantity").val(parseInt(qty) + 1);
        if (parseInt($("#txtQuantity").val().trim()) > 10) {
            $("#txtQuantity").val(qty);
            swal("Error", "You can enter only maximum 10 quantity.", "error");
        }
    } else {
        $("#txtQuantity").val(1);
    }
}
function DecreaseQty() {
    var qty = $("#txtQuantity").val().trim();
    if (qty != "" && qty != undefined && qty != null) {
        $("#txtQuantity").val(parseInt(qty) - 1);
        if (parseInt($("#txtQuantity").val().trim()) <= 0) {
            $("#txtQuantity").val(qty);
            swal("Error", "You can't enter zero quantity.", "error");
        }
    } else {
        $("#txtQuantity").val(1);
    }
}
$(document).on('change', '#txtQuantity', function (e) {
    if (this.value != "" && this.value != null && this.value != undefined) {
        if (parseInt(this.value) > 0) {
            if (parseInt(this.value) > 10) {
                this.value = 1;
                swal("Error", "You can enter only maximum 10 quantity.", "error");
            }
        } else {
            this.value = 1;
            swal("Error", "You can't enter zero quantity.", "error");
        }
    } else
        this.value = 1;

});
function isNumberOrNot(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function AddProductInCart(Title, ProductID, SubCategory) {
    swal({
        title: Title,
        text: "Are you sure you want to add this product in cart ?",
        icon: "warning",
        buttons: true,
        dangerMode: false
    }).then(function (willDelete) {
        if (willDelete) {
            debugger;
            var size = "";
            if (SubCategory.toLowerCase().includes("clothe")) {
                if ($("#select_size").val() === "" || $("#select_size").val() === null || $("#select_size").val() === undefined) {
                    $("#msgSize").css('display', 'block');
                    $('html, body').animate({
                        scrollTop: $("#msgSize").parent().offset().top - 160
                    }, 500);
                    return false;
                }
                else {
                    size = $("#select_size").val().trim();
                }
            }
            HoldOn.open();
            $.ajax({
                async: false,
                type: "POST",
                url: "/Default.aspx/CheckUserLoginOrNot",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var status = JSON.parse(result.d);
                    if (status == true) {
                        $.ajax({
                            type: "POST",
                            url: "/Default.aspx/AddProductInCart",
                            data: JSON.stringify({
                                Product_ID: ProductID,
                                Qty: $("#txtQuantity").val(),
                                Size: size
                            }),
                            async: false,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                var CartItemCount = JSON.parse(result.d);
                                $("#CartItemCount").text(CartItemCount);
                                swal("Success", "Product has been added in cart", "success");
                                HoldOn.close();
                            },
                            error: function (response) {
                                IsValid = false;
                            }
                        });
                    } else {
                        location.href = '/login';
                    }
                },
                error: function (response) {
                    IsValid = false;
                }
            });
        }
    });
}


$(document).on('change', "#select_size", function () {
    if (this.value != "" && this.value != null && this.value != undefined) {
        $("#msgSize").css('display', 'none');
    }
    else {
        $("#msgSize").css('display', 'block');
    }
})