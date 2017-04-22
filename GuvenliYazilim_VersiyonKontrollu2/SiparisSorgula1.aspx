<%@ Page Title="" Language="C#" MasterPageFile="~/Toptanci.Master" AutoEventWireup="true" CodeBehind="SiparisSorgula1.aspx.cs" Inherits="GuvenliYazilim_VersiyonKontrollu2.SiparisSorgula1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <h2>Fatura Kesilecek Siparişler</h2>
           <div class="form-group">
                <div class="col-sm-10">
                   

                        <table class="table" id="table1">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SiparisNo</th>
                                    <th>BayiAdi</th>
                                    <th>Tutar (TL)</th>
                                </tr>
                            </thead>
                            <tbody id="eklenecek"></tbody>
                        </table>
                   
                </div>
            </div>
           
            
    </div>

    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'SiparisSorgula1.aspx/GetAll',
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
                    console.log(response.d);
                    var str = "";
                    var obj = JSON.parse(response.d, function (key, value) {
                        if (key == "SiparisNo") {
                            // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                            var bas = "<tr><td><p data-placement='top' data-toggle='tooltip' title='Edit'> <a href='SiparisDetay.aspx?Id=" + value + "' class='ui-shadow ui-btn ui-corner-all ui-btn-inline' data-close-btn='right'>Sipariş Detayı</a></p></td>";
                            str = str + bas + "<td> " + value + " </td>";
                        }
                        if (key == "BayiAdi")
                            str = str + "<td> " + value + " </td>";
                        if (key == "Tutar")
                            str = str + "<td> " + value + " </td></tr>";
                    });
                    $('#eklenecek').html(str);
                },
                error: function (e) {
                    alert('Hata: ');
                }
            });
        });
    </script>




</asp:Content>