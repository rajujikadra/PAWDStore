var MainMenu = [];
var CategoryWithMenu = [];
var SubCategoryWithCategory = [];
var flage = true;
var SubCategoryName;

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

$(document).ready(function () {
    GetAllMainMenu();
    GetAllCategoryWithMenu();
    GetAllSubCategoryWithCategory();
    GetHomePageProductLists();
    Get_Information();
    set_solution_side_menu(MainMenu, CategoryWithMenu);
    get_all_hotProducts();

    $("#ProductMenu").mouseleave(function () {
        $("#DivProduct").removeClass("show");
        $("#ProductMenu").empty();
    });
    $("#DivProduct").mouseleave(function () {
        $("#DivProduct").removeClass("show");
        $("#ProductMenu").empty();
    });
    $("#SolutionMenu").mouseleave(function () {
        $("#DivSolution").removeClass("show");
        $("#SolutionMenu").empty();
    });
    $("#DivSolution").mouseleave(function () {
        $("#DivSolution").removeClass("show");
        $("#SolutionMenu").empty();
    });

    $("#DownloadMenu").mouseleave(function () {
        $("#DivDownload").removeClass("show");
        $("#DownloadMenu").empty();
    });
    $("#DivDownload").mouseleave(function () {
        $("#DivDownload").removeClass("show");
        $("#DownloadMenu").empty();
    });
    $("#OtherMenu").mouseleave(function () {
        $("#DivOther").removeClass("show");
        $("#OtherMenu").empty();
    });

    $("#DivOther").mouseleave(function () {
        $("#DivOther").removeClass("show");
        $("#OtherMenu").empty();
    });
});

function GetAllMainMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/GetMainMenu",
        dataType: "json",
        success: function (res) {
            MainMenu = JSON.parse(res.d);
        },
        error: function (xhr, status, err) {
        }
    });
}
function GetAllCategoryWithMenu() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/GetCategoryMenu",
        dataType: "json",
        success: function (res) {
            CategoryWithMenu = JSON.parse(res.d);
        },
        error: function (xhr, status, err) {
        }
    });
}
function GetAllSubCategoryWithCategory() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/GetSubCategoryMenu",
        dataType: "json",
        success: function (res) {
            SubCategoryWithCategory = JSON.parse(res.d);
            var sidebar_product = "";
            for (var i = 0; i < SubCategoryWithCategory.length; i++) {
                if (SubCategoryWithCategory[i].Menu_Name == "Shop by pet") {
                    sidebar_product += '<a href="product_list?ID=' + SubCategoryWithCategory[i].SubCategory_ID + '">' + SubCategoryWithCategory[i].SubCategory_Name + '</a>';
                }
            }
            $("#product_sidebar").append(sidebar_product);
            CreateMenu();
        },
        error: function (xhr, status, err) {
        }
    });
}


function CreateMenu() {
    var MenuString = "";
    MenuString = '<ul class="navbar-nav"> <li class="nav-item dropdown active"><a href="home" class="nav-link dropdown-toggle animated fadeIn animation-delay-7" data-name="home">Home</a></li> <li class="nav-item dropdown"><a href="aboutus" class="nav-link dropdown-toggle animated fadeIn animation-delay-7" data-name="about us">About Us</a></li>';
    for (var i = 0; i < MainMenu.length; i++) {
        if (MainMenu[i].Menu_Name == "Shop by pet") {
            MenuString += ' <li onmouseover="GetCategoryWithSub(' + MainMenu[i].Menu_ID + ')" class="nav-item dropdown dropdown-megamenu-container" id="DivProduct">' +
                '<a href="#"  class="nav-link dropdown-toggle animated fadeIn animation-delay-7" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false" data-name="component" >' + MainMenu[i].Menu_Name +
                '<i class="zmdi zmdi-chevron-down" ></i >' +
                '</a>' +
                '<ul class="dropdown-menu dropdown-megamenu animated fadeIn animated-2x">' +
                '<li class="container">' +
                '<div class="row" id="ProductMenu">' +
                '</div>' +
                '</li>' +
                '</ul>' +
                '</li>';
        } 
        else {
            MenuString += ' <li class="nav-item dropdown" id="DivOther">' +
                '<a href="#" onmouseover="GetCategoryWithSub(' + MainMenu[i].Menu_ID + ')" class="nav-link dropdown-toggle animated fadeIn animation-delay-7" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false" data-name="page" >' +
                MainMenu[i].Menu_Name + '<i class="zmdi zmdi-chevron-down" ></i></a>' +
                '<ul class="dropdown-menu" id="OtherMenu"></ul></li>';
        }
    }
    MenuString += '<li class="nav-item dropdown"><a href="contact" class="nav-link dropdown-toggle animated fadeIn animation-delay-7" data-name="home">Contact Us</a></li></ul>';
    $("#ms-navbar").append(MenuString);
}

