var CategoryMode;
var EditCategoryID;
var flage = true;
var DeleteCatID;
$(document).ready(function () {
    GetAllMenus();
    GetAllCategory();
})
function GetAllCategory() {
    var MenuID = $("#FilterMenu").val();
    if (MenuID == "")
        MenuID = 0;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Category.aspx/FilterMenuWise",
        data: JSON.stringify(
            {
                "MenuID": MenuID
            }),
        dataType: "json",
        success: function (res) {
            var AllCategory = JSON.parse(res.d);
            if (AllCategory != null && AllCategory != undefined) {
                var table = $('#CategoryTable').DataTable()
                table.destroy();
                $('#CategoryTable').DataTable({
                    data: AllCategory,
                    "iDisplayLength": 50,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Category_Name" },
                        { data: "Menu_Name" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditCategory(' + data.Category_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteMenu(' + data.Category_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
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

function DeleteMenu(ID) {
    DeleteCatID = ID;
}
function ConfirmDeleteMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Category.aspx/DeleteCategory",
        data: JSON.stringify(
            {
                "CategoryID": DeleteCatID
            }),
        dataType: "json",
        success: function (res) {
            GetAllCategory();
            ClearModal();
            $("#btndeletemenu").attr("data-dismiss", "modal");
            toastr.success("Successfully Deleted !!!")
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function SetMode() {
    CategoryMode = "add";
}
function EditCategory(ID) {
    CategoryMode = "edit";
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Category.aspx/GetCategoryByID",
        data: JSON.stringify(
            {
                "CategoryID": ID
            }),
        dataType: "json",
        success: function (res) {
            var cat = JSON.parse(res.d);
            if (cat != null && cat != undefined) {
                $("#txtCatName").val(cat.Category_Name);
                $("#DrdMenu option:selected").text(cat.Menu_Name)
                $("#DrdMenu").val(cat.Menu_ID)
                EditCategoryID = cat.Category_ID;
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function GetAllMenus() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/MainMenu.aspx/GetAllMenu",
        dataType: "json",
        success: function (res) {
            var AllMenus = JSON.parse(res.d);
            if (AllMenus != null && AllMenus != undefined) {
                for (i = 0; i < AllMenus.length; i++) {
                    $("#DrdMenu").append($("<option></option>").val(AllMenus[i].Menu_ID).html(AllMenus[i].Menu_Name));
                    $("#FilterMenu").append($("<option></option>").val(AllMenus[i].Menu_ID).html(AllMenus[i].Menu_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function FilterCategory() {
    var MenuID = $("#FilterMenu").val();
    if (MenuID == "")
        MenuID = 0;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Category.aspx/FilterMenuWise",
        data: JSON.stringify(
            {
                "MenuID": MenuID
            }),
        dataType: "json",
        success: function (res) {
            var AllCategory = JSON.parse(res.d);
            if (AllCategory != null && AllCategory != undefined) {
                var table = $('#CategoryTable').DataTable()
                table.destroy();
                $('#CategoryTable').DataTable({
                    data: AllCategory,
                    "iDisplayLength": 50,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Category_Name" },
                        { data: "Menu_Name" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditCategory(' + data.Category_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteMenu(' + data.Category_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
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

function InsertCategory() {
    $(".sufee-alert").hide();
    var CategoryName = $("#txtCatName").val();
    var MenuID = $("#DrdMenu").val();

    if (CategoryName == undefined || CategoryName == "") {
        $('#ErrorMsgCat').show();
        flage = false;
    }
    if (MenuID == undefined || MenuID == "") {
        $('#ErrorMsgMenuDrp').show();
        flage = false;
    }
    if (flage) {
        if (CategoryMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Category.aspx/AddCategory",
                data: JSON.stringify(
                    {
                        "CategoryName": CategoryName,
                        "MenuID": MenuID,
                        "IsDelete": false
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllCategory();
                    ClearModal();
                    $("#btnInsertCat").attr("data-dismiss", "modal");
                    GetAllMenus();
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
                url: "/Admin/Pages/Category.aspx/EditCategory",
                data: JSON.stringify(
                    {
                        "CategoryID": EditCategoryID,
                        "CategoryName": CategoryName,
                        "MenuID": MenuID,
                        "IsDelete": false
                    }),
                dataType: "json",
                success: function (res) {
                    if (res.d != null && res.d != undefined) {
                        GetAllCategory();
                        ClearModal();
                        $("#btnInsertCat").attr("data-dismiss", "modal");
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
    $("#txtCatName").val('');
    $("#DrdMenu").val("")
}