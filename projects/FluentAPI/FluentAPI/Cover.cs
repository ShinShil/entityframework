﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FluentAPI
{
    public class Cover
    {
        public int Id { get; set; }
        public virtual Course Course { get; set; }
    }
}
