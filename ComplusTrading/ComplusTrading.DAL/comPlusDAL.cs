using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ComplusTrading.DAL
{
    public class comPlusDAL
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["TradeConn"].ConnectionString;

        /// <summary>
        /// Method to connect Database and retrieve the Trade information eligible of Reconciliation
        /// </summary>
        /// <param name="brokerName"></param>
        /// <returns></returns>
        public DataTable RetrieveTradeinformation (string brokerName)
        {
            try
            {
                TradeResponse tradeResponse = new TradeResponse();
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_RetrieveTradeforRecon", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter { ParameterName = "@brokerName", Value = brokerName });
                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    adp.Fill(ds);
                }


                return ds.Tables[0];
            }
            catch(Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());               
                return null;
            }
        }
        /// <summary>
        /// Method to connect DB and retrieve all brokers
        /// </summary>
        /// <param name>
        /// <returns></returns>
        public DataTable GetBrokers()
        {
            try
            {
                
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_RetrieveBrokers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    adp.Fill(ds);
                }


                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
                return null;
            }
        }

        /// <summary>
        /// Method to update the reconciled trades into DB
        /// </summary>
        /// <param name="brokerName"></param>
        public void updateReconciledTrades(string brokerID)
        {
            try
            {

                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_updReconciliation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter { ParameterName = "@brokerName", Value = brokerID });
                    con.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    adp.Fill(ds);
                }               
            }
            catch (Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
             
            }
        }
    }
}
