using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    public class AmsDbContext : DbContext
    {
        public AmsDbContext() : base("name=AmsConStr")
        {
            Database.SetInitializer<AmsDbContext>(null); //disable initializer i.e. disable code first migrations   
        }

        public virtual DbSet<Attendance> Attendances { get; set; }
        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<TrainingCenter> TrainingCenters { get; set; }
        public virtual DbSet<TrainingPartner> TrainingPartners { get; set; }


    }
}