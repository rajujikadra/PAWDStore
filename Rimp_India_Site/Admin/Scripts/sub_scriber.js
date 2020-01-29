var EmailMode;
var EditEmailID;
var flage = true;
var DeleteEmailID;
$(document).ready(function () {
    GetAllSubscriber();
})


function GetAllSubscriber() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Subscribe.aspx/get_all_subscriber",
        dataType: "json",
        success: function (res) {
            var EmailList = JSON.parse(res.d);
            var table = $('#Subscribe_table').DataTable()
            table.destroy();
            $('#Subscribe_table').DataTable({
                data: EmailList,
                "iDisplayLength": 5,
                "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                retrieve: true,
                'paging': true,
                'sort': true,
                'searching': true,
                columns: [
                    { data: "EmailID" },
                    {
                        data: function (data, type, row) {
                            return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditEmail(' + data.Subscribe_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteEmail(' + data.Subscribe_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                        },
                        "orderable": false
                    }
                ],
            });
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function ClearModal() {
    $("#txtEmail").val("");
}
function SetMode() {
    EmailMode = "add";
}
function InsertEmail() {
    $(".sufee-alert").hide();
    var Email = $("#txtEmail").val();
    if (Email == undefined || Email == "") {
        $('#ErrorMsgEmail').show();
        flage = false;
    }
    if (flage == true)
        flage = validate_email(Email)

    if (flage) {
        if (EmailMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Default.aspx/AddSubsribe",
                data: JSON.stringify({ Email: Email }),
                dataType: "json",
                success: function (res) {
                    if (JSON.parse(res.d) == "success") {
                        $("#txtEmail").val("");
                        GetAllSubscriber();
                        $("#btnInsertCat").attr("data-dismiss", "modal");
                        toastr.success("successfully added !!!")
                    } else {
                        toastr.error("Oops!!! Some problem occured !!!");
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
                url: "/Admin/Pages/Subscribe.aspx/UpdateEmail",
                data: JSON.stringify({
                    SubscriberID: EditEmailID,
                    Email: Email
                }),
                dataType: "json",
                success: function (res) {
                    if (JSON.parse(res.d) == "success") {
                        $("#txtEmail").val("");
                        GetAllSubscriber();
                        $("#btnInsertCat").attr("data-dismiss", "modal");
                        toastr.success("successfully added !!!")
                    } else {
                        toastr.error("Oops!!! Some problem occured !!!");
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


function validate_email(value) {
    var re = /([A-Z0-9a-z_-][^@])+?@[^$#<>?]+?\.[\w]{2,4}/.test(value);
    if (!re) {
        $("#ErrorMsgEmailvalidate").show();
        return false;
    } else {
        $("#ErrorMsgEmailvalidate").hide();
        return true;
    }
}

function EditEmail(ID) {
    EditEmailID = ID;
    EmailMode = "edit";
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Subscribe.aspx/GetEmailByID",
        data: JSON.stringify(
            {
                "SubscriberID": ID
            }),
        dataType: "json",
        success: function (res) {
            var email = JSON.parse(res.d);
            if (email != null && email != undefined) {
                $("#txtEmail").val(email.EmailID);
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteEmail(ID) {
    DeleteEmailID = ID;
}

function ConfirmDeleteEmail() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/Subscribe.aspx/DeleteEmail",
        data: JSON.stringify({
            SubscriberID: DeleteEmailID
        }),
        dataType: "json",
        success: function (res) {
            if (JSON.parse(res.d) == "success") {
                GetAllSubscriber();
                $("#btndeletemenu").attr("data-dismiss", "modal");
                toastr.success("successfully deleted !!!")
            } else {
                toastr.error("Oops!!! Some problem occured !!!");
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}