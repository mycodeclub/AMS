using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.DynamicData;

namespace AMS.Models
{
    [Table("Batch")]

    public partial class Batch
    {
        //public Batch()
        //{
        //    this.Students = new HashSet<Student>();
        //}
        [Key]
        public int BatchId { get; set; }

        [DisplayName("Batch Code")]
        public string BatchCode { get; set; }
        public Nullable<int> TrainingCenterId { get; set; }

        [DisplayName("Batch Duration ( In Days )")]
        public Nullable<int> BatchDurationInDays { get; set; }
        [DisplayName("Start Timing")]
        public Nullable<System.TimeSpan> StartTime { get; set; }
        [DisplayName("End Timing")]
        public Nullable<System.TimeSpan> EndTime { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }

        public virtual ICollection<Student> Students { get; set; }
    }
}