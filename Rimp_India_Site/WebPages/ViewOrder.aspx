<%@ Page Title="ViewOrder" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="Rimp_India_Site.WebPages.ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="material-background"></div>
    <div class="container text-center mb-6">
        <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Order Details</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-2 text-left">Order Number :</div>
                            <div class="col-md-1 text-left" id="Order_No"></div>
                            <div class="col-md-2 text-left">Order Date :</div>
                            <div class="col-md-1 text-left" id="Order_date"></div>
                            <div class="col-md-2 text-left">Payment Method :</div>
                            <div class="col-md-1 text-left" id="Order_Type"></div>
                            <div class="col-md-1 text-left">Status :</div>
                            <div class="col-md-2 text-left" id="Order_Status"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title" style="font-size: 22px;">
                            <i class="zmdi zmdi-graduation-cap"></i>Billing Information</h3>
                    </div>
                    <table class="table table-no-border table-striped" id="tblBilling">
                        <thead>
                            <tr>
                                <th style="color: #a92e09;"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Name </b></td>
                                <td id="B_name">For all breeds and life stages.</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Email </b></td>
                                <td id="B_email">Chicken meal</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Mobile </b></td>
                                <td id="B_mobile">Crude Fibre </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Address </b></td>
                                <td id="B_address">11.4 Kg</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>City </b></td>
                                <td id="B_city">Vitamin A, </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>State </b></td>
                                <td id="B_state">Adult and Puppy Food	</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Zipcode  </b></td>
                                <td id="B_zipcode">Adult and Puppy Food	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title" style="font-size: 22px;">
                            <i class="zmdi zmdi-graduation-cap"></i>Shipping Information</h3>
                    </div>
                    <table class="table table-no-border table-striped" id="tblShipping">
                        <thead>
                            <tr>
                                <th style="color: #a92e09;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Name </b></td>
                                <td id="S_name">For all breeds and life stages.</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Email </b></td>
                                <td id="S_email">Chicken meal</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Mobile </b></td>
                                <td id="S_mobile">Crude Fibre </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Address </b></td>
                                <td id="S_address">11.4 Kg</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>City </b></td>
                                <td id="S_city">Vitamin A, </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>State </b></td>
                                <td id="S_state">Adult and Puppy Food	</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td style="width: 50%;"><b>Zipcode  </b></td>
                                <td id="S_zipcode">Adult and Puppy Food	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" id="OrderDetailsDiv">
                <article class="card card-primary wow zoomInRight animation-delay-5 mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-3">
                                <img src="../assets/img/black_wall.png" alt="" class="img-fluid mb-4">
                            </div>
                            <div class="col-xl-9">
                                <h3 class="no-mt">
                                    <a href="javascript:void(0)">Earum delectus libero ipsa temporibus in minus</a>
                                </h3>
                                <p>Lorem ipsum dolor sit amet, consectetur alter adipisicing elit. Facilis, natuse inse voluptates officia repudianda beatae magni es repudiandae beatae magni magnam autem natuse inse on voluptates elit sit molestias.</p>
                                <ul class="list-unstyled">
                                    <li><strong>Quantity: </strong>5</li>

                                </ul>
                                <h4 class="color-success no-m text-normal">₹ 6,199</h4>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-2 text-left">Tax :</div>
                            <div class="col-md-2 text-left" id="txtTax"></div>
                            <div class="col-md-2 text-left">Shipping Charge :</div>
                            <div class="col-md-2 text-left" id="txtShippingCharge"></div>
                            <div class="col-md-2 text-left">Grand Total :</div>
                            <div class="col-md-2 text-left" id="txtGrandTotal"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function GetOrderDetails(data, OID) {
            if (data !== null) {
                $("#Order_No").text(data.Order_No);
                var num = data.OrderDate.match(/\d+/g); //regex to extract numbers 
                var date = new Date(parseFloat(num)); //converting to date
                $("#Order_date").text(date.getMonth() + 1 + "-" + date.getDate() + '-' + date.getFullYear());
                $("#B_name").text(date.BName);
                $("#B_email").text(date.BEmail);
                $("#B_mobile").text(date.BMobile);
                $("#B_address").text(date.BAddress);
                $("#B_city").text(date.BCity);
                $("#B_state").text(date.BState);
                $("#B_zipcode").text(date.BZipcode);
                $("#S_name").text(date.SName);
                $("#S_email").text(date.SEmail);
                $("#S_mobile").text(date.SMobile);
                $("#S_address").text(date.SAddress);
                $("#S_city").text(date.SCity);
                $("#S_state").text(date.SState);
                $("#S_zipcode").text(date.SZipcode);
                $("#Order_Type").text(data.OrderType);
                $("#Order_Status").text(data.OrderStatus);
                var str = "";
                var SubTotal = 0;
                for (var i = 0; i < data.OrderItem.length; i++) {
                    var Total = (parseInt(data.OrderItem[i].Quantity) * parseInt(data.OrderItem[i].Product_Price));
                    SubTotal = SubTotal + (parseInt(data.OrderItem[i].Product_Price) * parseInt(data.OrderItem[i].Quantity));
                    str += '<article class="card card-primary wow zoomInRight animation-delay-5 mb-4">';
                    str += '<div class="card-body">';
                    str += '<div class="row">';
                    str += '<div class="col-xl-3">';
                    str += '<img src="../ProductImage/' + data.OrderItem[i].ImageName + '" alt="" class="img-fluid mb-4" onError="imgError(this);" />';
                    str += '</div>';
                    str += '<div class="col-xl-9">';
                    str += '<h3 class="no-mt"><a target="_blank" href="product?ID=' + data.OrderItem[i].Product_ID + '">' + data.OrderItem[i].Product_Title + '</a></h3>';
                    str += '<p>' + data.OrderItem[i].ProductShortDescription + '</p>';
                    str += '<ul class="list-unstyled"><li><strong>Quantity: </strong>' + data.OrderItem[i].Quantity + '</li></ul><h4 class="color-success no-m text-normal">₹ ' + addCommas(Total) + '</h4>';
                    str += '</div>';
                    str += '</div>';
                    str += '</div>';
                    str += '</article>';
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
                $("#txtTax").text("₹ " + Tax);
                $("#txtShippingCharge").text("₹ " + Shipping);
                $("#txtGrandTotal").text("₹ " + addCommas(GrandTotal));
                $("#OrderDetailsDiv").empty();
                $("#OrderDetailsDiv").append(str);
            }
        }
    </script>
</asp:Content>
