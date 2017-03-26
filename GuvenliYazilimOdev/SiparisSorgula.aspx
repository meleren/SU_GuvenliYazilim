<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiparisSorgula.aspx.cs" Inherits="SiparisSorgula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="Script/jquery-1.12.0.min.js"></script>
    <script src="Script/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
       <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">KIRTASİYE SANAL MAĞAZA</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="SiparisSorgula.html">Bekleyen Siparişler</a></li>
                    <li><a href="FaturaSorgula.html">Kesilen Faturalar</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">

            <ul data-role="listview" data-style="inset" data-type="group">
                <li>
                    Africa
                    <ul id="veriekle">
                        <li data-icon="toprated"><a>Nairobi</a></li>
                    </ul>
                </li>
            </ul>
            <script>

                $(document).ready(function () {


                    $.ajax({
                        url: 'SiparisSorgula.aspx/GetAll',
                        contentType: "application/json; charset=utf-8",
                        data: "{ }",
                        dataType: 'json',
                        async: true,
                        cache: false,
                        type: 'POST',
                        //async: true,
                        success: function (response) {
                            /* if (response.statusCode == 200) {
                                 document.location.href = "Login.aspx";
                             }*/
                            console.log(response.statusCode);
                            var obj = JSON.parse(response.d, function (key, value) {

                                var wrapperDiv = $('<li/>', {
                                    "class": "wrapper"
                                });
                                wrapperDiv
                                    .append(key + " " + value);
                                $("#veriekle").append(wrapperDiv);

                            });

                        },
                        error: function (e) {
                            alert('Error121212: ');
                        }
                    });
                });

            </script>

        </div>
    </form>
</body>
</html>
