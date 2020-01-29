var ProductID;
var all_product_ck_editor = [];
var product_ck_mode;
var flage = true;
var Edit_ck_ID;
var Delete_ck_ID;

$(document).ready(function () {
    //CKEDITOR.replace('txtProCkDesc');
});
function SetMode() {
    product_ck_mode = "add";
}
function get_all_product_ck_editor_by_PID(product_ck, PID) {
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
                var table = $('#Product_ck').DataTable()
                table.destroy();
                $('#Product_ck').DataTable();
                $("#pro_title_image").html(status.Product_Title);
                $("#table_Heading").html(status.Product_Title + " Editor List");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
    all_product_ck_editor = product_ck;
    var table = $('#Product_ck').DataTable()
    table.destroy();
    $('#Product_ck').DataTable({
        data: product_ck,
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        retrieve: true,
        'paging': true,
        'sort': true,
        'searching': true,
        columns: [
            { data: "Product_Title" },
            { data: "CK_Title" },
            {
                data: function (data, type, row) {
                    return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditProductCK(' + data.Product_CK_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteProductCK(' + data.Product_CK_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                },
                "orderable": false
            },
        ],
    })
}

function InsertProductCK() {
    $(".sufee-alert").hide();
    var CK_Title = $("#txtProCkTitle").val();
    //var Description = CKEDITOR.instances['txtProCkDesc'].getData();
    var Description = $("#txtProCkDesc").val();

    if (CK_Title == undefined || CK_Title == "") {
        $('#ErrorMsgProCkTitle').show();
        flage = false;
    }
    if (Description == undefined || Description == "") {
        $('#ErrorMsgProCkDesc').show();
        flage = false;
    }
    if (flage) {
        if (product_ck_mode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Product_CK_Editor.aspx/AddProductCK",
                data: JSON.stringify(
                    {
                        "PID": ProductID,
                        "CK_Title": CK_Title,
                        "Description": Description
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_CK_by_PID(ProductID);
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
                url: "/Admin/Pages/Product_CK_Editor.aspx/UpdateProductCK",
                data: JSON.stringify(
                    {
                        "Ck_ID": Edit_ck_ID,
                        "PID": ProductID,
                        "CK_Title": CK_Title,
                        "Description": Description
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_CK_by_PID(ProductID);
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
    } else {
        flage = true;
    }
}

function get_all_CK_by_PID(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_CK_Editor.aspx/GetCKByProID",
        data: JSON.stringify(
            {
                "PID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
                get_all_product_ck_editor_by_PID(status, ProductID);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ClearModal() {
    $(".sufee-alert").hide();
    $("#txtProCkTitle").val("");
    //CKEDITOR.instances['txtProCkDesc'].setData('');
    $("#txtProCkDesc").val("");
}

function EditProductCK(ID) {

    product_ck_mode = "edit";
    Edit_ck_ID = ID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_CK_Editor.aspx/GetCkbyCkID",
        data: JSON.stringify(
            {
                "Ck_ID": ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                $("#txtProCkTitle").val(status.CK_Title);
                //CKEDITOR.instances['txtProCkDesc'].setData(status.Description);
                $("#txtProCkDesc").val(status.Description);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteProductCK(CK_ID) {
    Delete_ck_ID = CK_ID;
}

function ConfirmDeleteProductCK() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_CK_Editor.aspx/DeleteProductCK",
        data: JSON.stringify(
            {
                "P_ck_id": Delete_ck_ID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status == "success") {
                $("#btndeletemenu").attr("data-dismiss", "modal");
                toastr.success("Successfully deleted");
                get_all_CK_by_PID(ProductID);
                ClearModal();
            } else {
                toastr.error(status);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}