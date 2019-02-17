using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    public partial class TrainingPartner
    {
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public TrainingPartner()
        //{
        //    this.Logins = new HashSet<Login>();
        //}


        [Key]
        public int TpId { get; set; }
        public Nullable<int> TrainingCenterId { get; set; }
        public string TrainingPartners { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public virtual ICollection<Login> Logins { get; set; }
    }

}