# ComPlus
ComPlus reconciliation program


Design details (DB Scripts placed in 'ComPlus\Database scripts' folder)

Created a MSSQL DB names having below tables 
tbl_Broker : Master table for broker (broker 1,broker 2 etc)
tbl_ticker :master table for currencies using for transactions (USDtoHKD, Intro HKD etc)
tbl_Tradetypes :master table for Trade types (eg. FX, bond etc)
tbl_TradeTransactions : all transaction details live recording for downstream )
tbl_CurrencyRates  : master table for currency rates, considered as daily load
tbl_reconciled_trades : To save records which are reconciled successfully
tbl_recon_exceptions : To save fraud transactions which did not passed reconciliation

Stored procedures
a. sp_RetrieveBrokers : To show all brokers
b. sp_RetrieveTradeforRecon : To retrieve all trade records corresponding to the broker
c. sp_updReconciliation :To Update all trade records as reconciled corresponding to the broker 


2. Created a C# console app with below structure
	One single Solutions having 2 projects 
             i)  A data layer project for accessing DB objects and data
             ii) A project having a console cs file, a Trade class file and an interface through which methods will be invoking.

Execution
1. When console App runs it will show all active Brokers eligible for reconciliation in the screen
2. It will ask to enter a broker name in the console, followed by screen will be populated with all eligible records for reconciliation. Same details mentioned in the instruction followed.
3. On Clicking OK button records displayed in the records will be updated in DB as reconciled.