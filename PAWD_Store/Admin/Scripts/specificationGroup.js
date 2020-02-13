
var EditGroupID;
var Product_ID;
var AllSpecificationGroup = [];
var flage = true;
var GroupMode;
var DeleteGroupID;

$(document).ready(function () {

})

function SetMode() {
    GroupMode = "add";
}

function get_all_product_Specification_group_by_PID(P_specification_group_list, product_id) {
    Product_ID = product_id;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ProductImages.aspx/GetProduct_by_PID",
        data: JSON.stringify(
            {
                "PID": product_id,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                var table = $('#Product_specification_group').DataTable()
                table.destroy();
                $('#Product_specification_group').DataTable();
                $("#pro_title_image").html(status.Product_Title);
                $("#table_Heading").html(status.Product_Title + " Specification Group List");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
    AllSpecificationGroup = P_specification_group_list;
    var table = $('#Product_specification_group').DataTable()
    table.destroy();
    $('#Product_specification_group').DataTable({
        data: P_specification_group_list,
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        retrieve: true,
        'paging': true,
        'sort': true,
        'searching': true,
        columns: [
            { data: "Specification_Group_Name" },
            {
                data: function (data, type, row) {
                    return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditProductSpecGrp(' + data.Specification_GroupID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteProductSpecGrp(' + data.Specification_GroupID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                },
                "orderable": false
            },
            {
                data: function (data, type, row) {
                    return '<a href="product_specification?ID=' + data.Specification_GroupID + '/' + data.Product_ID + '" class="btn btn-outline-success btn-sm"><i class="fa fa-magic"></i>&nbsp; Specification</a>'
                },
                "orderable": false
            },
        ],
    });
}

function InsertProductSpecGrp() {
    $(".sufee-alert").hide();
    var GroupName = $("#txtProSpecGroup").val();

    if (GroupName == "" || GroupName == undefined) {
        flage = false;
        $("#ErrorMsgProSpecGroup").show();
    }
    if (flage) {
        if (GroupMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Specification_group.aspx/AddProductsSpecGrp",
                data: JSON.stringify(
                    {
                        "PID": Product_ID,
                        "Spec_group": GroupName
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_spec_group_PID(Product_ID);
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
                url: "/Admin/Pages/Specification_group.aspx/UpdateProductsSpecGrp",
                data: JSON.stringify(
                    {
                        "SID": EditGroupID,
                        "PID": Product_ID,
                        "Spec_group": GroupName
                    }),
                dataType: "json",
                success: function (res) {
                    var status = JSON.parse(res.d);
                    if (status == "success") {
                        get_all_spec_group_PID(Product_ID);
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

function ClearModal() {
    $("#txtProSpecGroup").val("");
}

function get_all_spec_group_PID(PID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Specification_group.aspx/get_all_SpecGrp",
        data: JSON.stringify(
            {
                "PID": PID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            get_all_product_Specification_group_by_PID(status, PID)
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function EditProductSpecGrp(Spec_Grp_Id) {
    GroupMode = "edit";
    EditGroupID = Spec_Grp_Id;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Specification_group.aspx/get_all_SpecGrp_by_id",
        data: JSON.stringify(
            {
                "Spec_Grp_Id": Spec_Grp_Id,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status != null) {
                $("#txtProSpecGroup").val(status.Specification_Group_Name);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteProductSpecGrp(Spec_grp_id) {
    DeleteGroupID = Spec_grp_id;
}

function ConfirmDeleteProductSpecGrp() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Specification_group.aspx/delete_spec_grp",
        data: JSON.stringify(
            {
                "Spec_Grp_Id": DeleteGroupID,
            }),
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            if (status == "success") {
                toastr.success("Successfully Deleted");
                get_all_spec_group_PID(Product_ID);
                $("#btndeletemenu").attr("data-dismiss", "modal");
            }
            else {
                toastr.error(status);
                $("#btndeletemenu").attr("data-dismiss", "modal");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}