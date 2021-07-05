using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ComplusTrading.DAL;

namespace ComplusTrading
{

    /// <summary>
    /// 
    /// </summary>
    public interface ITradeService
    {
        DataTable RetrieveTradeinformation(string brokerName);
        DataTable GetBrokers();
        void updateReconciledTrades(string brokerID);
    }
}
