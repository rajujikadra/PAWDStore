$(document).ready(function () {
    getMyOrder();
});

function getMyOrder() {
    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebPages/MyOrder.aspx/GetAllOrders",
        dataType: "json",
        success: function (res) {
            var status = JSON.parse(res.d);
            var str = "";
            if (status.length > 0) {
                for (var i = 0; i < status.length; i++) {
                    str += '<tr>';
                    str += '<td>' + status[i].Order_No + '</td>';
                    str += '<td>' + status[i].BName + '</td>';
                    str += '<td>' + status[i].BEmail + '</td>';
                    str += '<td>' + status[i].BMobile + '</td>';
                    str += '<td>' + status[i].OrderDate.split("T")[0] + '</td>';
                    str += '<td><a href="vieworder?ID=' + status[i].Order_ID + '"  class="btn btn-sm btn-raised btn-primary"><i class="fa fa-eye"></i>View Order<div class="ripple-container"></div></a></td>';
                    str += '</tr>';
                }
               
            } else {
                str += '<tr><td colspan="6">No order available</td></tr>';
            }
            $("#MyOrderTbl tbody").empty();
            $("#MyOrderTbl tbody").append(str);
        },
        error: function (xhr, status, err) {
            toastr.error(xhr.responseJSON.Message);
        }
    });
}