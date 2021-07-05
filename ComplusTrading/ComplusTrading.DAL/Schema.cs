using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComplusTrading.DAL
{
    public class Traderequest
    {
        public string brokerName { get; set; }        
    }
    
    public class TradeResponse 
    {
        public int id { get; set; }
        public string tradeRef { get; set;}
        public int imntRef { get; set; }
        public string imntTicker { get; set; }
        public DateTime tradeDate { get; set; }
        public DateTime valueDate { get; set; }
        public int qty { get; set; }
        public string buySell { get; set; }
        public double price { get; set; }
    }
}
