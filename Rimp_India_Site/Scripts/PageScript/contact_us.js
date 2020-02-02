var flage = true;
$(document).ready(function () {
    $(".form-group").removeClass("has-error is-focused");
    GetAllCotacts();
});

function ContactAdd() {
    var Name = $("#inputName").val();
    var Mobile = $("#inputMobile").val();
    var Address = $("#inputAddress").val();
    var Email = $("#inputEmail").val();
    var Subject = $("#inputSubject").val();
    var Message = $("#inputMessage").val();
    if (Name == "" || Name == undefined) {
        flage = false;
        $("#NameDiv").addClass("has-error is-focused");
    }
    if (Mobile == "" || Mobile == undefined) {
        flage = false;
        $("#MobileDiv").addClass("has-error is-focused");
    }
    flage = FindMobileLength(Mobile);
    if (Address == "" || Address == undefined) {
        flage = false;
        $("#AddressDiv").addClass("has-error is-focused");
    }
    if (Email == "" || Email == undefined) {
        flage = false;
        $("#EmailDiv").addClass("has-error is-focused");
    }
    if (flage)
        flage = emailValidOrNot(Email);
    if (Subject == "" || Subject == undefined) {
        flage = false;
        $("#SubjectDiv").addClass("has-error is-focused");
    }
    if (Message == "" || Message == undefined) {
        flage = false;
        $("#MessageDiv").addClass("has-error is-focused");
    }
    if (flage) {
        HoldOn.open();
        var obj = {
            "Name": Name,
            "Mobile": Mobile,
            "Address": Address,
            "Email": Email,
            "Subject": Subject,
            "Message": Message
        }
        $.ajax({
            async: false,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/WebPages/ContactUs.aspx/AddContact",
            data: JSON.stringify(obj),
            dataType: "json",
            success: function (res) {
                ClearContactForm();
                HoldOn.close();
                swal("Success", "Your contact has been added.", "success");
            },
            error: function (xhr, status, err) {
                toastr.error(xhr.responseJSON.Message);
            }
        });
    } else {
        flage = true;
    }
}

function ClearContactForm() {
    $(".form-group").removeClass("has-error is-focused");
    $("#inputName").val("");
    $("#inputMobile").val("");
    $("#inputAddress").val("");
    $("#inputEmail").val("");
    $("#inputSubject").val("");
    $("#inputMessage").val("");
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function emailValidOrNot(value) {
    var re = /([A-Z0-9a-z_-][^@])+?@[^$#<>?]+?\.[\w]{2,4}/.test(value);
    if (!re) {
        $("#EmailDiv").addClass("has-error is-focused");
        return false;
    } else {
        $("#EmailDiv").removeClass("has-error is-focused");
        return true;
    }
}

function GetAllCotacts() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/ContactUs.aspx/GetAlllContacts",
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
                        { data: "Name" },
                        { data: "Email" },
                        { data: "Mobile" },
                        {
                            data: "CreatedDates"
                        },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteMenu(' + data.Contact_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
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