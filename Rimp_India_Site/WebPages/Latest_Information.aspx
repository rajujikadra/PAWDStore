<%@ Page Title="Latest-Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Latest_Information.aspx.cs" Inherits="Rimp_India_Site.WebPages.Latest_Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ms-hero-page-override ms-hero-img-city ms-hero-bg-dark-light">
        <div class="container">
            <div class="text-center">
                <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Latest  Updates</h1>
                <p class="lead lead-lg color-white text-center center-block mt-2 mw-800 text-uppercase fw-300 animated fadeInUp animation-delay-7">
                    Check out the most
              <span class="color-info">latest update</span> about our product. If after reading this section you still have some doubt, do not hesitate to
              <span class="color-info">contact us</span>.
                </p>
            </div>
        </div>
    </div>
    <div class="container container-full">
        <div class="ms-paper">
            <div class="row">
                <div class="col-lg-12 ms-paper-content-container">
                    <div class="ms-paper-content">
                        <section class="ms-component-section" id="Bind_Latest_Information">
                            <%--  <asp:Repeater ID="RepeatInformation" runat="server">
                                <ItemTemplate>
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <a href="<%# GetRouteUrl("Latest_Update", new {ID = Eval("Information_ID") }) %>">
                                                
                                                <h3 class="panel-title">
                                                    <i class="fa fa-globe"></i><%#DataBinder.Eval(Container,"DataItem.Title")%></h3>
                                            </a>
                                        </div>
                                        <div class="panel-body">
                                            <p><%#DataBinder.Eval(Container,"DataItem.Description")%> </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>--%>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function bind_latest_update(data) {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var str = "";
                    str += '<div class="panel panel-primary"> <div class="panel-heading"><a href="Latest_Update?ID=' + data[i].Information_ID + '"><h3 class="panel-title"><i class="fa fa-globe"></i>' + data[i].Title + '</h3></a> </div><div class="panel-body"><p>' + data[i].Description + '</p></div></div>';
                    $("#Bind_Latest_Information").append(str);
                }
            }
        }
    </script>


</asp:Content>
