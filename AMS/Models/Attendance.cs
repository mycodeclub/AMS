using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    public partial class Attendance
    {
        [Key]
        public long AttendanceId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<System.DateTime> punchInTime { get; set; }
        public Nullable<System.DateTime> punchOutTime { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public virtual Student Student { get; set; }
    }
}