using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace ComplusTrading
{
    /// <summary>
    /// Console of the application to take input and show output
    /// </summary>
    public static class Program
    {
         static void Main(string[] args)
        {
            try
            {
                Trade _trade = new Trade();
                DataTable _dt_brokers = _trade.GetBrokers();
                Console.WriteLine("Active brokers available are:\n");
                Console.WriteLine("broker " + "  ");
                foreach (DataRow row in _dt_brokers.Rows)
                {
                    Console.WriteLine(row["id"].ToString() + "  " + row["brokerName"].ToString() + "  ");
                }

                Console.WriteLine("\n");
                Console.Write("Enter Broker Name to see the transactions: ");

                string _broker = Console.ReadLine();
                DataTable _dt_recon_ = _trade.RetrieveTradeinformation(_broker);
                Console.WriteLine("\n");
                Console.WriteLine("Trade Ref" + "  " + "ID " + "  " + "ticker " + "  " + "TradeDate " + "  " + "ValueDate " + "  " + "Quantity " + "  " + "BuySell " + "  " + "Price " + "  ");
                foreach (DataRow row in _dt_recon_.Rows)
                {                    
                    Console.WriteLine(row["TradeRef"].ToString() + "  " + row["ID"].ToString() + "  " + row["ticker"].ToString() + "  " + row["TradeDate"] + "  " + row["ValueDate"].ToString() + "  " + row["Quantity"].ToString() + "  " + row["buysell"].ToString() + "  " + row["price"].ToString() + "  ");
                }
                Console.WriteLine("\n");
                Console.WriteLine("\n");
                Console.Write("Please click OK and press enter to apply reconciliation \n");
                string _applyRecon = Console.ReadLine();
                if (_applyRecon== "OK")
                {
                    _trade.updateReconciledTrades(_broker);
                }

            }
            catch(Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
            }
        }
        
    }
}

    
