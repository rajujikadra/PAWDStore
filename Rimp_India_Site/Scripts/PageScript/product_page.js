var all_spec_group = [];
$(document).ready(function () {

});

function Product_data_bind(product_data) {
    var bind_product_datas = "";
    if (product_data != null) {
        bind_product_datas += '<div class="card-body">' +
            ' <h2><b>' + product_data.Product_Title + '</b></h2>' +
            ' <h3><b>' + product_data.Product_short_description + '</b></h3>' +
            '<p>' + product_data.Product_long_description + '</p>' +
            '<ul class="list-unstyled">' +
            ' <li style="margin-top: 23px !important;">' +
            ' <h2 class="color-success no-m text-normal">₹ ' + addCommas(product_data.Product_Price) + '</h2>' +
            '</li>' +
            '<li style="margin-top: 26px !important;" class="mb-2">' +
            '<strong>Availability: </strong>' +
            ' <span class="ms-tag ms-tag-success">in stock</span>' +
            '</li>' +
            '</ul>' +
            ' <a href="javascript:void(0)" onclick="SendToSubcategoryPage(\'' + product_data.Product_Title + '\',\'' + product_data.Product_ID + '\')" class="btn btn-primary btn-block btn-raised mt-2 no-mb"><i class="fa fa-info"></i>Inquiry</a>' +
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
            if (all_spec_group.length > 0) {
                for (var i = 0; i < all_spec_group.length; i++) {
                    specification_string += '<table class="table table-no-border table-striped">' +
                        '<thead><tr><th style="color:#a92e09;">' + all_spec_group[i].Specification_Group_Name.toUpperCase() + '</th></tr></thead>';
                    for (var x = 0; x < status.length; x++) {
                        if (all_spec_group[i].Specification_Group_Name == status[x].Specification_Group_Name) {
                            specification_string += '<tbody><tr><td style="width: 50%;"><b>' + status[x].Specification_Title + '</b></td><td>' + status[x].Specification_Value + '</td></tr></tbody>';
                        }
                    }
                    specification_string += '</table>';
                }
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

