//+------------------------------------------------------------------+
//|                                                   Binary PUT.mq4 |
//|                                   Copyright 2013, SignalPush.com |
//|                                       http://www.signalpush.com/ |
//+------------------------------------------------------------------+
#include <qhttp.mqh>
#property copyright "Copyright 2013, SignalPush.com"
#property link      "http://www.signalpush.com/"

// -- CUSTOMIZE THESE
string tradeSize = "25.00";
string asset = "EUR/USD";
string scriptName = "EURUSD PUT SCRIPT";
string clientAPI = "your api here";
string ipaddress = "127.0.0.1";
string port = "8090";
string assetName = "EUR/USD";
string direction = "Put";

// -- YOU CAN USE THE FOLLOWING BELOW: 60SEC, 5M, N5M, 10M, N10M, 15M, N15M, 30M, N30M, 1H, N1H
string expiry = "60SEC";
// ------------------

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   takeTrade(direction,assetName,tradeSize,"60SEC",clientAPI,scriptName,DoubleToStr((Bid+Ask)/2,Digits));
//----
   return(0);
  }
//+------------------------------------------------------------------+

void takeTrade(string direction, string asset, string amount, string expiry, string api, string name, string rate){
   string response;
   string params [0,2];
   ArrayResize(params,0);
   
   addParam("mode",direction,params);
   addParam("asset",asset,params);
   addParam("amount",amount,params);
   addParam("expiry",expiry,params);
   addParam("api",api,params);
   addParam("name",name,params);
   addParam("rate",rate,params);
   
   string req = ArrayEncode(params);
   
   HttpGET("http://"+ipaddress+":"+port+"/?"+req,response);
   Print("Put request sent");
}