var ThirdCategoryMode;
var EditThirdCategoryID;
var flage = true;
var DeleteThirdCatID;
$(document).ready(function () {
    GetCategory();
    GetAllThirdCategory();
    GetAllSubCategory();
    $("#FilterSubCat").prop("disabled", true);
})

function GetCategory() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Category.aspx/Getategory",
        dataType: "json",
        success: function (res) {
            var AllMenus = JSON.parse(res.d);
            if (AllMenus != null && AllMenus != undefined) {
                for (i = 0; i < AllMenus.length; i++) {
                    //if (AllMenus[i].Menu_Name == "Shop by pet")
                    $("#FilterCat").append($("<option></option>").val(AllMenus[i].Category_ID).html(AllMenus[i].Category_Name));

                    $("#DrdCategory").append($("<option></option>").val(AllMenus[i].Category_ID).html(AllMenus[i].Category_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function FilterSubCategory() {
    var CatID = $("#FilterCat").val();
    if (CatID == "")
        CatID = 0;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/GetAllFilterSubCat",
        data: JSON.stringify(
            {
                "CatID": CatID
            }),
        dataType: "json",
        success: function (res) {
            var AllSubCategory = JSON.parse(res.d);
            if (AllSubCategory != null && AllSubCategory != undefined) {
                $("#FilterSubCat").prop("disabled", false);
                $("#FilterSubCat").empty();
                $("#FilterSubCat").append($("<option></option>").val("").html("--Select sub category--"));
                for (i = 0; i < AllSubCategory.length; i++) {
                    $("#FilterSubCat").append($("<option></option>").val(AllSubCategory[i].SubCategory_ID).html(AllSubCategory[i].SubCategory_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function FilterThirdCategory() {
    var SubCatID = $("#FilterSubCat").val();
    if (SubCatID == "")
        SubCatID = 0;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ThirdCategory.aspx/FilterThirdCategory",
        data: JSON.stringify(
            {
                "SubCatID": SubCatID
            }),
        dataType: "json",
        success: function (res) {
            var AllThirdCategory = JSON.parse(res.d);
            if (AllThirdCategory != null && AllThirdCategory != undefined) {
                var table = $('#ThirdCategoryTable').DataTable()
                table.destroy();
                $('#ThirdCategoryTable').DataTable({
                    data: AllThirdCategory,
                    "iDisplayLength": 5,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "ThirdCategory_Name" },
                        { data: "SubCategory_Name" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditThirdCategory(' + data.ThirdCategory_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteThirdCategory(' + data.ThirdCategory_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                            },
                            "orderable": false
                        }
                    ],
                });
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function GetAllThirdCategory() {
    //$.ajax({
    //    async: false,
    //    type: "POST",
    //    contentType: "application/json; charset=utf-8",
    //    url: "/Admin/Pages/ThirdCategory.aspx/GetAllThirdCat",
    //    dataType: "json",
    //    success: function (res) {
    //        var AllThirdCategory = JSON.parse(res.d);
    FilterThirdCategory();
    //    },
    //    error: function (xhr, status, err) {
    //        toastr.error(xhr.responseJSON.Message);
    //    }
    //});
}

function EditThirdCategory(ID) {
    ThirdCategoryMode = "edit";
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ThirdCategory.aspx/GetThirdCategoryByID",
        data: JSON.stringify(
            {
                "ThirdCategoryID": ID
            }),
        dataType: "json",
        success: function (res) {
            var cat = JSON.parse(res.d);
            if (cat != null && cat != undefined) {
                $("#txtThirdCat").val(cat.ThirdCategory_Name);
                $("#DrdSubCat option:selected").text(cat.SubCategory_Name)
                $("#DrdSubCat").val(cat.SubCategory_ID)
                EditThirdCategoryID = cat.ThirdCategory_ID;
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function DeleteThirdCategory(ID) {
    DeleteThirdCatID = ID;
}

function ConfirmDeleteMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ThirdCategory.aspx/DeleteThirdCategory",
        data: JSON.stringify(
            {
                "ThirdCatID": DeleteThirdCatID
            }),
        dataType: "json",
        success: function (res) {
            GetAllThirdCategory();
            ClearModal();
            $("#btndeletemenu").attr("data-dismiss", "modal");
            toastr.success("Successfully Deleted !!!")
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function GetAllSubCategory() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ThirdCategory.aspx/GetAllSubCat",
        dataType: "json",
        success: function (res) {
            var AllSubCate = JSON.parse(res.d);
            if (AllSubCate != null && AllSubCate != undefined) {
                for (i = 0; i < AllSubCate.length; i++) {
                    $("#DrdSubCat").append($("<option></option>").val(AllSubCate[i].SubCategory_ID).html(AllSubCate[i].SubCategory_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function InsertThirdCategory() {
    $(".sufee-alert").hide();
    var ThirdCatName = $("#txtThirdCat").val();
    var SubCatID = $("#DrdSubCat").val();
    var CatID = $("#DrdCategory").val();
    if (ThirdCatName == undefined || ThirdCatName == "") {
        $('#ErrorMsgThirdCat').show();
        flage = false;
    }
    if (CatID == undefined || CatID == "") {
        $('#ErrorMsgCategory').show();
        flage = false;
    }
    if (SubCatID == undefined || SubCatID == "") {
        $('#ErrorMsgSubCatDrp').show();
        flage = false;
    }
    if (flage) {
        if (ThirdCategoryMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/ThirdCategory.aspx/AddThirdCategory",
                data: JSON.stringify(
                    {
                        "ThirdCategoryName": ThirdCatName,
                        "SubCatID": SubCatID
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllThirdCategory();
                    ClearModal();
                    $("#btnInsertThirdCat").attr("data-dismiss", "modal");
                    toastr.success("Successfully Inserted !!!")
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
                url: "/Admin/Pages/ThirdCategory.aspx/EditThirdCategory",
                data: JSON.stringify(
                    {
                        "ThirdCatID": EditThirdCategoryID,
                        "ThirdCategoryName": ThirdCatName,
                        "SubCatID": SubCatID
                    }),
                dataType: "json",
                success: function (res) {
                    if (res.d != null && res.d != undefined) {
                        GetAllThirdCategory();
                        ClearModal();
                        $("#btnInsertThirdCat").attr("data-dismiss", "modal");
                        toastr.success("Successfully Updated !!!")
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
    $(".sufee-alert").hide();
    $("#txtThirdCat").val('');
    $("#DrdSubCat").val("")
}

function SetMode() {
    ThirdCategoryMode = "add";
}

function ChangeCategory() {
    var CategoryID = $("#DrdCategory").val();
    if (CategoryID != "" && CategoryID != undefined && CategoryID != null) {
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
    } else {
        $("#DrdSubCat").val("");
        $("#DrdSubCat").empty();
        $("#DrdSubCat").prop("disabled", true);
        $("#DrdSubCat").append($("<option></option>").val("").html("--Select sub category--"));
    }
}