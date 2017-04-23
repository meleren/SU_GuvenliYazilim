<%@ Page Title="" Language="C#" MasterPageFile="~/Toptanci.Master" AutoEventWireup="true" CodeBehind="FaturaSorgula1.aspx.cs" Inherits="GuvenliYazilim_VersiyonKontrollu2.FaturaSorgula1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
           <div class="form-group">
                <div class="col-sm-1 ">
                       Bayi Adı
                </div>
                 <div class="col-sm-2">
                       <input class="form-control" id="bayiadi" type="text"/>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="Sorgula" class=" btn btn-lg" style="width: 100%;"> Sorgula</button>
                </div>
            </div>
         <h3>Fatura Listesi</h3>
           <div class="form-group">
               <div class="col-sm-10">
                   

                        <table class="table" id="table1">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fatura No</th>
                                    <th>Tarih</th>
                                    <th>Bayi Adı</th>
                                    <th>Tutar (TL)</th>
                                </tr>
                            </thead>
                            <tbody id="eklenecek"></tbody>
                        </table>
                   
                </div>
            </div>
           
            
    </div>

    <script>

        function BayiAdiAl() {

            var Sonuc = document.getElementById("bayiadi");
            console.log("x" + Sonuc.value + "x");
            return (Sonuc.value)
        }
        $(document).ready(function () {
            $('#Sorgula').click(function () {
                var id = BayiAdiAl();

                console.log(id);
                $.ajax({
                    url: 'FaturaSorgula1.aspx/FaturaGetir',
                    contentType: "application/json; charset=utf-8",
                    data: '{ BayiAdi: "' + id + '"}',
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
                            if (key == "FaturaNo") {
                                // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                                var bas = "<tr><td><p data-placement='top' data-toggle='tooltip' title='Edit'> <a href='FaturaDetay.aspx?Id=" + value + "' class='ui-shadow ui-btn ui-corner-all ui-btn-inline' data-close-btn='right'>Fatura Detayı</a></p></td>";
                                str = str + bas + "<td> " + value + " </td>";
                            }
                            if (key == "Tarih")
                                str = str + "<td> " + value + " </td>";
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
        });
    </script>
</asp:Content>