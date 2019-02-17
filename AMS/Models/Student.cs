using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            this.Attendances = new HashSet<Attendance>();
        }

        [Key]
        public int StudentId { get; set; }
        public string CandidateCode { get; set; }
        public Nullable<int> BatchId { get; set; }
        public Nullable<int> TrainingCenterId { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string StudentName { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public string Category { get; set; }
        public string Gender { get; set; }
        public string District { get; set; }
        public string MobileNo { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public Nullable<int> Age { get; set; }
        public string SchemeName { get; set; }
        public string ReligionName { get; set; }
        public string BOCW { get; set; }
        public string BPL { get; set; }
        public string BlockOrTown { get; set; }
        public string Tehsil { get; set; }
        public string Village { get; set; }
        public string Address { get; set; }
        public virtual ICollection<Attendance> Attendances { get; set; }
        public virtual Batch Batch { get; set; }
        public virtual TrainingCenter TrainingCenter { get; set; }
    }

}