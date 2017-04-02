using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace CORSExample
{
    [DataContract]
    public class ServiceResponse
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
    public class ServiceResponses
    {
        [DataMember]
        public ServiceResponse SR { get; set; }

    }
    public class DonenDeger
    {
        [DataMember]
        public int Id { get; set; }

    }
}