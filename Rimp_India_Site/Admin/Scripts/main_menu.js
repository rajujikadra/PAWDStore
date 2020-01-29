var EditMenuID;
var DeleteMenuID;
var MenuMode;
var flage = true;
$(document).ready(function () {
    GetAllMenus();
})
function SetMode() {
    MenuMode = "add";
}

function InsertMenu() {
    $(".sufee-alert").hide();
    var MenuName = $("#txtMenuName").val();
    if (MenuName == undefined || MenuName == "") {
        $('#ErrorMsgMenu').show();
        flage = false;
    }
    if (flage) {
        if (MenuMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/MainMenu.aspx/AddMenu",
                data: JSON.stringify(
                    {
                        "MenuName": MenuName,
                        "IsDelete": false
                    }),
                dataType: "json",
                success: function (res) {
                    if (res.d != null && res.d != undefined) {
                        GetAllMenus();
                        ClearModal();
                        $("#btnInsertMenu").attr("data-dismiss", "modal");
                        toastr.success("Successfully Inserted !!!")
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
                url: "/Admin/Pages/MainMenu.aspx/EditMenu",
                data: JSON.stringify(
                    {
                        "MenuID": EditMenuID,
                        "MenuName": MenuName,
                        "IsDelete": false
                    }),
                dataType: "json",
                success: function (res) {
                    if (res.d != null && res.d != undefined) {
                        GetAllMenus();
                        ClearModal();
                        $("#btnInsertMenu").attr("data-dismiss", "modal");
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
                var table = $('#example').DataTable()
                table.destroy();
                $('#example').DataTable({
                    data: AllMenus,
                    "iDisplayLength": 5,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Menu_Name" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditMenu(' + data.Menu_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteMenu(' + data.Menu_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
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

function EditMenu(ID) {
    MenuMode = "edit";
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/MainMenu.aspx/GetMenuByID",
        data: JSON.stringify(
            {
                "MenuID": ID
            }),
        dataType: "json",
        success: function (res) {
            var menu = JSON.parse(res.d);
            if (menu != null && menu != undefined) {
                $("#txtMenuName").val(menu.Menu_Name);
                EditMenuID = menu.Menu_ID;
                //GetAllMenus();
                //ClearModal();
                //$("#btnInsertMenu").attr("data-dismiss", "modal");
                //toastr.success("Successfully Inserted !!!")
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteMenu(ID) {
    DeleteMenuID = ID;
}
function ConfirmDeleteMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/MainMenu.aspx/DeleteMenuByID",
        data: JSON.stringify(
            {
                "MenuID": DeleteMenuID
            }),
        dataType: "json",
        success: function (res) {
            GetAllMenus();
            ClearModal();
            $("#btndeletemenu").attr("data-dismiss", "modal");
            toastr.success("Successfully Deleted !!!")
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function ClearModal() {
    $(".sufee-alert").hide();
    $("#txtMenuName").val('');
}