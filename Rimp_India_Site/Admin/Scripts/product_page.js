var ProductMode;
var flage = true;
var Edit_ProductID;
var Delete_ProductID;

$(document).ready(function () {
    get_all_products();
    get_all_category();
})

function SetMode() {
    ProductMode = "add";
    $("#DrdSubCat").prop("disabled", true);
    $("#DrdThirdCat").prop("disabled", true);
}

function get_all_products() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/GetProducts",
        dataType: "json",
        success: function (res) {
            var AllProduct = JSON.parse(res.d);
            if (AllProduct != null && AllProduct != undefined) {
                var table = $('#ProductTable').DataTable()
                table.destroy();
                $('#ProductTable').DataTable({
                    data: AllProduct,
                    "iDisplayLength": 5,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Product_Title" },
                        { data: "Category_Name" },
                        { data: "SubCategory_Name" },
                        { data: "ThirdCategory_Name" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditProduct(' + data.Product_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteProduct(' + data.Product_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                            },
                            "orderable": false
                        },
                        {
                            data: function (data, type, row) {
                                return '<a href="product_images?ID=' + data.Product_ID + '" class="btn btn-outline-success btn-sm"><i class="fa fa-magic"></i>&nbsp; Images</a>'
                            },
                            "orderable": false
                        },
                        {
                            data: function (data, type, row) {
                                return '<a href="product_editor?ID=' + data.Product_ID + '" class="btn btn-outline-success btn-sm"><i class="fa fa-magic"></i>&nbsp; CK_Editor</a>'
                            },
                            "orderable": false
                        },
                        {
                            data: function (data, type, row) {
                                return '<a href="product_specification?ID=' + data.Product_ID + '" class="btn btn-outline-success btn-sm" ><i class="fa fa-magic"></i>&nbsp; Spec_Group</a>'
                            },
                            "orderable": false
                        },
                        {
                            render: function (data, type, row) {
                                if (row.IsHotProduct == true) {
                                    return '<input type="checkbox" onclick="ClickHotProduct(' + row.Product_ID + ')" checked="' + row.IsHotProduct + '" id="' + row.Product_ID + '" />';
                                } else {
                                    return '<input type="checkbox" onclick="ClickHotProduct(' + row.Product_ID + ')" id="' + row.Product_ID + '" />';
                                }
                            },
                            "orderable": false,
                        },
                    ],
                });
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ClickHotProduct(ProductID) {
    var value = $("#" + ProductID).prop("checked");
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/add_hot_product",
        data: JSON.stringify(
            {
                "ProductID": ProductID,
                "value": value
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            toastr.success(status);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function EditProduct(Product_ID) {
    ProductMode = "edit";
    Edit_ProductID = Product_ID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/GetProductByID",
        data: JSON.stringify(
            {
                "PID": Edit_ProductID
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                $("#txtProTitle").val(status.Product_Title);
                $("#txtProShotDesc").val(status.Product_short_description);
                $("#txtProLongDesc").val(status.Product_long_description);
                $("#DrdCat").val(status.Category_ID);
                $("#DrdCat option:selected").text(status.Category_Name)
                ChangeCategory();
                $("#DrdSubCat").val(status.SubCategory_ID);
                $("#DrdSubCat option:selected").text(status.SubCategory_Name)
                ChangeSubCategory();
                if (status.ThirdCategory_ID != null) {
                    $("#DrdThirdCat").val(status.ThirdCategory_ID);
                    $("#DrdThirdCat option:selected").text(status.ThirdCategory_Name)
                }
                $("#txtProPrice").val(status.Product_Price);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteProduct(Product_ID) {
    Delete_ProductID = Product_ID;
}

function ConfirmDeleteProduct() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/DeleteProduct",
        data: JSON.stringify(
            {
                "Delete_ProductID": Delete_ProductID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status == "success") {
                get_all_products();
                ClearModal();
                $("#btndeletemenu").attr("data-dismiss", "modal");
                toastr.success("Successfully Deleted !!!")
            } else {
                toastr.error("Opps some problecm occured.")
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function InsertProduct() {
    $(".sufee-alert").hide();
    var Title = $("#txtProTitle").val();
    var Short_decription = $("#txtProShotDesc").val();
    var Long_description = $("#txtProLongDesc").val();
    var Category = $("#DrdCat").val();
    var Sub_category = $("#DrdSubCat").val();
    var Third_category = $("#DrdThirdCat").val();
    var Price = $("#txtProPrice").val();


    if (Title == undefined || Title == "") {
        $('#ErrorMsgProTitle').show();
        flage = false;
    }
    if (Short_decription == undefined || Short_decription == "") {
        $('#ErrorMsgProShortDesc').show();
        flage = false;
    }
    if (Category == undefined || Category == "") {
        $('#ErrorMsgCatDrp').show();
        flage = false;
    }
    if (Sub_category == undefined || Sub_category == "") {
        $('#ErrorMsgSubCatDrp').show();
        flage = false;
    }
    //DrdThirdCat
    if (Third_category == undefined || Third_category == "") {
        $('#ErrorMsgThirdCatDrp').show();
        flage = false;
    }
    if (Price == undefined || Price == "") {
        $('#ErrorMsgProPrice').show();
        flage = false;
    }
    if (flage) {
        if (ProductMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Product.aspx/AddProducts",
                data: JSON.stringify(
                    {
                        "Title": Title,
                        "Short_decription": Short_decription,
                        "Long_description": Long_description,
                        "Category": parseInt(Category),
                        "Sub_category": parseInt(Sub_category),
                        "Third_category": Third_category == "" ? 0 : Third_category,
                        "Price": Price
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_products();
                        ClearModal();
                        $("#btnInsertSubCat").attr("data-dismiss", "modal");
                        toastr.success("Successfully Inserted !!!")
                    } else {
                        toastr.error("Opps some problecm occured.")
                    }
                },
                error: function (xhr, status, err) {
                    toastr.error(xhr.responseJSON.Message);
                }
            });
        } else {

            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Product.aspx/UpdateProducts",
                data: JSON.stringify(
                    {
                        "ProductID": Edit_ProductID,
                        "Title": Title,
                        "Short_decription": Short_decription,
                        "Long_description": Long_description,
                        "Category": parseInt(Category),
                        "Sub_category": parseInt(Sub_category),
                        "Third_category": Third_category == "" ? 0 : Third_category,
                        "Price": Price
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_products();
                        ClearModal();
                        $("#btnInsertSubCat").attr("data-dismiss", "modal");
                        toastr.success("Successfully Updated !!!")
                    } else {
                        toastr.error("Opps some problecm occured.")
                    }
                },
                error: function (xhr, status, err) {
                    toastr.error(xhr.responseJSON.Message);
                }
            });
        }
    }
    else {
        flage = true;
    }
}

function get_all_category() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/GetAllCategory",
        dataType: "json",
        success: function (res) {
            var AllMenus = JSON.parse(res.d);
            if (AllMenus != null && AllMenus != undefined) {
                for (i = 0; i < AllMenus.length; i++) {
                    $("#DrdCat").append($("<option></option>").val(AllMenus[i].Category_ID).html(AllMenus[i].Category_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ChangeCategory() {
    var CategoryID = $("#DrdCat").val();
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/GetSubCatByCatID",
        data: JSON.stringify(
            {
                "Category_ID": CategoryID
            }),
        dataType: "json",
        success: function (res) {
            var AllSubCat = JSON.parse(res.d);
            if (AllSubCat.length > 0) {
                $("#DrdSubCat").empty();
                $("#DrdSubCat").append($("<option></option>").val("").html("--Select sub category--"));
                for (i = 0; i < AllSubCat.length; i++) {
                    $("#DrdSubCat").append($("<option></option>").val(AllSubCat[i].SubCategory_ID).html(AllSubCat[i].SubCategory_Name));
                }
                $("#DrdSubCat").prop("disabled", false);
            }
            else {
                $("#DrdSubCat").empty();
                $("#DrdSubCat").prop("disabled", true);
                $("#DrdSubCat").append($("<option></option>").val("").html("--Select sub category--"));
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ChangeSubCategory() {
    var SubCategoryID = $("#DrdSubCat").val();
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product.aspx/GetThirdCatBySubCatID",
        data: JSON.stringify(
            {
                "SubCategory_ID": SubCategoryID
            }),
        dataType: "json",
        success: function (res) {
            var AllThirdCat = JSON.parse(res.d);
            if (AllThirdCat.length > 0) {
                $("#DrdThirdCat").empty();
                $("#DrdThirdCat").append($("<option></option>").val("").html("--Select third category--"));
                for (i = 0; i < AllThirdCat.length; i++) {
                    $("#DrdThirdCat").append($("<option></option>").val(AllThirdCat[i].ThirdCategory_ID).html(AllThirdCat[i].ThirdCategory_Name));
                }
                $("#DrdThirdCat").prop("disabled", false);
            }
            else {
                $("#DrdThirdCat").empty();
                $("#DrdThirdCat").prop("disabled", true);
                $("#DrdThirdCat").append($("<option></option>").val("").html("--Select third category--"));
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function isNumberKey(evt, obj) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    var value = obj.value;
    var dotcontains = value.indexOf(".") != -1;
    if (dotcontains)
        if (charCode == 46) return false;
    if (charCode == 46) return true;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function ClearModal() {
    $(".sufee-alert").hide();
    $("#txtProTitle").val("");
    $("#txtProShotDesc").val("");
    $("#txtProLongDesc").val("");
    $("#DrdCat").val("");
    $("#DrdSubCat").val("");
    $("#DrdThirdCat").val("");
    $("#txtProPrice").val("");

}