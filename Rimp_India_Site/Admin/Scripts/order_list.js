$(document).ready(function () {
    GetAllOrders();
});
function GetAllOrders() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/OrderList.aspx/GetAllOrders",
        dataType: "json",
        success: function (res) {
            var Items = JSON.parse(res.d);
            if (Items != null && Items != undefined) {
                var table = $('#example').DataTable()
                table.destroy();
                $('#example').DataTable({
                    data: Items,
                    "iDisplayLength": 5,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    retrieve: true,
                    'paging': true,
                    'sort': true,
                    'searching': true,
                    columns: [
                        { data: "Order_No" },
                        { data: "Email" },
                        { data: "OrderStatus" },
                        {
                            data: function (data, type, row) {
                                return data.OrderDate.split("T")[0];
                            }
                        },
                        {
                            data: function (data, type, row) {
                                return '<button type="button" class="btn btn-outline-primary btn-sm" onclick="ViewOrder(' + data.Order_ID + ')"><i class="fa fa-eye"></i>&nbsp; View</button>';
                            },
                            "orderable": false
                        }
                    ]
                });
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function ViewOrder(Order_ID) {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Admin/Pages/OrderList.aspx/GetOrderItems",
        data: JSON.stringify({ Order_ID: Order_ID }),
        dataType: "json",
        success: function (res) {
            var Items = JSON.parse(res.d);
            if (Items != null) {
                $("#B_name").text(Items.BName);
                $("#B_email").text(Items.BEmail);
                $("#B_mobile").text(Items.BMobile);
                $("#B_address").text(Items.BAddress);
                $("#B_city").text(Items.BCity);
                $("#B_state").text(Items.BState);
                $("#B_zipcode").text(Items.BZipcode);
                $("#S_name").text(Items.SName);
                $("#S_email").text(Items.SEmail);
                $("#S_mobile").text(Items.SMobile);
                $("#S_address").text(Items.SAddress);
                $("#S_city").text(Items.SCity);
                $("#S_state").text(Items.SState);
                $("#S_zipcode").text(Items.SZipcode);
                $("#Order_No").text(Items.Order_No);
                $("#Order_date").text(Items.OrderDate.split("T")[0]);
                $("#Order_Method").text(Items.OrderType);

                if (Items.OrderItem.length > 0) {
                    var str = "";
                    var SubTotal = 0;
                    for (var i = 0; i < Items.OrderItem.length; i++) {
                        var Total = (parseInt(Items.OrderItem[i].Quantity) * parseInt(Items.OrderItem[i].Product_Price));
                        SubTotal = SubTotal + (parseInt(Items.OrderItem[i].Product_Price) * parseInt(Items.OrderItem[i].Quantity));
                        str += '<tr>';
                        str += '<td><img style="height: 80px; width: 95px;" src="../ProductImage/' + Items.OrderItem[i].ImageName + '" onError="imgError(this);" /></td>';
                        str += ' <td><a href="product?ID=' + Items.OrderItem[i].Product_ID + '">' + Items.OrderItem[i].Product_Title + '</a></td>';
                        str += '<td>' + Items.OrderItem[i].Quantity + '</td>';
                        str += '<td>' + addCommas(Total) + '</td>';
                        str += '</tr>';
                    }

                    var Tax = 0;
                    var Shipping = 0;
                    if (SubTotal < 1000 && SubTotal > 0)
                        Tax = 30;
                    else if (SubTotal < 5000 && SubTotal > 1001)
                        Tax = 35;
                    else if (SubTotal < 10000 && SubTotal > 5001)
                        Tax = 40;
                    else
                        Tax = 50;

                    if (SubTotal < 1000 && SubTotal > 0)
                        Shipping = 35;
                    else if (SubTotal < 5000 && SubTotal > 1001)
                        Shipping = 40;
                    else if (SubTotal < 10000 && SubTotal > 5001)
                        Shipping = 45;
                    else
                        Shipping = 50;

                    var GrandTotal = (SubTotal + Tax + Shipping);
                    str += '<tr style="color: white; background: burlywood;"><td colspan="2"></td><td>Tax</td><td>' + Tax + '</td></tr>';
                    str += '<tr style="background: orange; color: white;"><td colspan="2"></td><td>Shipping costs</td><td>' + Shipping + '</td></tr>';
                    str += '<tr style="color: white; background: green;"><td colspan="2"></td><td>Grand Total</td><td>' + addCommas(GrandTotal) + '</td></tr>';
                    $("#ProductImage tbody").empty();
                    $("#ProductImage tbody").append(str);
                } else {
                    var strs = "";
                    strs += '<tr><td colspan="4"></td></tr>';
                    $("#ProductImage tbody").empty();
                    $("#ProductImage tbody").append(str);
                }
            }
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}

function imgError(image) {
    image.onerror = "";
    image.src = "../assets/img/No_Image_Available.png";
    return true;
}
function addCommas(intNum) {
    return (intNum + '').replace(/(\d)(?=(\d{3})+$)/g, '$1,');
}
