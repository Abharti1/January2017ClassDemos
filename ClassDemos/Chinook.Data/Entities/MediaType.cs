﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace Chinook.Data.Entities
{
    [Table("MediaTypes")]
    public class MediaType
    {
        
        [Key]
        public int MediaTypeId { get; set; }
        public string Name { get; set; }

        //Navigation Properties
        public virtual ICollection<Track> Tracks { get; set; }

        
    }
}