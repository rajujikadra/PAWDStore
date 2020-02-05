var Product_specification_mode;
var ProductID;
var AllSpecification = [];
var flage = true;
var EditProSpecID;
var DeleteProSpecID;
var Specification_group_id;

$(document).ready(function () {

});

function SetMode() {
    Product_specification_mode = "add";
}

function get_all_product_Specification_by_PID(P_specification_list, PID) {
    debugger;
    Specification_group_id = 0;
    ProductID = PID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/GetProduct_by_PID",
        data: JSON.stringify(
            {
                "PID": PID
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                var table = $('#Product_specification').DataTable()
                table.destroy();
                $('#Product_specification').DataTable();
                $("#pro_title_image").html(status.Product_Title);
                $("#table_Heading").html(status.Product_Title + " Specification List");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
    AllSpecification = P_specification_list;
    var table = $('#Product_specification').DataTable()
    table.destroy();
    $('#Product_specification').DataTable({
        data: P_specification_list,
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        retrieve: true,
        'paging': true,
        'sort': true,
        'searching': true,
        columns: [
            { data: "Specification_Title" },
            { data: "Specification_Value" },
            {
                data: function (data, type, row) {
                    return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditProductSpec(' + data.Product_Specification_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteProductSpec(' + data.Product_Specification_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                },
                "orderable": false
            },
        ],
    });
}

function InsertProductSpec() {
    $(".sufee-alert").hide();
    var Spec_title = $("#txtProSpecTitle").val();
    var Spec_value = $("#txtProSpecValue").val();
    if (Spec_title == undefined || Spec_title == "") {
        $('#ErrorMsgProSpecTitle').show();
        flage = false;
    }
    if (Spec_value == undefined || Spec_value == "") {
        $('#ErrorMsgProSpecValue').show();
        flage = false;
    }
    if (flage) {
        if (Product_specification_mode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Product_Specification.aspx/AddProductsSpec",
                data: JSON.stringify(
                    {
                        "Speec_grpID": Specification_group_id,
                        "PID": ProductID,
                        "Spec_title": Spec_title,
                        "Spec_value": Spec_value
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_spec_by_PID(ProductID);
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
                url: "/Admin/Pages/Product_Specification.aspx/UpdateProductsSpec",
                data: JSON.stringify(
                    {
                        "Pro_spec_id": EditProSpecID,
                        "Speec_grpID": Specification_group_id,
                        "PID": ProductID,
                        "Spec_title": Spec_title,
                        "Spec_value": Spec_value
                    }),
                dataType: "json",
                success: function (res) {
                    debugger;
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_spec_by_PID(ProductID);
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

function get_all_spec_by_PID(ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_Specification.aspx/GetProSpecByPID",
        data: JSON.stringify(
            {
                "Product_ID": ID
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            get_all_product_Specification_by_PID(status, ProductID);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function EditProductSpec(spec_id) {
    Product_specification_mode = "edit";
    EditProSpecID = spec_id;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_Specification.aspx/GetSpecByID",
        data: JSON.stringify(
            {
                "Spec_ID": spec_id,
            }),
        dataType: "json",
        success: function (res) {
            debugger;
            var status = JSON.parse(res.d);
            ProductID = status.Product_ID;
            if (status != null) {
                $("#txtProSpecTitle").val(status.Specification_Title);
                $("#txtProSpecValue").val(status.Specification_Value);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function DeleteProductSpec(ID) {
    DeleteProSpecID = ID;
}
function ConfirmDeleteProductCK() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Product_Specification.aspx/DeleteProductSpec",
        data: JSON.stringify(
            {
                "Pro_spec_id": DeleteProSpecID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status == "success") {
                get_all_spec_by_PID(ProductID);
                ClearModal();
                $("#btndeletemenu").attr("data-dismiss", "modal");
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

function ClearModal() {
    $(".sufee-alert").hide();
    $("#txtProSpecTitle").val("");
    $("#txtProSpecValue").val("");
}