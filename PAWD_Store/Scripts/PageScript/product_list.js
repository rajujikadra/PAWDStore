var ThirdCategoryID = [];
var AllProductList_Category = [];
var Sub_cat_id;

$(document).ready(function () {

});
function Product_list_side_bar(data, AllProduct, Heading) {
    if (Heading != null) {
        if (Heading.Heading != null)
            $("#header").append(Heading.Heading);
        else
            $("#header").append("PAWD Store");
        if (Heading.Description != null)
            $("#Description").append(Heading.Description);
        else
            $("#Description").append("");

        var imageStr;
        if (Heading.Page_Image_Name != null)
            imageStr = "../SubCategoryHeaderImage/" + Heading.Page_Image_Name;
        else
            imageStr = "../ProductImage/No_Image_Available.png";
        $('.ms-hero-img-city2').css('background-image', 'url(' + imageStr + ')');
    }

    AllProductList_Category = AllProduct;
    Sub_cat_id = data[0].SubCategory_ID;
    var Side_string = "";
    Side_string += '<div class="card card-primary">' +
        '<div class="card-header"><h3 class="card-title">' + data[0].Category_Name + '</h3></div>' +
        '<div class="card-body">' +
        '<h4 class="mb-1 no-mt">' + data[0].SubCategory_Name + '</h4>' +
        '<div class="form-group no-mt">';
    for (var i = 0; i < data.length; i++) {
        Side_string += '<div class="checkbox">' +
            '<label>' +
            '<input type="checkbox" onclick="GetProduct(\'' + data[i].ThirdCategory_ID + '\',\'' + data[i].ThirdCategory_Name + '\')" value="" id="' + data[i].ThirdCategory_ID + '">' +
            data[i].ThirdCategory_Name +
            '</label>' +
            '</div>';
    }
    Side_string += '</div></div></div>';
    $("#SideBar").append(Side_string);
    BindAllProducts(AllProductList_Category);
}

function Product_list_side_bar_only_category(data, AllProduct, Heading) {
    if (Heading != null) {
        if (Heading.Heading != null)
            $("#header").append(Heading.Heading);
        else
            $("#header").append("PAWD Store");
        if (Heading.Description != null)
            $("#Description").append(Heading.Description);
        else
            $("#Description").append("");
        var imageStr;
        if (Heading.Page_Image_Name != null)
            imageStr = "../SubCategoryHeaderImage/" + Heading.Page_Image_Name;
        else
            imageStr = "../ProductImage/No_Image_Available.png";
        $('.ms-hero-img-city2').css('background-image', 'url(' + imageStr + ')');
    }

    AllProductList_Category = AllProduct;
    var Side_string = "";
    Side_string += '<div class="card card-primary">' +
        '<div class="card-header"><h3 class="card-title">' + data.Category_Name + '</h3></div>' +
        '<div class="card-body">' +
        '<h4 class="mb-1 no-mt">' + data.SubCategory_Name + '</h4>' +
        '<div class="form-group no-mt">';

    Side_string += '</div></div></div>';
    $("#SideBar").append(Side_string);
    BindAllProducts(AllProductList_Category);
}

function GetProduct(ID, Name) {
    var status = $('#' + ID).prop('checked');
    if (status == true) {
        ThirdCategoryID.push(ID);
    } else {
        const index = ThirdCategoryID.indexOf(ID);
        ThirdCategoryID.splice(index, 1);
    }
    var obj = {
        "ThirdCategoryID": ThirdCategoryID,
        "Sub_cat_id": Sub_cat_id
    }
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/ProductList.aspx/GetProductByThirdCategory",
        data: JSON.stringify(obj),
        dataType: "json",
        success: function (res) {
            var Alldata = JSON.parse(res.d);
            $("#Bind_all_products").empty();
            BindSerachingProducts(Alldata);
        },
        error: function (xhr, status, err) {
        }
    });
}

function BindAllProducts(data) {
    var All_product_string = "";
    for (var i = 0; i < data.length; i++) {
        All_product_string += '<div class="col-xl-4 col-md-6 mix">' +
            '<div class="card ms-feature">' +
            '<div class="card-body text-center">' +
            '<a href="product?ID=' + data[i].Product_ID + '" class="product_box">';
        if (data[i].Image_name != null) {
            All_product_string += '<img src="../ProductImage/' + data[i].Image_name + '" alt="' + data[i].Image_name.split('.')[0] + '" class="img-fluid center-block">';
        } else {
            All_product_string += '<img src="../ProductImage/No_Image_Available.png" alt="No_Image_Available" class="img-fluid center-block">';
        }

        All_product_string += '</a>' +
            '<h4 class="text-normal text-center product_title">' + data[i].Product_Title + '</h4>' +
            '<p class="short_description">' + data[i].Product_short_description + '</p>' +
            '<div class="mt-2">' +
            '<span class="ms-tag ms-tag-success" style="font-size: 20px;">₹ ' + addCommas(data[i].Product_Price) + '</span>' +
            '</div>' +
            '<a href="javascript:void(0)" onclick="AddToCart(\'' + data[i].Product_Title + '\',\'' + data[i].Product_ID + '\',\'' + data[i].SubCategory_Name + '\')"  class="btn btn-primary btn-sm btn-block btn-raised mt-2 no-mb">' +
            ' <i class="fa fa-shopping-cart"></i>Add to Cart</a>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '</div>';
    }
    $("#Bind_all_products").append(All_product_string);
}

function bufferToBase64(buf) {
    var binstr = Array.prototype.map.call(buf, function (ch) {
        return String.fromCharCode(ch);
    }).join('');
    return btoa(binstr);
}


function BindSerachingProducts(data) {
    var All_product_string = "";
    for (var i = 0; i < data.length; i++) {
        
        All_product_string += '<div class="col-xl-4 col-md-6 mix">' +
            '<div class="card ms-feature">' +
            '<div class="card-body text-center">' +
            '<a href="product?ID=' + data[i].Product_ID + '" class="product_box">';
        if (data[i].Image_name != null) {
            All_product_string += '<img src="../ProductImage/' + data[i].Image_name + '" alt="' + data[i].Image_name.split('.')[0]+'" class="img-fluid center-block">';
        } else {
            All_product_string += '<img src="../ProductImage/No_Image_Available.png" alt="" class="img-fluid center-block">';
        }
        All_product_string += '</a>' +
            '<h4 class="text-normal text-center product_title">' + data[i].Product_Title + '</h4>' +
            '<p class="short_description">' + data[i].Product_short_description + '</p>' +
            '<div class="mt-2">' +
            '<span class="ms-tag ms-tag-success" style="font-size: 20px;">₹ ' + addCommas(data[i].Product_Price) + '</span>' +
            '</div>' +
            '<a href="javascript:void(0)" onclick="AddToCart(\'' + data[i].Product_Title + '\',\'' + data[i].Product_ID + '\',\'' + data[i].SubCategory_Name + '\')"  class="btn btn-primary btn-sm btn-block btn-raised mt-2 no-mb">' +
            ' <i class="fa fa-shopping-cart"></i>Add To Cart</a>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '</div>';
    }
    $("#Bind_all_products").append(All_product_string);
}