function GetCategoryWithSub(menuid) {
    var Category = [];
    var SubMenuString = "";
    for (var i = 0; i < CategoryWithMenu.length; i++) {
        if (CategoryWithMenu[i].Menu_ID == menuid) {
            Category.push(CategoryWithMenu[i]);
        }
    }
    var CategoryString = "";
    for (var i = 0; i < Category.length; i++) {
        if (Category[i].Menu_Name == "Solutions") {
            $("#DivSolution").addClass("show");
            var SubCatMenu = [];
            for (var b = 0; b < SubCategoryWithCategory.length; b++) {
                if (SubCategoryWithCategory[b].Menu_ID == menuid) {
                    SubCatMenu.push(SubCategoryWithCategory[b]);
                }
            }
            var SubMenuString = "";
            SubMenuString += '<li class="dropdown-submenu">' +
                '<a href="javascript:void(0)" class="dropdown-item has_children">' + Category[i].Category_Name + '</a>' +
                '<ul class="dropdown-menu dropdown-menu-left">';
            for (var m = 0; m < SubCatMenu.length; m++) {
                if (Category[i].Category_Name == SubCatMenu[m].Category_Name) {
                    SubMenuString += '<li>' +
                        '<a class="dropdown-item" href="page-about.html">' + SubCatMenu[m].SubCategory_Name + '</a>' +
                        '</li>';
                }
            }
            SubMenuString += '</ul>' +
                '</li>';
            $("#SolutionMenu").append(SubMenuString);
            SubMenuString = "";
        }
        else if (Category[i].Menu_Name == "Shop by pet") {
            $("#DivProduct").addClass("show");
            var SubCatMenu = [];
            for (var b = 0; b < SubCategoryWithCategory.length; b++) {
                if (SubCategoryWithCategory[b].Menu_ID == menuid) {
                    SubCatMenu.push(SubCategoryWithCategory[b]);
                }
            }
            var productMenu = "";
            productMenu += '<div class="col-sm-3 megamenu-col">' +
                '<div class="megamenu-block animated fadeInLeft animated-2x">' +
                '<h3 class="megamenu-block-title">' +
                Category[i].Category_Name +
                '</h3>' +
                '<ul class="megamenu-block-list">';
            for (var m = 0; m < SubCatMenu.length; m++) {
                if (Category[i].Category_Name == SubCatMenu[m].Category_Name) {
                    productMenu += '<li> <a class="withripple" href="product_list?ID=' + SubCatMenu[m].SubCategory_ID + '">' + SubCatMenu[m].SubCategory_Name + '</a></li>';
                }
            }
            productMenu += '</li>' +
                '</ul>' +
                '</div>';
            $("#ProductMenu").append(productMenu);
            productMenu = "";
        }
        else if (Category[i].Menu_Name == "Download") {
            $("#DivDownload").addClass("show");
            var SubCatMenu = [];
            for (var b = 0; b < SubCategoryWithCategory.length; b++) {
                if (SubCategoryWithCategory[b].Menu_ID == menuid) {
                    SubCatMenu.push(SubCategoryWithCategory[b]);
                }
            }
            var DownloadMenu = "";
            DownloadMenu += '<li>' +
                '<a class="dropdown-item" href="blog-sidebar.html">' +
                Category[i].Category_Name +
                '</a>' +
                '</li>';
            $("#DownloadMenu").append(DownloadMenu);
            DownloadMenu = "";
        }
        else {
            $("#DivOther").addClass("show");
            var SubCatMenu = [];
            for (var b = 0; b < SubCategoryWithCategory.length; b++) {
                if (SubCategoryWithCategory[b].Menu_ID == menuid) {
                    SubCatMenu.push(SubCategoryWithCategory[b]);
                }
            }
            var OtherMenuString = "";
            OtherMenuString += '<li class="dropdown-submenu">' +
                '<a href="javascript:void(0)" class="dropdown-item has_children" onmouseover="SubmenuOpen(this)">' + Category[i].Category_Name + '</a>' +
                '<ul class="dropdown-menu dropdown-menu-left" id="Submenu">';
            for (var m = 0; m < SubCatMenu.length; m++) {
                if (Category[i].Category_Name == SubCatMenu[m].Category_Name) {
                    OtherMenuString += '<li>' +
                        '<a class="dropdown-item" href="page-about.html">' + SubCatMenu[m].SubCategory_Name + '</a>' +
                        '</li>';
                }
            }
            OtherMenuString += '</ul>' +
                '</li>';
            $("#OtherMenu").append(OtherMenuString);
            OtherMenuString = "";
        }
    }
}

