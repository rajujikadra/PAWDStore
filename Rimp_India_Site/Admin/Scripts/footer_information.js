var InformationMode;
var flage = true;
var Edit_InformationID;
var Delete_InformationID;

$(document).ready(function () {
    GetAllInformation();
})

function SetMode() {
    InformationMode = "add";
}

function GetAllInformation() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Information.aspx/GetInformation",
        dataType: "json",
        success: function (res) {
            var AllInfo = JSON.parse(res.d);
            if (AllInfo != null && AllInfo != undefined) {
                var table = $('#information_table').DataTable()
                table.destroy();
                $('#information_table').DataTable({
                    data: AllInfo,
                    "iDisplayLength": 5,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Title" },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditInfo(' + data.Information_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteInfo(' + data.Information_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
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

function InsertInformation() {
    $(".sufee-alert").hide();
    var Title = $("#txtTitle").val();
    var Description = $("#txtDesc").val();

    if (Title == undefined || Title == "") {
        $('#ErrorMsgTitle').show();
        flage = false;
    }
    if (Description == undefined || Description == "") {
        $('#ErrorDesc').show();
        flage = false;
    }
    if (flage) {
        if (InformationMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/Information.aspx/AddInformation",
                data: JSON.stringify(
                    {
                        "Title": Title,
                        "Description": Description
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllInformation();
                    ClearModal();
                    $("#btnInsertMenu").attr("data-dismiss", "modal");
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
                url: "/Admin/Pages/Information.aspx/UpdateInformation",
                data: JSON.stringify(
                    {
                        "Info_ID": Edit_InformationID,
                        "Title": Title,
                        "Description": Description
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllInformation();
                    ClearModal();
                    $("#btnInsertMenu").attr("data-dismiss", "modal");
                    toastr.success("Successfully Updated !!!")
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


function EditInfo(ID) {
    InformationMode = "edit";
    Edit_InformationID = ID;
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Information.aspx/GetInfoByID",
        data: JSON.stringify(
            {
                "Info_ID": ID
            }),
        dataType: "json",
        success: function (res) {
            var info = JSON.parse(res.d);
            debugger;
            if (info != null && info != undefined) {
                $("#txtTitle").val(info.Title);
                $("#txtDesc").val(info.Description)
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteInfo(ID) {
    Delete_InformationID = ID;
}

function ConfirmDeleteIfo() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Information.aspx/DeleteInfo",
        data: JSON.stringify(
            {
                "Info_ID": Delete_InformationID
            }),
        dataType: "json",
        success: function (res) {
            GetAllInformation();
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
    $("#txtTitle").val("");
    $("#txtDesc").val("");
}