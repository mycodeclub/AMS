using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AMS.Models
{
    [Table("Login")]
    public partial class Login
    {

        [Key]
        public int loginId { get; set; }
        public Nullable<int> TpId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        [NotMapped]
        public bool RememberMe { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }

        public virtual TrainingPartner TrainingPartner { get; set; }
    }

}