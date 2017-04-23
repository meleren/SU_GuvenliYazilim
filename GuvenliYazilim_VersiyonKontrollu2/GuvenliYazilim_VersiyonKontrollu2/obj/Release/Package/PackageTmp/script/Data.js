$(document).ready(function () {


    $.ajax({
        url: 'SiparisSorgula1.aspx/FaturaKayit',
        contentType: "application/json; charset=utf-8",
        data: "{ }",
        dataType: 'json',
        async: true,
        cache: false,
        type: 'POST',
        //async: true,
        success: function (response) {
            alert('Fatura oluşturuldu ');
  
        },
        error: function (e) {
            alert('Error121212: ');
        }
    });


});
