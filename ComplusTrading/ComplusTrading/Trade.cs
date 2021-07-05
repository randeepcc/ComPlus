using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ComplusTrading.DAL;

namespace ComplusTrading
{
    public class Trade : ITradeService
    {
        /// <summary>
        /// method to get all available active brokers
        /// </summary>
        /// <param name="brokerName"></param>
        public DataTable GetBrokers()
        {
            try
            {
                comPlusDAL _comPlusDAL = new comPlusDAL();
                return _comPlusDAL.GetBrokers();
            }
            catch (Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
                return null;
            }
        }

        /// <summary>
        /// method to access Datalayer method to retrieve the reconciliation records
        /// </summary>
        /// <param name="brokerName"></param>
        /// <returns></returns>
        public DataTable RetrieveTradeinformation(string brokerName)
        {
            try
            {
                TradeResponse _tradeResponse = new TradeResponse();
                comPlusDAL _comPlusDAL = new comPlusDAL();

                return _comPlusDAL.RetrieveTradeinformation(brokerName);
            }
            catch(Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
                return null;
            }
        }

        /// <summary>
        /// Method to update reconciliation
        /// </summary>
        /// <param name="brokerID"></param>
        public void updateReconciledTrades(string brokerID)
        {
            try
            {
                comPlusDAL _comPlusDAL = new comPlusDAL();
                 _comPlusDAL.updateReconciledTrades(brokerID);
            }
            catch (Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());                
            }
        }
    }
}
