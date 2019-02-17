using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    public partial class TrainingCenter
    {

        [Key]
        public int TrainingCenterId { get; set; }
        public int TpId { get; set; }
        public string TrainingCenterName { get; set; }
        public virtual ICollection<Batch> Batches { get; set; }
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<TrainingPartner> TrainingPartners { get; set; }
    }

}