function SubmenuOpen(args) {
    $("#Submenu").next().css("display", "block");
}

function GetHomePageProductLists() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/GetHomePageProductList",
        dataType: "json",
        success: function (res) {
            var HomePageProductString = "";
            var List = JSON.parse(res.d);
            for (var m = 0; m < List.length; m++) {
                var defaultImage;
                if (List[m].ImageName != null)
                    defaultImage = "../SubCategoryImage/" + List[m].ImageName
                else
                    defaultImage = "../ProductImage/No_Image_Available.png";
                HomePageProductString = '<div class="col-xl-3 col-lg-4 col-sm-6">' +
                    '<div class="card">' +
                    '<div class="card-body text-center">' +
                    '<a href="product_list?ID=' + List[m].SubCategory_ID + '" class="product_box"><img src="' + defaultImage + '" alt="' + List[m].ImageName.split('.')[0] + '" class="img-fluid center-block"></a>' +
                    '<h4 class="text-normal text-center product_title">' + List[m].SubCategory_Name + '</h4>' +
                    '<a href="product_list?ID=' + List[m].SubCategory_ID + '" class="btn btn-primary btn-sm btn-block btn-raised mt-2 no-mb"><i class="fa fa-eye"></i>View</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                $("#ContainerHome").append(HomePageProductString);
            }

        },
        error: function (xhr, status, err) {
        }
    });
}
function SendToSubcategoryPage(SubCategory_Name, SubCategory_ID) {
    SubCategoryName = SubCategory_Name;
    $('#InquieryModal').modal({ backdrop: 'static', keyboard: false })
}
function InquiryAdd() {
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
        var obj = {
            "Name": Name,
            "Mobile": Mobile,
            "Address": Address,
            "Email": Email,
            "Subject": Subject,
            "Message": Message,
            "SubCatName": SubCategoryName
        }
        $.ajax({
            async: false,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Default.aspx/AddInquiry",
            data: JSON.stringify(obj),
            dataType: "json",
            success: function (res) {
                ClearInquiryForm();
                $('#InquieryModal').modal("toggle");
                toastr.success("Your inquiry has been successfully !!!")
            },
            error: function (xhr, status, err) {
                toastr.error(xhr.responseJSON.Message);
            }
        });
    } else {
        flage = true;
    }

}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function FindMobileLength(mobile) {
    if (mobile.length >= 10) {
        $("#inputMobile").removeClass("has-error is-focused");
        return true;
    }
    else {
        $("#inputMobile").addClass("has-error is-focused");
        $("#msgMobile").css("display", "block");
        return false;
    }
}

