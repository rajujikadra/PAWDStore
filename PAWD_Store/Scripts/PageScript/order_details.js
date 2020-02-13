
function GetOrderDetails(data, OID) {
    debugger;
    if (data !== null) {
        $("#Order_No").text(data.Order_No);
        var num = data.OrderDate.match(/\d+/g); //regex to extract numbers 
        var date = new Date(parseFloat(num)); //converting to date
        $("#Order_date").text(date.getMonth() + 1 + "-" + date.getDate() + '-' + date.getFullYear());

        var str = "";
        for (var i = 0; i < data.OrderItems.length; i++) {
            var Total = (parseInt(data.OrderItems[i].Quantity) * parseInt(data.OrderItems[i].Product_Price));
            str += '<article class="card card-primary wow zoomInRight animation-delay-5 mb-4">';
            str += '<div class="card-body">';
            str += '<div class="row">';
            str += '<div class="col-xl-3">';
            str += '<img src="../ProductImage/' + data.OrderItems[i].ImageName + '" alt="" class="img-fluid mb-4" onError="imgError(this);" />';
            str += '</div>';
            str += '<div class="col-xl-9">';
            str += '<h3 class="no-mt"><a href="product?ID=' + data.OrderItems[i].Product_ID + '">' + data.OrderItems[i].Product_Title + '</a></h3>';
            str += '<p>' + data.OrderItems[i].ProductShortDescription + '</p>';
          
            str += '<ul class="list-unstyled"><li><strong>Quantity: </strong>' + data.OrderItems[i].Quantity + '</li>';
            if (data.OrderItems[i].ProductSize.trim() != "" && data.OrderItems[i].ProductSize.trim() != null && data.OrderItems[i].ProductSize.trim() != undefined) {
                str += '<li><strong>Size: </strong>' + data.OrderItems[i].ProductSize + '</li>';
            }
            str += '</ul><h4 class="color-success no-m text-normal">₹ ' + addCommas(Total) + '</h4>';
            str += '</div>';
            str += '</div>';
            str += '</div>';
            str += '</article>';
        }
        $("#OrderDetailsDiv").empty();
        $("#OrderDetailsDiv").append(str);
    }
}
