var ImageString;
var ImageName;
var ProductID;
var Product_image_mode;
var flage = true;
var all_pro_img = [];
var deleteProImg;
var editProImg;
var editImageString;
var editImageName;
var condition = "check";
$(document).ready(function () {

});
function SetMode() {
    Product_image_mode = "add";
}
function get_all_product_image_by_PID(P_image_list, PID) {
    ProductID = PID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/GetProduct_by_PID",
        data: JSON.stringify(
            {
                "PID": PID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                var table = $('#ProductImage').DataTable()
                table.destroy();
                $('#ProductImage').DataTable();
                $("#pro_title_image").html(status.Product_Title);
                $("#table_Heading").html(status.Product_Title + " Image List");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
    all_pro_img = P_image_list;
    var table = $('#ProductImage').DataTable()
    table.destroy();
    $('#ProductImage').DataTable({
        data: P_image_list,
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        retrieve: true,
        'paging': true,
        'sort': true,
        'searching': true,
        columns: [
            { data: "Product_Title" },
            { data: "Image_name" },
            {
                data: function (data, type, row) {
                    //var ImageBase64Data;
                    //if (condition == "click") {
                    //    ImageBase64Data = data.Product_image
                    //} else {
                    //    ImageBase64Data = bufferToBase64(data.Product_image);
                    //}
                    // return '<img id="' + data.Image_name + '" height="50" width="50" alt="" src="data:image/' + data.Image_name.split('.')[1] + ';base64,' + ImageBase64Data + '" />'
                    return '<img id="' + data.Image_name + '" height="50" width="50" alt="' + data.Image_name.split('.')[0] + '" src="../ProductImage/' + data.Image_name + '" />'

                },
                "orderable": false
            },
            {
                data: function (data, type, row) {
                    return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditProduct(' + data.Procut_image_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteProduct(' + data.Procut_image_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                },
                "orderable": false
            },
        ],
    });
}


function fnFileUpload(obj) {
    var indexvalue = $(obj).attr("index");
    if ($(obj)[0].value != "") {
        if ($(obj)[0].files.length > 0) {
            var selectedFile = $(obj)[0].files[0];
            var ext = selectedFile.name.split('.').pop();
            if (ext.toLowerCase() == "pdf" || ext.toLowerCase() == "jpeg" || ext.toLowerCase() == "png" || ext.toLowerCase() == "jpg" || ext.toLowerCase() == "gif") {
                if (selectedFile) {
                    if (selectedFile.size < 10485760) {
                        var reader = new FileReader();
                        var fileContent = "";
                        reader.onload = function (e) {
                            fileContent = reader.result;
                            var tempFileContent = fileContent.split(',');
                            if (tempFileContent.length > 0) {
                                ImageString = tempFileContent[tempFileContent.length - 1];
                                $("#P_Image").attr("src", "data:image/" + ImageName.split('.')[1] + ";base64," + ImageString);
                            }
                        }
                        ImageName = selectedFile.name;
                        reader.readAsDataURL(selectedFile);
                    }
                    else {
                        toastr.error("Please select file lower then 10mb.");
                    }
                }
            }
            else {
                toastr.error("Opps some problem are occurred.");
            }
        }
    }
}

function InsertProductImage() {
    $(".sufee-alert").hide();
    var Image_binary = ImageString;
    var Image_name = ImageName;

    if (Product_image_mode == "add") {
        if (Image_binary == undefined || Image_binary == "") {
            $('#ErrorMsgProImg').show();
            flage = false;
        }
    }

    if (flage) {
        if (Product_image_mode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/ProductImages.aspx/AddProductsImg",
                data: JSON.stringify(
                    {
                        "PID": ProductID,
                        "Image_binary": Image_binary,
                        "Image_name": Image_name
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        condition = "click";
                        get_all_image_by_PID(ProductID);
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
                url: "/Admin/Pages/ProductImages.aspx/UpdateProductsImg",
                data: JSON.stringify(
                    {
                        "Image_ID": editProImg,
                        "PID": ProductID,
                        "Image_binary": Image_binary == undefined ? "" : Image_binary,
                        "Image_name": Image_name == undefined ? editImageName : Image_name
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        condition = "click";
                        get_all_image_by_PID(ProductID);
                        ClearModal();
                        $("#btnInsertSubCat").attr("data-dismiss", "modal");
                        toastr.success("Successfully updated !!!")
                    } else {
                        toastr.error(status)
                    }
                },
                error: function (xhr, status, err) {
                    toastr.error(xhr.responseJSON.Message);
                }
            });
        }
    } else {
        flage = true;
    }
}

function get_all_image_by_PID(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/GetProductImageByID",
        data: JSON.stringify(
            {
                "PID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            get_all_product_image_by_PID(status, ProductID);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ClearModal() {
    $("#uploadImage").val("");
    ImageString = null;
    ImageName = null;
    $("#P_Image").attr("src", "");
}

function bufferToBase64(buf) {
    var binstr = Array.prototype.map.call(buf, function (ch) {
        return String.fromCharCode(ch);
    }).join('');
    return btoa(binstr);
}

function DeleteProduct(ID) {
    deleteProImg = ID;
}

function ConfirmDeleteProductImage() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/DeleteProductImage",
        data: JSON.stringify(
            {
                "P_img_id": deleteProImg,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status == "success") {
                $("#btndeletemenu").attr("data-dismiss", "modal");
                toastr.success("Successfully deleted");
                condition = "click";
                get_all_image_by_PID(ProductID);
            } else {
                toastr.error(status);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function EditProduct(ID) {
    Product_image_mode = "edit";
    editProImg = ID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/GetImageByID",
        data: JSON.stringify(
            {
                "P_img_id": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                $("#P_Image").attr("src", "../ProductImage/" + status.Image_name);
                editImageString = status.Product_image;
                editImageName = status.Image_name;
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
