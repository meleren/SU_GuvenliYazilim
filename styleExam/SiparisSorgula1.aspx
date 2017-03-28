<%@ Page Title="" Language="C#" MasterPageFile="~/Toptanci.master" AutoEventWireup="true" CodeFile="SiparisSorgula1.aspx.cs" Inherits="SiparisSorgula1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container">
  <div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Bekleyen Siparişler</div>
  <div class="panel-body">

  <table class="table" id="table1">
    <thead>
      <tr>
        <th>#</th>
        <th>SiparisNo</th>
        <th>BayiAdi</th>
        <th>Tutar (TL)</th>
      </tr>
    </thead>
      <tbody id="eklenecek">
      </tbody>
  </table>
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
                            var str="";
                           
                            var obj = JSON.parse(response.d, function (key, value) {
                             
                                if (key == "SiparisNo")
                                {
                                   // var bas = "<tr><td align='center'><button type='button' class='btn' id='btnxx" + value + "' >Fatura Kes</button> </td>";
                                    var bas = "<tr><td><p data-placement='top' data-toggle='tooltip' title='Edit'><input type='button' class='btn btn-primary btn-xs' data-title='Edit' data-toggle='modal' data-target='#edit'><span class='glyphicon glyphicon-pencil'></span></input></p></td>";
                                    str = str + bas + "<td> " + value + " </td>";
                                }
                                if (key == "BayiAdi")
                                    str = str + "<td> " + value + " </td>";
                                if (key == "Tutar")
                                    str = str + "<td> " + value + " </td></tr>";
                               
                                //    str = str + "'<td><input  name='BayiAdi" + value + " type='text' placeholder='BayiAdi' class='form-control input-md'  /> </td>";
                                //$('#eklenecek').html("<td>" + value + "</td><td><input name='name" + value +
                                //    "' type='text' placeholder='SiparisNo' class='form-control input-md'  /> </td><td><input  name='SiparisNo" + value +
                                //    "' type='text' placeholder='BayiAdi'  class='form-control input-md'></td><td><input  name='BayiAdi" + value +
                                //    "' type='text' placeholder='Tutar'  class='form-control input-md'></td>");
                               
                                //$('#table1').append('<tr id="eklenecek' + (i + 1) + '"></tr>');
                              
                                //var wrapperDiv = $('<li/>', {
                                //    "class": "wrapper"
                                //});
                                //wrapperDiv
                                //    .append(key + " " + value);
                                //$("#veriekle").append(wrapperDiv);
                            });
                            $('#eklenecek').html(str);
                        },
                        error: function (e) {
                            alert('Error121212: ');
                        }
                    });
                });
                //$(document).ready(function () {
                //    $('#table1 .btn').click(function () {
                //        $.ajax({
                //            url: 'SiparisSorgula1.aspx/GetDetay',
                //            type: 'POST',
                //            data: { 'submit': true }, // An object with the key 'submit' and value 'true;
                //            success: function (result) {
                //                alert("Your bookmark has been saved");
                //            },
                //            error: function (e) {
                //                alert('Error121212: ');
                //            }
                //        });
                //    });
                //});
            </script>
      
           </div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Sipariş Detay</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    
                </div>
                <div class="form-group">

                    
                </div>
                <div class="form-group">
                    <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


                </div>
            </div>
            <div class="modal-footer ">
                <input type="button" id="btnFaturaKes" class="btn btn-warning btn-lg" style="width: 100%;" value="Fatura Kes" />
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
    <script>
        $(document).ready(function () {
            $('#btnFaturaKes').click(function () {
 
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
                        console.log("Your bookmark has been saved");
                    },
                    error: function (e) {
                        console.log('Error121212: ');
                    }
                });
            });
        });
    </script>


</asp:Content>