﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;


public class Data
{
    public class Urunler
    {
        [DataMember]
        public IList<Urun> Liste { get; set; }
    }

    [DataContract]
    public class Urun
    {
        [DataMember]
        public int Id { get; set; }


        [DataMember]
        public string Tanim { get; set; }

        [DataMember]
        public string Birim { get; set; }

        [DataMember]
        public double BirimFiyat { get; set; }

        [DataMember]
        public string Marka { get; set; }

    }
    [DataContract]
    public class Urunxx
    {
        [DataMember]
        public int Id { get; set; }


        [DataMember]
        public string Tanim { get; set; }

        [DataMember]
        public string Birim { get; set; }

        [DataMember]
        public double BirimFiyat { get; set; }


    }

    [DataContract]
    public class DonenDeger
    {
        [DataMember]
        public int Id { get; set; }


        [DataMember]
        public string Durum { get; set; }
    }
    public class GelenDeger
    {
        [DataMember]
        public int Id { get; set; }

    }
    
    public class Siparisler
    {
        [DataMember]
        public IList<Siparis> Liste { get; set; }
    }
    public class SiparislerToplami
    {
        [DataMember]
        public IList<SiparisToplam> Liste { get; set; }
        
            }

    [DataContract]
    public class Siparis
    {
        [DataMember]
        public int SiparisNo { get; set; }

        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public DateTime Tarih { get; set; }

        [DataMember]
        public Int16 BayiId { get; set; }

        [DataMember]
        public string BayiAdi { get; set; }

        [DataMember]
        public string Adres { get; set; }

        [DataMember]
        public Int16 UrunId { get; set; }

        [DataMember]
        public string UrunAdi { get; set; }

        [DataMember]
        public string Birim { get; set; }

        [DataMember]
        public double BirimFiyat { get; set; }

        [DataMember]
        public double Miktar { get; set; }

        [DataMember]
        public double Tutar { get; set; }

    }
    [DataContract]
    public class SiparisToplam
    {
        [DataMember]
        public int SiparisNo { get; set; }

        [DataMember]
        public DateTime Tarih { get; set; }

        [DataMember]
        public Int16 BayiId { get; set; }

        [DataMember]
        public string BayiAdi { get; set; }

        [DataMember]
        public double Tutar { get; set; }

    }
    [DataContract]
    public class FaturaToplam
    {
        [DataMember]
        public int FaturaNo { get; set; }

        [DataMember]
        public DateTime Tarih { get; set; }

        [DataMember]
        public Int16 BayiId { get; set; }

        [DataMember]
        public string BayiAdi { get; set; }

        [DataMember]
        public double Tutar { get; set; }

    }
    public class FaturalarToplam
    {
        [DataMember]
        public IList<FaturaToplam> Liste { get; set; }

    }

    [DataContract]
    public class Fatura
    {
        [DataMember]
        public int FaturaNo { get; set; }

        [DataMember]
        public int SiparisNo { get; set; }

        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public DateTime Tarih { get; set; }

        [DataMember]
        public Int16 BayiId { get; set; }

        [DataMember]
        public string BayiAdi { get; set; }
        [DataMember]
        public string Adres { get; set; }

        [DataMember]
        public string VergiDaire { get; set; }

        [DataMember]
        public string VergiNo { get; set; }

        [DataMember]
        public Int16 UrunId { get; set; }

        [DataMember]
        public string UrunAdi { get; set; }

        [DataMember]
        public string Birim { get; set; }

        [DataMember]
        public double BirimFiyat { get; set; }

        [DataMember]
        public double Miktar { get; set; }

        [DataMember]
        public double Tutar { get; set; }

    }

    public class Faturalar
    {
        [DataMember]
        public IList<Fatura> Liste { get; set; }
    }

}