function emailValidOrNot(value) {
    var re = /([A-Z0-9a-z_-][^@])+?@[^$#<>?]+?\.[\w]{2,4}/.test(value);
    if (!re) {
        $("#EmailDiv").addClass("has-error is-focused");
        $("#msgEmail").css("display", "block");
        $("#msgSubEmail").show();
        $("#ErrorMsgEmailvalidate").show();
        return false;
    } else {
        $("#EmailDiv").removeClass("has-error is-focused");
        $("#msgSubEmail").hide();
        $("#ErrorMsgEmailvalidate").hide();
        return true;
    }
}

function ClearInquiryForm() {
    $("#msgMobile").css("display", "none");
    $("#msgEmail").css("display", "none");
    $(".form-group").removeClass("has-error is-focused");
    $("#inputName").val("");
    $("#inputMobile").val("");
    $("#inputAddress").val("");
    $("#inputEmail").val("");
    $("#inputSubject").val("");
    $("#inputMessage").val("");
}

document.addEventListener("contextmenu", function (e) {
    if (e.target.nodeName === "IMG") {
        e.preventDefault();
    }
}, false);

function addCommas(intNum) {
    return (intNum + '').replace(/(\d)(?=(\d{3})+$)/g, '$1,');
}


function AddSubscribe() {
    $("#msgSubEmail").hide();
    var Email = $("#ms-subscribe").val();

    if (Email == "" || Email == undefined) {
        $("#msgSubEmail").show();
        flage = false;
    }
    if (flage == true)
        flage = emailValidOrNot(Email)
    if (flage) {
        $.ajax({
            async: false,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Default.aspx/AddSubsribe",
            data: JSON.stringify({ Email: Email }),
            dataType: "json",
            success: function (res) {
                if (JSON.parse(res.d) == "success") {
                    $("#ms-subscribe").val("");
                    toastr.success("Your Subscribe has been successfully !!!")
                } else {
                    toastr.error("Oops!!! Some problem occured !!!");
                }
            },
            error: function (xhr, status, err) {
                toastr.error(xhr.responseJSON.Message);
            }
        });
    } else {
        flage = true;
    }
}

function Get_Information() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/get_information",
        dataType: "json",
        success: function (res) {
            var data = JSON.parse(res.d);
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var info_string = "";
                    info_string += '<div class="media" style="margin-bottom: 0;"><div class="media-body"><a href="Latest_Update?ID=' + data[i].Information_ID + '"><h4 style="color: #26c6da;">' + data[i].Title + '</h4></a><h4 class="media-heading" style="height: 45px;width:100%;overflow: hidden;"><a href="Latest_Update?ID=' + data[i].Information_ID + '">' + data[i].Description + '</a></h4><div class="media-footer"><span><i class="zmdi zmdi-time color-info-light"></i>' + new Date(data[i].CreatedDate).toDateString() + '</span> </div> </div> </div>';
                    $("#Information_Bind").append(info_string);
                }

            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function set_solution_side_menu(MainMenu, CategoryWithMenu) {
    var solution_side_menu_string = "";
    for (var i = 0; i < MainMenu.length; i++) {
        if (MainMenu[i].Menu_Name == "Solutions") {
            solution_side_menu_string += '<a class="collapsed" role="button" data-toggle="collapse" href="#sc6" aria-expanded="false" aria-ontrols="sc6"><i class="zmdi zmdi-collection-image-o"></i>' + MainMenu[i].Menu_Name + '</a>' +
                '<ul id="sc6" class="card-collapse collapse" role="tabpanel" aria-labelledby="solution_side_menu" data-parent="#slidebar-menu">';
            for (var x = 0; x < CategoryWithMenu.length; x++) {
                if (MainMenu[i].Menu_Name == CategoryWithMenu[x].Menu_Name)
                    solution_side_menu_string += '<li><a href="#">' + CategoryWithMenu[x].Category_Name + '</a></li>';
            }
            solution_side_menu_string += '</ul>'
        }
    }
    $("#solution_side_menu").append(solution_side_menu_string);
}

function get_all_hotProducts() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Default.aspx/get_all_hot_products",
        dataType: "json",
        success: function (res) {
            var data = JSON.parse(res.d);
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var hot_product_string = "";
                    var image_str = "";
                    if (data[i].Image_name != null)
                        image_str = "../ProductImage/" + data[i].Image_name;
                    else
                        image_str = "../ProductImage/No_Image_Available.png";
                    hot_product_string += '<div class="col-lg-4 col-md-6">' +
                        '<div class="card wow zoomInUp" style="height: 530px;">' +
                        '<div class="card-body text-center" style="height: 100%;">' +
                        '<a href="product?ID=' + data[i].Product_ID + '"><img style="height: 52%;" alt="" src="' + image_str + '" class="img-fluid center-block"></a>' +
                        '<h4 class="text-normal text-center">' + data[i].Product_Title + '</h4>' +
                        '<p style="overflow: hidden;height: 80px;">' + data[i].Product_short_description + '</p>' +
                        '<div class="mt-2"><span class="ms-tag ms-tag-success" style="font-size: 20px;">₹ ' + addCommas(data[i].Product_Price) + '</span></div>' +
                        '<a href="javascript:void(0)" onclick="SendToSubcategoryPage(\'' + data[i].Product_Title + '\',\'' + data[i].Product_ID + '\')" class="btn btn-primary btn-sm btn-block btn-raised mt-2 no-mb"><i class="fa fa-info"></i>Inquiry</a>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                    $("#hot_product").append(hot_product_string);
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}