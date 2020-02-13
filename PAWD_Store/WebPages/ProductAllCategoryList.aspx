<%@ Page Title="Product Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductAllCategoryList.aspx.cs" Inherits="PAWD_Store.WebPages.ProductAllCategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="material-background"></div>
    <div class="container container-full">
        <div class="card animated slideInUp animation-delay-8 mb-6">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="card-title" style="font-size: 22px;">
                        <i class="zmdi zmdi-graduation-cap"></i>PRODUCTS</h3>
                </div>
                <div id="Product_menu_bind">
                </div>
                <%--<table class="table table-no-border table-striped">
                <tbody id="bind_product_specification">
                
                </tbody>
            </table>--%>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        var ThirdCat = [];
        $(document).ready(function () {
            get_all_third_category();
            Get_product_all_category();
        });

        function get_all_third_category() {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebPages/ProductAllCategoryList.aspx/GetThirCat",
                dataType: "json",
                success: function (res) {
                    ThirdCat = JSON.parse(res.d);
                },
                error: function (xhr, status, err) {

                }
            });
        }

        function Get_product_all_category() {
            $.ajax({
                async: false,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebPages/ProductAllCategoryList.aspx/Getproduct_all_category",
                dataType: "json",
                success: function (res) {
                    var data = JSON.parse(res.d);
                    var Category = [];
                    var Category_string = "";
                    for (var i = 0; i < data.length; i++) {
                        Category.push(data[i].Category_Name);
                    }
                    function onlyUnique(value, index, self) {
                        return self.indexOf(value) === index;
                    }
                    var AllCategory = Category.filter(onlyUnique);

                    for (var x = 0; x < AllCategory.length; x++) {
                        Category_string += '<table class="table table-no-border table-striped">' +
                            '<thead><tr><th style="color:#a92e09;">' + AllCategory[x] + '</th></tr></thead>';
                        for (var y = 0; y < data.length; y++) {
                            if (AllCategory[x] == data[y].Category_Name) {
                                Category_string += '<tbody><tr><td style="width: 100%;"><b><a  style="margin-left: 30px;" href="product_list?ID=' + data[y].SubCategory_ID + '">' + data[y].SubCategory_Name + '</a></b></td></tr>';
                                for (var i = 0; i < ThirdCat.length; i++) {
                                    if (data[y].SubCategory_ID == ThirdCat[i].SubCategory_ID) {
                                        Category_string += '<tr><td style="width: 100%;"><b><a  style="margin-left: 60px;">' + ThirdCat[i].ThirdCategory_Name + '</a></b></td></tr>';
                                    }
                                }
                                Category_string += '</tbody> ';
                            }
                        }
                        Category_string += '</table>';
                    }
                    $("#Product_menu_bind").append(Category_string);
                },
                error: function (xhr, status, err) {

                }
            });
        }
    </script>
</asp:Content>

