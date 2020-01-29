var SubCategoryMode;
var EditSubCategoryID;
var flage = true;
var ImageString;
var EditImageString;
var ImageName;
var EditImageName;
var DeleteSubCatID;
var HeaderImageString;
var HeaderImageName;
var EditHeaderImageString;
var EditHeaderImageName;
$(document).ready(function () {
    GetAllCategory();
    GetAllSubCategory();
})
function SetMode() {
    SubCategoryMode = "add";
    $("#lblImage").text("");
    ImageString = "";
    ImageName = "";
}

function GetAllCategory() {
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
                    $("#DrdCat").append($("<option></option>").val(AllMenus[i].Category_ID).html(AllMenus[i].Category_Name));
                    if (AllMenus[i].Menu_Name == "Shop by pet")
                        $("#FilterCat").append($("<option></option>").val(AllMenus[i].Category_ID).html(AllMenus[i].Category_Name));
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}


function InsertSubCategory() {
    $(".sufee-alert").hide();
    var SubCategoryName = $("#txtSubCat").val();
    var CategoryID = $("#DrdCat").val();
    var Heading = $("#txtSubCatTitle").val();
    var Description = $("#txtSubCatDes").val();

    if (SubCategoryName == undefined || SubCategoryName == "") {
        $('#ErrorMsgSubCat').show();
        flage = false;
    }
    if (CategoryID == undefined || CategoryID == "") {
        $('#ErrorMsgCatDrp').show();
        flage = false;
    }
    if (Heading == undefined || Heading == "") {
        $("#ErrorMsgSubCaTitlet").show();
        flage = false;
    }
    if (flage) {
        if (SubCategoryMode == "add") {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Admin/Pages/SubCategory.aspx/AddSubCategory",
                data: JSON.stringify(
                    {
                        "SubCategoryName": SubCategoryName,
                        "CategoryID": CategoryID,
                        "IsDelete": false,
                        "Image": ImageString == undefined ? "" : ImageString,
                        "ImageName": ImageName == undefined ? "" : ImageName,
                        "Heading": Heading,
                        "Description": Description,
                        "Page_Image": HeaderImageString == undefined ? "" : HeaderImageString,
                        "Page_Image_Name": HeaderImageName == undefined ? "" : HeaderImageName
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllSubCategory();
                    ClearModal();
                    $("#btnInsertSubCat").attr("data-dismiss", "modal");
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
                url: "/Admin/Pages/SubCategory.aspx/EditSubCategory",
                data: JSON.stringify(
                    {
                        "SubCategoryID": EditSubCategoryID,
                        "SubCategoryName": SubCategoryName,
                        "CategoryID": CategoryID,
                        "IsDelete": false,
                        "Image": ImageString == undefined ? EditImageString : ImageString,
                        "ImageName": ImageName == undefined ? EditImageName : ImageName,
                        "Heading": Heading,
                        "Description": Description,
                        "Page_Image": HeaderImageString == undefined ? EditHeaderImageString : HeaderImageString,
                        "Page_Image_Name": HeaderImageName == undefined ? EditHeaderImageName : HeaderImageName
                    }),
                dataType: "json",
                success: function (res) {
                    GetAllSubCategory();
                    ClearModal();
                    $("#btnInsertSubCat").attr("data-dismiss", "modal");
                    toastr.success("Successfully Inserted !!!")
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

function GetAllSubCategory() {
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
                var table = $('#SubCategoryTable').DataTable()
                table.destroy();
                $('#SubCategoryTable').DataTable({
                    data: AllSubCategory,
                    "iDisplayLength": 50,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "SubCategory_Name" },
                        {
                            data: "Category_Name"
                        },
                        {
                            data: "Menu_Name",
                            visible: false
                        },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditSubCategory(' + data.SubCategory_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteSubCategory(' + data.SubCategory_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                            },
                            "orderable": false
                        },
                        {
                            data: "IsHomePage",
                            render: function (data, type, row) {
                                if (data == true) {
                                    return '<input type="checkbox" onclick="SetHomeIsHomePage(' + row.SubCategory_ID + ')" checked="' + data + '" id="' + row.SubCategory_ID + '">';
                                }
                                return '<input type="checkbox" onclick="SetHomeIsHomePage(' + row.SubCategory_ID + ')" id="' + row.SubCategory_ID + '">';
                            },
                            "orderable": false,
                            className: "dt-body-center"
                        },
                        {
                            data: function (data, type, row) {
                                return '<span class="ti-arrow-up" onclick="Change_sort(\'' + data.SubCategory_ID + '\',\'' + data.Sortable + '\')" style="cursor:pointer;"></span>'
                            },
                            "orderable": false
                        },
                    ],
                });
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
                var table = $('#SubCategoryTable').DataTable()
                table.destroy();
                $('#SubCategoryTable').DataTable({
                    data: AllSubCategory,
                    "iDisplayLength": 50,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "SubCategory_Name" },
                        {
                            data: "Category_Name"
                        },
                        {
                            data: "Menu_Name",
                            visible: false
                        },
                        {
                            data: function (data, type, row) {
                                return '<a class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#largeModal" onclick="EditSubCategory(' + data.SubCategory_ID + ')"><i class="fa fa-magic"></i>&nbsp; EDIT</a> <a class="btn btn-outline-danger btn-sm"  data-toggle="modal" data-target="#DeleteConfirm" onclick="DeleteSubCategory(' + data.SubCategory_ID + ')"><i class="fa fa-rss"></i>&nbsp; DELETE</a>'
                            },
                            "orderable": false
                        },
                        {
                            data: "IsHomePage",
                            render: function (data, type, row) {
                                if (data == true) {
                                    return '<input type="checkbox" onclick="SetHomeIsHomePage(' + row.SubCategory_ID + ')" checked="' + data + '" id="' + row.SubCategory_ID + '">';
                                }
                                return '<input type="checkbox" onclick="SetHomeIsHomePage(' + row.SubCategory_ID + ')" id="' + row.SubCategory_ID + '">';
                            },
                            "orderable": false,
                            className: "dt-body-center"
                        },
                        {
                            data: function (data, type, row) {
                                return '<span class="ti-arrow-up" onclick="Change_sort(\'' + data.SubCategory_ID + '\',\'' + data.Sortable + '\')" style="cursor:pointer;"></span>'
                            },
                            "orderable": false
                        },
                    ],
                });
            }

        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function Change_sort(ID, Soratable) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/SortableChange",
        data: JSON.stringify(
            {
                "Soratable": Soratable,
                "SubCategoryID": ID
            }),
        dataType: "json",
        success: function (res) {
            GetAllSubCategory();
            var status = JSON.parse(res.d);
            if (status == "success")
                toastr.success("This category is display first in home page");
            else
                toastr.error(status);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function SetHomeIsHomePage(ID, data) {
    var value = $("#" + ID).prop('checked');
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/ShowOnHomePage",
        data: JSON.stringify(
            {
                "IsShowHomePage": value,
                "SubCategoryID": ID
            }),
        dataType: "json",
        success: function (res) {
            GetAllSubCategory();
            var status = JSON.parse(res.d);
            if (status == "success")
                toastr.success(status);
            else
                toastr.error(status);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function DeleteSubCategory(ID) {
    DeleteSubCatID = ID;
}
function ConfirmDeleteMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/DeleteSubCategorys",
        data: JSON.stringify(
            {
                "SubCategoryID": DeleteSubCatID
            }),
        dataType: "json",
        success: function (res) {
            GetAllSubCategory()
            ClearModal();
            $("#btndeletemenu").attr("data-dismiss", "modal");
            toastr.success("Successfully Deleted !!!")
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}
function EditSubCategory(ID) {
    SubCategoryMode = "edit";
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/SubCategory.aspx/GetSubCategoryByID",
        data: JSON.stringify(
            {
                "SubCategoryID": ID
            }),
        dataType: "json",
        success: function (res) {
            var cat = JSON.parse(res.d);
            if (cat != null && cat != undefined) {
                $("#txtSubCat").val(cat.SubCategory_Name);
                $("#DrdCat option:selected").text(cat.Category_Name)
                $("#DrdCat").val(cat.Category_ID)
                $("#txtSubCatTitle").val(cat.Heading);
                $("#txtSubCatDes").val(cat.Description);
                EditSubCategoryID = cat.SubCategory_ID;
                EditImageString = cat.Image;
                EditImageName = cat.ImageName;
                EditHeaderImageString = cat.Page_Image;
                EditHeaderImageName = cat.Page_Image_Name;
                $("#lblImage").text(cat.ImageName == null ? "" : cat.ImageName);
                $("#lblImageHeader").text(cat.Page_Image_Name == null ? "" : cat.Page_Image_Name);
                ImageString = undefined;
                ImageName = undefined;
                HeaderImageString = undefined;
                HeaderImageName = undefined;
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
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

function fnFileUploadHeader(obj) {
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
                                HeaderImageString = tempFileContent[tempFileContent.length - 1];
                            }
                        }
                        HeaderImageName = selectedFile.name;
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


function ClearModal() {
    $(".sufee-alert").hide();
    $("#txtSubCat").val('');
    $("#DrdCat").val("")
    $("#uploadImage").val("");
    $("#txtSubCatTitle").val('');
    $("#txtSubCatDes").val('');
    $("#uploadImageHeader").val('');
}
