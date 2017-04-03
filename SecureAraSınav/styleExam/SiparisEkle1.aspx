<%@ Page Title="" Language="C#" MasterPageFile="~/Bayi.master" AutoEventWireup="true" CodeFile="SiparisEkle1.aspx.cs" Inherits="SiparisEkle1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container">
 
           <div class="form-group">
                <div class="col-sm-12">
                <div id="Yenikayityeri" >
                     
                <div class="col-sm-1 ">
                       Ürün ID
                     <input  id="yeniid" type="text" hidden="hidden"/>
                     <input  id="bayiid" type="text" hidden="hidden"/>
                </div>
                 <div class="col-sm-2">
                       <input class="form-control" id="yeniurunid" type="text"/>
                </div>
                <div class="col-sm-1 ">
                       Miktar
                </div>
                 <div class="col-sm-1">
                       <input class="form-control" id="yenimiktar" type="text"/>
                </div>
                <div class="col-sm-1 ">
                       Birim Fiyat
                </div>
                 <div class="col-sm-1">
                       <input class="form-control" id="yenifiyat" type="text"/>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="SiparisBtn" class=" btn btn-lg" onclick="SiparisEkle()" style="width: 100%;">Sipariş Ekle</button>
                </div>
                 <div class="col-sm-2">
                      <button type="button" id="SorguBtn" class=" btn btn-lg" onclick="Sorgu()" style="width: 100%;">Sorgu</button>
                </div>
              
 
                </div>
</div>
               </div>
              <div>
                <div >
                      <table class="table" id="table1">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Ürün Adı</th>
                                    
                                     <th>Birim Fiyat (TL)</th>
                                    <th>Miktar</th>
                                  
                                   
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
        function SiparisEkle() {
            var ID = document.getElementById("yeniid");
            
            var idxx = 0;
            if (ID.value != "") idxx = ID.value;
            console.log(idxx);
            var UrunId = document.getElementById("yenifiyat").value;
            var Birimxx = "";
            var BayiIdxx =1;
            var Miktarxx = document.getElementById("yenimiktar").value;

            var BirimFiyatxx = document.getElementById("yeniurunid").value;
            
        
            var Gelen = { 'Id': idxx, 'BayiId': BayiIdxx, 'UrunId': UrunId, 'Miktar': Miktarxx, 'Birim': Birimxx, 'BirimFiyat': BirimFiyatxx,  };
            //use JSON.stringify to convert it to json string
            var jsonstring = JSON.stringify(Gelen);
            console.log(jsonstring);
            $.ajax({
                type: "POST",
                url: 'SiparisEkle1.aspx/SiparisEkle',
                data: JSON.stringify({ 'Gelen': Gelen }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                },
                fail: {}
            });
            console.log("kAYIT BİTTİ");
            Sorgu();
            //Vazgec();
        }
        function CallPageMethod(ID) {
            var id = ID;
            console.log(id);
            $.ajax({
                type: "POST",
                url: 'SiparisEkle1.aspx/SiparisSil',
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
                url: 'SiparisEkle1.aspx/GetUrun',
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
            document.getElementById("yeniurunid").value = "";
            document.getElementById("yenimiktar").value = "";
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
            var id = 0;
            //UrunAdiAl();
            console.log("Burası sorgu");
            $.ajax({
                url: 'SiparisEkle1.aspx/GetSiparisListesi',
                contentType: "application/json; charset=utf-8",
                data: '{ MasterId:' + id + '}',
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

                       
                        if (key == "UrunId") {
                            // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                            var bas = "<tr><td> <button type='button' class='btn-link' onclick='Delete(" + value + ")'> Sil </button>"
                                  + "     <button type='button' class='btn-link' onclick='Edit(" + value + ")'>Değiştir</button></td>"; 

                            str = str + bas; //+ "<td> " + value + " </td>";
                        }
                        if (key == "UrunAdi") {
                            str = str + "<td> " + value + " </td>";
                        }
                        if (key == "BirimFiyat") {
                            str = str + "<td> " + value + " </td>";
                        }
                        if (key == "Miktar") {
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
          //  Gizle();
            $('#Sorgula').click(function () {
                Sorgu();
                document.getElementById("Yenikayityeri").style.visibility = "hidden";
            });
        });
    </script>

</asp:Content>
