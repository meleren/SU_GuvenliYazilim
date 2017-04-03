<%@ Page Title="" Language="C#" MasterPageFile="~/Bayi.master" AutoEventWireup="true" CodeFile="UrunSorgula1.aspx.cs" Inherits="UrunSorgula1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container">
           <div class="form-group">
                <div class="col-sm-1 ">
                       Ürün Adı
                </div>
                 <div class="col-sm-2">
                       <input class="form-control" id="urunadi" type="text"/>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="Sorgula" class="btn btn-lg"  style="width: 100%;">Sorgula</button>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="Yenibtn" class="btn btn-lg" onclick="Yeni()" style="width: 100%;">Yeni Ürün</button>
                 </div>
            </div>
           <div class="form-group">
                <div class="col-sm-12">
                <div id="Yenikayityeri" >
                     
                <div class="col-sm-1 ">
                       Ürün Adı
                     <input  id="yeniid" type="text" hidden="hidden"/>
                </div>
                 <div class="col-sm-2">
                       <input class="form-control" id="yeniurunadi" type="text"/>
                </div>
                <div class="col-sm-1 ">
                       Birimi
                </div>
                 <div class="col-sm-1">
                       <input class="form-control" id="yenibirim" type="text"/>
                </div>
                <div class="col-sm-1 ">
                       Birim Fiyat
                </div>
                 <div class="col-sm-1">
                       <input class="form-control" id="yenifiyat" type="text"/>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="KaydetBtn" class=" btn btn-lg" onclick="Kaydet()" style="width: 100%;">Kaydet</button>
                </div>
                  <div class="col-sm-2">
                      <button type="button" id="Vazgecbtn" class="btn btn-lg" onclick="Vazgec()" style="width: 100%;">Vazgeç</button>
                </div>
 
                </div>

                        <table class="table" id="table1">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Ürün Adı</th>
                                    <th>Birim</th>
                                    
                                    <th>Birim Fiyat (TL)</th>
                                </tr>
                            </thead>
                            <tbody id="eklenecek"></tbody>
                        </table>
                   
                </div>
            </div>
           
            
    </div>

    <script>
        function UrunAdiAl() {
            var Sonuc = document.getElementById("urunadi");
            console.log("x" + Sonuc.value + "x");
            return (Sonuc.value)
        }
        function Kaydet() {
            var ID = document.getElementById("yeniid");
            var idxx = 0;
            if (ID.value != "") idxx = ID.value;
            console.log(idxx);
            var Tanimxx = document.getElementById("yeniurunadi").value;

            var Birimxx = document.getElementById("yenibirim").value;

            var BirimFiyatxx = document.getElementById("yenifiyat").value;
            var Gelen = { 'Id': idxx, 'Tanim': Tanimxx, 'Birim': Birimxx, 'BirimFiyat': BirimFiyatxx };
            //use JSON.stringify to convert it to json string
            var jsonstring = JSON.stringify(Gelen);
            console.log(jsonstring);
            $.ajax({
                type: "POST",
                url: 'UrunSorgula.aspx/UrunKaydet',
                data: JSON.stringify({ 'Gelen': Gelen }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                },
                fail: {}
            });
            Sorgu();
            Vazgec();
        }
        function CallPageMethod(ID) {
            var id = ID;
            console.log(id);
            $.ajax({
                type: "POST",
                url: 'UrunSorgula.aspx/UrunSil',
                data: '{ Id: ' + id + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: {},
                fail: {}
            });
            Sorgu();
        }
        function Onayal() {
            return confirm('Kayıt silinecek, emin misiniz?');
        }

        function Delete(Id) {

            if (Onayal()) {
                CallPageMethod(Id);
            }
        }
        function Gizle() {
            document.getElementById("Yenikayityeri").style.visibility = "hidden";
        }
        function Edit(Id) {
            console.log(Id);
            var Tanim = "";
            var Birim = "";
            var BirimFiyat = 0;
            $.ajax({
                url: 'UrunSorgula.aspx/GetUrun',
                contentType: "application/json; charset=utf-8",
                data: '{ Id: ' + Id + '}',
                dataType: 'json',
                async: true,
                cache: false,
                type: 'POST',
                //async: true,
                success: function (response) {
                    //console.log(response.d);

                    var obj = JSON.parse(response.d, function (key, value) {
                        console.log(key);
                        if (key == "Tanim") {
                            Tanim = value;
                            document.getElementById("yeniurunadi").value = Tanim;
                        }
                        if (key == "Birim") {
                            Birim = value;
                            document.getElementById("yenibirim").value = Birim;
                        }
                        if (key == "BirimFiyat") {
                            BirimFiyat = value;
                            document.getElementById("yeniid").value = Id;


                            document.getElementById("yenifiyat").value = BirimFiyat;
                            document.getElementById("Yenikayityeri").style.visibility = "";
                        }
                    });
                },
                error: function (e) {
                    alert('Hata: ');
                }
            });
            console.log("Tanimaaaaaaaaa");
            console.log(Tanim);
        }
        function Yeni() {
            console.log("xxx");
            document.getElementById("yeniid").value = 0;
            document.getElementById("yeniurunadi").value = "";
            document.getElementById("yenibirim").value = "";
            document.getElementById("yenifiyat").value = 0;
            document.getElementById("Yenikayityeri").style.visibility = "";
        }
        function Vazgec() {
            console.log("xxx");
            document.getElementById("yeniid").value = 0;
            document.getElementById("yeniurunadi").value = "";
            document.getElementById("yenibirim").value = "";
            document.getElementById("yenifiyat").value = 0;
            document.getElementById("Yenikayityeri").style.visibility = "hidden";
        }
        function Sorgu() {
            var id = UrunAdiAl();

            $.ajax({
                url: 'UrunSorgula.aspx/GetUrunListesi',
                contentType: "application/json; charset=utf-8",
                data: '{ Tanim: "' + id + '"}',
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
                        if (key == "Id") {
                            // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                            var bas = "<tr><td> <button type='button' class='btn-link' onclick='Delete(" + value + ")'> Sil </button>"
                                  + "     <button type='button' class='btn-link' onclick='Edit(" + value + ")'>Değiştir</button></td>";

                            str = str + bas; //+ "<td> " + value + " </td>";
                        }
                        if (key == "Tanim") {
                            str = str + "<td> " + value + " </td>";
                        }
                        if (key == "Birim") {
                            str = str + "<td> " + value + " </td>";
                        }
                        if (key == "BirimFiyat") {
                            str = str + "<td> " + value + " </td></tr>";
                        }
                    });
                    $('#eklenecek').html(str);
                },
                error: function (e) {
                    alert('Hata: ');
                }
            });
        }
        $(document).ready(function () {
            Gizle();
            $('#Sorgula').click(function () {
                Sorgu();
                document.getElementById("Yenikayityeri").style.visibility = "hidden";
            });
        });
    </script>

</asp:Content>
