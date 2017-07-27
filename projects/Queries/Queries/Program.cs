using System;
using System.Linq;

namespace Queries
{
    class Program
    {
        static void Main(string[] args)
        {
            IApproach approach = new DefferedExecution();
            approach.Main();
        }
    }
}
