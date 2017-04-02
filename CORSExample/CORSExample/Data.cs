using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CORSExample
{
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
    }
}