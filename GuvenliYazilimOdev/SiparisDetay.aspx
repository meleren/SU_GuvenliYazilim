<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiparisDetay.aspx.cs" Inherits="SiparisDetay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="Script/jquery-1.12.0.min.js"></script>
    <script src="Script/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div id="BayiAdi">

        </div>
        <form class="form-horizontal">
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                </div>
                <div class="col-sm-10">


                    <table class="table" id="table1">
                        <thead>
                            <tr>
                               
                                <th>Ürün Adı</th>
                                <th>Birim</th>
                                <th>Miktar</th>
                                <th>Birim Fiyat</th>
                                <th>Tutar (TL)</th>
                            </tr>
                        </thead>
                        <tbody id="eklenecek"></tbody>
                    </table>

                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <button type="button" id="Faturalandir" class=" btn  btn-lg" style="width: 100%;"> Fatura Kes</button>
                </div>
                <div class="col-sm-offset-2 col-sm-2">
                  
                    <a href='SiparisSorgula1.aspx' class='btn  btn-lg' data-close-btn='right'>Geri</a>
                </div>
         </div>
        </form>
    </div>

    <script>
        var URL = location.href

        function queryString(Deger) {
            if (Deger != null) {
                var regEx = new RegExp("(\\?|&)(" + Deger + "=)(.*?)(&|$|#)", "i")
                var exec = regEx.exec(URL)
                var Sonuc = RegExp.$3
            } else {
                var regEx = new RegExp("(\\?)(.*?)($)", "i")
                var exec = regEx.exec(URL)
                var Sonuc = RegExp.$2
            }

            return (Sonuc)
        }

        $(document).ready(function () {
            var id = queryString("Id");
            console.log(id);
            $.ajax({
                url: 'SiparisSorgula1.aspx/GetDetay',
                contentType: "application/json; charset=utf-8",
                data: '{ SiparisNo:' + id + '}',
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
                    var BayiAdi = "";
                    var Adres = "";

                    var obj = JSON.parse(response.d, function (key, value) {

                        if (key == "UrunAdi") {
                            // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                            var bas = "<tr>";

                            str = str + bas + "<td> " + value + " </td>";
                        }
                        if (key == "BayiAdi") {
                            BayiAdi = "<h3>Sipariş No : " + id + "<p/>";
                            BayiAdi = BayiAdi + "Bayi : " + value + "</h3>";
                        }
                        if (key == "Adres") {
                            Adres = "<h4>Adres : " + value + "</h4>";
                        }

                        if (key == "Birim")
                            str = str + "<td> " + value + " </td>";
                        if (key == "Miktar")
                            str = str + "<td> " + value + " </td>";
                        if (key == "BirimFiyat")
                            str = str + "<td> " + value + " </td>";

                        if (key == "Tutar")
                            str = str + "<td> " + value + " </td></tr>";
                        console.log(value);



                    });
                    console.log(BayiAdi);
                    $('#eklenecek').html(str);
                    $('#BayiAdi').html(BayiAdi + Adres);
                },
                error: function (e) {
                    alert('Error121212: ');
                }
            });


        });


        $(document).ready(function () {
            $('#Faturalandir').click(function () {
                var id = queryString("Id");
                $.ajax({
                    url: 'SiparisSorgula1.aspx/FaturaKayit',
                    contentType: "application/json; charset=utf-8",
                    data: '{ SiparisNo:' + id + '}',
                    dataType: 'json',
                    async: true,
                    cache: false,
                    type: 'POST',
                    //async: true,
                    success: function (response) {
                        var obj = JSON.parse(response.d, function (key, value) {
                            console.log(response.d);
                            if (key == "Id") {
                                if (value == 0)
                                    alert('Hata oluştu');
                                else {
                                    alert('Fatura oluşturuldu ');
                                    window.location.assign("SiparisSorgula1.aspx");
                                }
                            }
                        });

                    },
                    error: function (e) {
                        alert('Error121212: ');
                    }
                });
            });
        });

    </script>



</body>
</html>