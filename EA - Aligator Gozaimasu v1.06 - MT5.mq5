//+------------------------------------------------------------------+
//|                                   EA Aligator Gozaimasu v1.06 MT5|
//|                                 Copyright © 2022, Syarief Azman. |
//|                                          http://t.me/EABudakUbat |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2022, BuBat's Trading"
#property link      "https://t.me/EABudakUbat"
#property version   "1.06"
#property description "This is a single entry EA."
#property description "Recommended capital is 100 usd, choose trending pair."
#property description "The EA Trades based on Bill William Alligator, Awesome Oscillator, RSI, and Stoch."
#property description "It buy on uptrend and sell on downtrend."
#property description "MultiTimeFrame mode take 4 different timeframes into account before entering trades."
#property description " "
#property description "Ayuh bangkit darah pahlawan. Pantang undur sebelum MC. Agi idop, agi ngelaban! "
#property description "Join our Telegram channel : https://t.me/EABudakUbat"
#property description "Facebook : https://m.me/EABudakUbat"
#property description "Tel: +60194961568 (Budak Ubat)"
#property icon        "\\Images\\bupurple.ico";

#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>
#include <Trade\HistoryOrderInfo.mqh>

#define Copyright "Copyright © 2022, BuBat's Trading"

//+------------------------------------------------------------------+
//| Name of the EA                                                   |
//+------------------------------------------------------------------+
input string EA_Name = "EA Aligator Gozaimasu v1.06 MT5";
string Owner = "BUDAK UBAT";
string Contact = "WHATSAPP/TELEGRAM : +60194961568";

//+------------------------------------------------------------------+
//| Authorization and Expiration date for the EA                     |
//+------------------------------------------------------------------+
datetime expDate = D'2026.03.28 23:55';

int allowedAccountNumbers[] =
  {
   51379350, 220757761, 10589171, 220757426, 241764167, 220756561, 220756639, 301419237, 16581411, 231104393, 220754569, 290921520, 220754551, 220754458, 220754351, 110030128, 220753629, 220753544, 3805175, 231104416, 231101347, 231103989, 231103990, 260802695, 220747326, 231102420, 231100797, 231101152, 46138418, 290894056, 231099736, 290891017, 290891018, 231098986, 231097084, 231098630, 31018538, 536221, 301419571, 301419462, 301419236, 220476053, 13301739, 301419002, 301418623, 31018009, 271757912, 301417622, 1235226, 41328586, 301415814, 13300444, 38039998, 91931537, 1235225, 301415091, 301414688, 49156221, 15120370, 4574565, 407676, 271758951, 271758209, 41029112, 230325793, 271757233, 271756669, 49154578, 4573169, 260801772, 260800857, 40855756, 40818759, 30472764, 4572375, 260799123, 4120301, 22779978, 20966306, 260796883, 4571803, 260796867, 20981220, 5670568, 56171660, 241743374, 241743130, 24493784, 280788856, 44625475, 301410426, 38027769, 91922301, 4569257, 301408129, 301407379, 280790191, 384721, 301407291, 14253088, 301406548, 381957, 241738068, 15116397, 10259378, 374657, 33164480, 271750884, 31009450, 13039831, 75040932, 38023755, 13038587, 38278508, 45470568, 45471082, 90529337, 378600, 231094469, 13037390, 110447778, 231093230, 231093215, 280768223, 40172447, 3779695, 368622, 231092130, 231091871, 231091541, 231090788, 271405414, 13035331, 5075800, 271747529, 271747624, 271747617, 271747922, 128629018, 271747823, 13034491, 271747340, 40103100, 271746810, 24172371, 1228497, 67023650, 271746403, 241694961, 271745914, 271745778, 271745657, 271745025, 301406367, 5814938, 4618919, 359136, 301405259, 251005201, 301404899, 301404787, 230878495, 40005610, 50928949, 251023611, 310589109, 251011686, 56136701, 250738053, 50926643, 50926990, 6020467, 301402076, 301401831, 301401552, 241673648, 241673652, 260793536, 260793354, 260793151, 260793137, 330261658, 260792844, 310414845, 10582534, 25196877, 24281643, 260792334, 241637147, 260791720, 47105460, 75024017, 25182784, 25180557, 25182018, 43187065, 38008250, 349409, 10581650, 290827504, 10581156, 10581157, 46114152, 2100202361, 320325985, 250776195, 230878487, 10580112, 220677181, 212528, 301383073, 25134823, 110367864, 38007561, 320336495, 320341625, 10578632, 342856, 290788014, 25124937, 50911541, 320325985, 11758925, 24366538, 10577296, 271713150, 271714435, 310433979, 271710987, 241288762, 5879494, 10576950, 5879178, 1210812, 271708317, 1210655, 271706164, 4554051, 141006588, 47095826, 4566698, 6007330, 310433370, 310432147, 310427789, 4566517, 310428731, 6007088, 310428380, 467378, 467379, 260788186, 5874167, 4566325, 310416709, 310420287, 9785154, 310417582, 310412921, 310414039, 310413555, 1600109727, 310411959, 310411239, 6005601, 260789913, 230944394, 320125264, 5864001, 260784697, 260782092, 141000344, 56129966, 56129967, 38005357, 56129965, 22595771, 330246906, 17751851, 24372660, 110019895, 53483829, 2132602615, 102865, 260772890, 38216624, 56128453, 330259968, 330261080, 6973836, 250855267, 56119492, 24440346, 20932039, 330253189, 330252350, 437814, 6002511, 330247349, 22013702, 46102642, 56126565, 120201094, 51407995, 231088399, 231080470, 231080474, 38003230, 2100200249, 192139837, 231074929, 339376, 339176, 231067931, 320321354, 231065509, 220748121, 24368645, 24368642, 24368628, 24368617, 141136159, 192080160, 192080166, 192087997, 192080154, 290729490, 220734699, 6748098, 290768531, 301326664, 301326668, 310359156, 301329698, 750729, 13027894, 13527690, 301329704, 301329710, 10576779, 56120025, 310402183, 320323525, 301329718, 320287929, 320287926, 300724432, 301329724, 38000971, 320305818, 320287928, 320287930, 290797780, 320293256, 999049102, 189402, 187461, 1000012579, 192079962, 46002444, 47074913, 301329729, 5015555, 10574113, 10574122, 2100199368, 2100102903, 301370702, 301364931, 301364963, 301363842, 22668478, 117043700, 271619370, 271619248, 271619247, 271619242, 169745, 301342826, 5103852, 10572601, 301338471, 301340934, 2100127831, 301338667, 301338700, 301338711, 60127544, 241334311, 301333295, 21327810, 62630015, 290811032, 290811144, 35124407, 226727, 271376212, 271589085, 290793203, 290803005, 290803011, 290803023, 290803031, 290803035, 290803042, 290803045, 290777186, 290777238, 5793561, 290797783, 280428807, 290708505, 290708508, 10565339, 22642646, 60124625, 290793095, 290776570, 290778420, 290791966, 290791971, 290791974, 290791975, 290791976, 290791978, 290791980, 290791982, 290790446, 60127270, 290783307, 50893152, 60127243, 9106202, 4561741, 766118, 290779891, 290777138, 4561464, 24333650, 271705126, 271702365, 271702356, 271701961, 271701959, 271701950, 271700614, 271700604, 271700600, 271698838, 58808192, 22620250, 22619162, 60126730, 271680740, 65209315, 60126358, 53409128, 2875737, 5711440, 5711469, 15769428, 112883, 271670101, 271663568, 250972252, 250979131, 4559342, 3754760, 3754799, 60126208, 250966681, 250973804, 250966081, 800837865, 271628286, 260657559, 56105041, 250959657, 250957659, 35055890, 2100198278, 2100198280, 2100197940, 250953184, 250951695, 250950477, 250949189, 56104289, 363317, 250937747, 2100198277, 330231524, 1149678, 5767394, 5618549, 60125487, 117017757, 220579967, 60124536, 13025770, 330226965, 60124742, 2100197910, 13025412, 5000445, 5763809, 60124966, 60124932, 5763058, 330215114, 330215118, 330215126, 5762992, 330213208, 13024948, 330212436, 60124502, 362926, 548188, 13024780, 290448830, 320247513, 5670568, 60124670, 280755909, 21454957, 53379729, 13024449, 13022238, 60124033, 5527955, 5527967, 5586556, 5586494, 5586473, 5586460, 5585377, 60124032, 108151, 280742519, 280742542, 3751953, 280734909, 1148217, 5753815, 571958, 571729, 260753046, 260756315, 280730787, 280730796, 5585003, 13022980, 320207539, 46175797, 260764032, 260762646, 260758710, 310307023, 3957871, 5743926, 5434951, 241612110, 241612108, 27362937, 241612106, 241612105, 241612104, 241612103, 241612102, 241612100, 241612096, 241604510, 5742489, 241605261, 241617296, 443354, 22546495, 13021463, 13004694, 241591851, 290748564, 800833896, 241606464, 241605554, 231047192, 290589021, 241599814, 241599469, 13020888, 90307343, 90876405, 241598720, 241598716, 241598721, 241598555, 241598558, 241598559, 241596128, 231052121, 230942650, 241587481, 241587697, 241586738, 44094296, 5522658, 686468, 35050856, 330023862, 5724392, 220093895, 24110069, 47055958, 24390748, 220683034, 20890279, 231041409, 220670829, 231040169, 5711441, 290505538, 51194337, 310200794, 231038313, 55006805, 231037934, 8963723, 88014706, 4457412, 6336708, 360439, 20314776, 890367718, 8002244, 5727022, 5727021, 5727019, 5727018, 5727017, 5724676, 5724673, 5724670, 5713913, 5713912, 53338904, 231036521, 10569792, 10569822, 10569823, 10569824, 10569825, 260675215, 3748617, 330032453, 220708708, 10570144, 10570145, 10570146, 10570181, 220680918, 220694255, 220703637, 10570143, 10569437, 46071377, 220698139, 290636244, 220696924, 310364137, 310364161, 320243283, 310367068, 220695974, 220694810, 220694807, 220692136, 220692127, 10569667, 46070806, 220691140, 250852939, 438088, 220689347, 20829806, 220689025, 220689151, 241501008, 271557181, 250280548, 437834, 10568483, 90865412, 320183680, 21398598, 229488, 46069257, 220680804, 220678889, 310390721, 220677774, 320258092, 10568801, 320236039, 5611439, 310360242, 310393621, 330179201, 330019766, 310390036, 52133589, 310387193, 310382563, 310381317, 310362509, 310380447, 22224590, 5714333, 4558630, 5713692, 435807, 4558456, 310373184, 320239407, 320206708, 320206716, 320206723, 320206732, 4558004, 310371777, 260600979, 5711107, 310364286, 33126040, 90866470, 5434953, 301318199, 310361207, 310360465, 435036, 310360389, 320259320, 4557465, 789012, 345678
  };

string allowedAccountNames[] =
  {
   "Mohd Nizab Pawan",
   "Nazmi Zakaria",
   "Yusrezal Bin Ramdzan", "Yusrezal Ramdzan",
   "Syed Kamal Al-Yahya Bin Syed Mohd", "Bin Syed Mohd Syed Kamal Al-Yahya",
   "Jimmy Antonio Luciano Baez", "Jimmy Luciano",
   "Ahmad Husaini Bin Shahrul Azmi", "Ahmad Husaini Shahrul Azmi",
   "Zaliha Binti Hussin", "Zaliha Hussin"
  };

string ExpiryAlert;

//+------------------------------------------------------------------+
//| Input Parameters                                                 |
//+------------------------------------------------------------------+
input double Lots = 0.01;
input int    Takeprofit_Pips = 50;
input int    Stoploss_Pips = 50;
input bool   Close_On_Reversal = true;
string ExpertComment;

enum trdtype
  {
   AA = 0,   // No MTF  (Current TimeFrame only)
   BB = 1,   // Scalperz (H1, M15, M5, M1)
   CC = 2,   // Intradayz (H4, H1, M15, M5)
   DD = 3,   // Swingz     (D1, H4, H1, M15)
   EE = 4,   // Positionz (W1, D1, H4, H1)
  };

input trdtype MultiTimeFrame_Mode = CC;

enum compound
  {
   A = 0,   // Off                         (EntryLot = Lots)
   B = 1,   // Very High Risk (EntryLot = Lots / 50 * Equity)
   C = 2,   // High Risk           (EntryLot = Lots / 100 * Equity)
   D = 3,   // Medium Risk     (EntryLot = Lots / 1000 * Equity)
   E = 4,   // Low Risk             (EntryLot = Lots / 10000 * Equity)
   F = 5,   // Very Low Risk   (EntryLot = Lots / 100000 * Equity)
  };

input compound AutoCompounding_Mode = A;

input bool   ECN_Broker = false;

input string __Trailing_Function_Below__ = "__Trailing_Function_Below__";
input bool   TrailingStop_Enabled = false;
input int    TrailingStop_Pips = 25;
input int    TrailingGap_Pips = 7;
input int    NewTakeProfit_Pips = 0;

input string __Trading_Time_Function_Below__ = "__Trading_Time_Function_Below__";
input bool   Monday = true;
input bool   Tuesday = true;
input bool   Wednesday = true;
input bool   Thursday = true;
input bool   Friday = true;
input bool   Saturday = true;
input bool   Sunday = true;
input int    HoursFrom = 0;
input int    HoursTo = 24;

input string __Martingale_Function_Below__ = "__Martingale_Function_Below__";
input double LotMultiplierOnLoss = 2.25;
input double LotsMultiplierOnProfit = 1;
input double MaxLots = 999;
input bool   LotsResetOnProfit = true;
input bool   LotsResetOnLoss = false;

input string __Notification_Settings__ = "__Notification_Settings__";
input bool   Email_Notification = true;
input bool   Alert_Notification = false;
input bool   MT5_Messages = true;

//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
int MagicNumber = 260328;
double PipValue = 1;
bool Terminated = false;
string TMode;
string CTF;
double EntryLots;
double MartingaleMultiplier;

double CurrentBuyLots;
double CurrentSellLots;
bool   FirstBuyLotsMgm = true;
bool   FirstSellLotsMgm = true;

datetime BarTime157 = 0;
datetime BarTime167 = 0;

CTrade trade;
CPositionInfo posInfo;

// Indicator handles — up to 7 timeframes possible across all modes
// We create handles for ALL timeframes on init, only use what mode needs
int h_alligator[7]; // W1, D1, H4, H1, M15, M5, M1  (indices 0-6)
int h_ao[7];
int h_stoch[7];
int h_rsi[7];

ENUM_TIMEFRAMES TF_Array[7] = {PERIOD_W1, PERIOD_D1, PERIOD_H4, PERIOD_H1, PERIOD_M15, PERIOD_M5, PERIOD_M1};

//+------------------------------------------------------------------+
//| Get Alligator buffer value                                       |
//+------------------------------------------------------------------+
double GetAlligator(int tfIdx, int buffer, int shift)
  {
   double val[];
   ArraySetAsSeries(val, true);
   if(CopyBuffer(h_alligator[tfIdx], buffer, shift, 1, val) <= 0)
      return 0;
   return val[0];
  }

// Buffer 0 = Jaw, Buffer 1 = Teeth, Buffer 2 = Lips
double GetJaw(int tfIdx, int shift)   { return GetAlligator(tfIdx, 0, shift); }
double GetTeeth(int tfIdx, int shift) { return GetAlligator(tfIdx, 1, shift); }
double GetLips(int tfIdx, int shift)  { return GetAlligator(tfIdx, 2, shift); }

//+------------------------------------------------------------------+
//| Get AO value                                                     |
//+------------------------------------------------------------------+
double GetAO(int tfIdx, int shift)
  {
   double val[];
   ArraySetAsSeries(val, true);
   if(CopyBuffer(h_ao[tfIdx], 0, shift, 1, val) <= 0)
      return 0;
   return val[0];
  }

//+------------------------------------------------------------------+
//| Get Stochastic value                                             |
//+------------------------------------------------------------------+
double GetStochMain(int tfIdx, int shift)
  {
   double val[];
   ArraySetAsSeries(val, true);
   if(CopyBuffer(h_stoch[tfIdx], 0, shift, 1, val) <= 0)
      return 0;
   return val[0];
  }

double GetStochSignal(int tfIdx, int shift)
  {
   double val[];
   ArraySetAsSeries(val, true);
   if(CopyBuffer(h_stoch[tfIdx], 1, shift, 1, val) <= 0)
      return 0;
   return val[0];
  }

//+------------------------------------------------------------------+
//| Get RSI value                                                    |
//+------------------------------------------------------------------+
double GetRSI(int tfIdx, int shift)
  {
   double val[];
   ArraySetAsSeries(val, true);
   if(CopyBuffer(h_rsi[tfIdx], 0, shift, 1, val) <= 0)
      return 0;
   return val[0];
  }

//+------------------------------------------------------------------+
//| TF index mapping                                                 |
//+------------------------------------------------------------------+
int TFIndex(ENUM_TIMEFRAMES tf)
  {
   for(int i = 0; i < 7; i++)
      if(TF_Array[i] == tf)
         return i;
   return 3; // default H1
  }

//+------------------------------------------------------------------+
//| Check if all 4 indicators are bullish on a given TF              |
//+------------------------------------------------------------------+
bool IsBullishTF(ENUM_TIMEFRAMES tf, bool isLowestTF)
  {
   int idx = TFIndex(tf);
   double lips  = GetLips(idx, 0);
   double teeth = GetTeeth(idx, 0);
   double jaw   = GetJaw(idx, 0);
   double ao    = GetAO(idx, 0);
   double stochMain   = GetStochMain(idx, 0);
   double stochSignal = GetStochSignal(idx, 0);
   double rsi   = GetRSI(idx, 0);

   // Alligator check
   bool alligatorBullish;
   if(isLowestTF)
     {
      // On lowest TF: check price > jaw instead of lips > teeth > jaw
      double open0 = iOpen(_Symbol, PERIOD_CURRENT, 0);
      alligatorBullish = (lips > teeth) && (open0 > jaw) && (ao > 0);
     }
   else
     {
      alligatorBullish = (lips > teeth) && (teeth > jaw) && (ao > 0);
     }

   if(!alligatorBullish)
      return false;

   // Stochastic: main < 80 AND main > signal
   if(stochMain >= 80 || stochMain <= stochSignal)
      return false;

   // RSI < 70
   if(rsi >= 70)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//| Check if all 4 indicators are bearish on a given TF              |
//+------------------------------------------------------------------+
bool IsBearishTF(ENUM_TIMEFRAMES tf, bool isLowestTF)
  {
   int idx = TFIndex(tf);
   double lips  = GetLips(idx, 0);
   double teeth = GetTeeth(idx, 0);
   double jaw   = GetJaw(idx, 0);
   double ao    = GetAO(idx, 0);
   double stochMain   = GetStochMain(idx, 0);
   double stochSignal = GetStochSignal(idx, 0);
   double rsi   = GetRSI(idx, 0);

   bool alligatorBearish;
   if(isLowestTF)
     {
      double open0 = iOpen(_Symbol, PERIOD_CURRENT, 0);
      alligatorBearish = (lips < teeth) && (open0 < jaw) && (ao < 0);
     }
   else
     {
      alligatorBearish = (lips < teeth) && (teeth < jaw) && (ao < 0);
     }

   if(!alligatorBearish)
      return false;

   // Stochastic: main > 20 AND main < signal
   if(stochMain <= 20 || stochMain >= stochSignal)
      return false;

   // RSI > 30
   if(rsi <= 30)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ExpertComment = EA_Name;
   ExpiryAlert = EA_Name + " IS EXPIRED. "
                 "\nAccount " + IntegerToString((int)AccountInfoInteger(ACCOUNT_LOGIN)) + " is Unauthorized. "
                 "\nUse Demo account to access Trials Mode. "
                 "\nPLEASE CONTACT " + Owner + " FOR MORE INFO. "
                 "\n" + Contact;
   MartingaleMultiplier = LotMultiplierOnLoss;

   CurrentBuyLots = Lots;
   CurrentSellLots = Lots;

   // Determine pip value for 3/5 digit brokers
   PipValue = 1;
   if(_Digits == 3 || _Digits == 5)
      PipValue = 10;

   // Set up trade object
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(4);

   // Create indicator handles for all 7 timeframes
   for(int i = 0; i < 7; i++)
     {
      h_alligator[i] = iAlligator(_Symbol, TF_Array[i], 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN);
      h_ao[i]        = iAO(_Symbol, TF_Array[i]);
      h_stoch[i]     = iStochastic(_Symbol, TF_Array[i], 5, 3, 3, MODE_SMA, STO_LOWHIGH);
      h_rsi[i]       = iRSI(_Symbol, TF_Array[i], 14, PRICE_CLOSE);

      if(h_alligator[i] == INVALID_HANDLE || h_ao[i] == INVALID_HANDLE ||
         h_stoch[i] == INVALID_HANDLE || h_rsi[i] == INVALID_HANDLE)
        {
         Print("Failed to create indicator handle for TF index ", i);
         return(INIT_FAILED);
        }
     }

   // Also create handles for PERIOD_CURRENT if mode AA
   // (PERIOD_CURRENT may differ from any of the 7 above)
   // We'll handle this by checking at runtime

   RunAuthorization();
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   for(int i = 0; i < 7; i++)
     {
      if(h_alligator[i] != INVALID_HANDLE)  IndicatorRelease(h_alligator[i]);
      if(h_ao[i] != INVALID_HANDLE)         IndicatorRelease(h_ao[i]);
      if(h_stoch[i] != INVALID_HANDLE)      IndicatorRelease(h_stoch[i]);
      if(h_rsi[i] != INVALID_HANDLE)        IndicatorRelease(h_rsi[i]);
     }
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   ChartCommentDisplay();

   if(Bars(_Symbol, PERIOD_CURRENT) < 10)
     {
      Comment("Not enough bars");
      return;
     }

   if(Terminated)
     {
      Comment("EA Terminated.");
      return;
     }

   OnEveryTick();
  }

//+------------------------------------------------------------------+
//| Main trading logic per tick                                      |
//+------------------------------------------------------------------+
void OnEveryTick()
  {
   // Determine chart TF string for display
   ENUM_TIMEFRAMES currentPeriod = (ENUM_TIMEFRAMES)Period();
   switch(currentPeriod)
     {
      case PERIOD_M1:  CTF = "M1";  break;
      case PERIOD_M5:  CTF = "M5";  break;
      case PERIOD_M15: CTF = "M15"; break;
      case PERIOD_M30: CTF = "M30"; break;
      case PERIOD_H1:  CTF = "H1";  break;
      case PERIOD_H4:  CTF = "H4";  break;
      case PERIOD_D1:  CTF = "D1";  break;
      case PERIOD_W1:  CTF = "W1";  break;
      case PERIOD_MN1: CTF = "MN";  break;
      default:         CTF = "??";  break;
     }

   // Auto-compounding lot calculation
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   switch(AutoCompounding_Mode)
     {
      case A: EntryLots = Lots; break;
      case B: EntryLots = NormalizeDouble(Lots / 50.0 * equity, 2); break;
      case C: EntryLots = NormalizeDouble(Lots / 100.0 * equity, 2); break;
      case D: EntryLots = NormalizeDouble(Lots / 1000.0 * equity, 2); break;
      case E: EntryLots = NormalizeDouble(Lots / 10000.0 * equity, 2); break;
      case F: EntryLots = NormalizeDouble(Lots / 100000.0 * equity, 2); break;
     }

   // Determine TMode string
   switch(MultiTimeFrame_Mode)
     {
      case AA: TMode = "No MTF (" + CTF + ")"; break;
      case BB: TMode = "Scalperz (H1>M15>M5>M1)"; break;
      case CC: TMode = "Intradayz (H4>H1>M15>M5)"; break;
      case DD: TMode = "Swingz (D1>H4>H1>M15)"; break;
      case EE: TMode = "Positionz (W1>D1>H4>H1)"; break;
     }

   // Expiry check
   ExpiryCheck();

   // Weekday filter
   MqlDateTime dt;
   TimeLocal(dt);
   int dow = dt.day_of_week;
   bool dayAllowed = false;
   if((Monday && dow == 1) || (Tuesday && dow == 2) || (Wednesday && dow == 3) ||
      (Thursday && dow == 4) || (Friday && dow == 5) || (Saturday && dow == 6) || (Sunday && dow == 0))
      dayAllowed = true;

   if(!dayAllowed)
      return;

   // Hours filter
   int hour0 = dt.hour;
   bool hourAllowed = false;
   if(HoursFrom < HoursTo)
      hourAllowed = (hour0 >= HoursFrom && hour0 < HoursTo);
   else if(HoursFrom > HoursTo)
      hourAllowed = (hour0 < HoursTo || hour0 >= HoursFrom);
   else
      hourAllowed = true; // HoursFrom == HoursTo means 24h

   if(!hourAllowed)
      return;

   // Check signals based on MTF mode
   CheckBuySignal();
   CheckSellSignal();

   // Trailing stop
   if(TrailingStop_Enabled)
      DoTrailingStop();
  }

//+------------------------------------------------------------------+
//| Expiry Check                                                     |
//+------------------------------------------------------------------+
void ExpiryCheck()
  {
   if(TimeCurrent() > expDate)
     {
      if(!IsDemo() && !isAuthorized())
        {
         Alert(ExpiryAlert);
         ExpertRemove();
         Comment("\n" + ExpiryAlert);
         return;
        }
     }
  }

//+------------------------------------------------------------------+
//| Check if demo account                                            |
//+------------------------------------------------------------------+
bool IsDemo()
  {
   return (AccountInfoInteger(ACCOUNT_TRADE_MODE) == ACCOUNT_TRADE_MODE_DEMO);
  }

//+------------------------------------------------------------------+
//| Check buy signal based on MTF mode                               |
//+------------------------------------------------------------------+
void CheckBuySignal()
  {
   bool buySignal = false;

   switch(MultiTimeFrame_Mode)
     {
      case EE: // Positionz: W1 > D1 > H4 > H1(lowest)
         buySignal = IsBullishTF(PERIOD_W1, false) && IsBullishTF(PERIOD_D1, false) &&
                     IsBullishTF(PERIOD_H4, false) && IsBullishTF(PERIOD_H1, true);
         break;

      case DD: // Swingz: D1 > H4 > H1 > M15(lowest)
         buySignal = IsBullishTF(PERIOD_D1, false) && IsBullishTF(PERIOD_H4, false) &&
                     IsBullishTF(PERIOD_H1, false) && IsBullishTF(PERIOD_M15, true);
         break;

      case BB: // Scalperz: H1 > M15 > M5 > M1(lowest)
         buySignal = IsBullishTF(PERIOD_H1, false) && IsBullishTF(PERIOD_M15, false) &&
                     IsBullishTF(PERIOD_M5, false) && IsBullishTF(PERIOD_M1, true);
         break;

      case CC: // Intradayz: H4 > H1 > M15 > M5(lowest)
         buySignal = IsBullishTF(PERIOD_H4, false) && IsBullishTF(PERIOD_H1, false) &&
                     IsBullishTF(PERIOD_M15, false) && IsBullishTF(PERIOD_M5, true);
         break;

      case AA: // No MTF: current TF only (once per bar)
        {
         // Use PERIOD_CURRENT — find closest TF index
         ENUM_TIMEFRAMES curTF = (ENUM_TIMEFRAMES)Period();
         int idx = TFIndex(curTF);
         if(IsBullishTF(curTF, false))
           {
            // Once per bar gate
            datetime barTimes[];
            ArraySetAsSeries(barTimes, true);
            if(CopyTime(_Symbol, PERIOD_CURRENT, 0, 1, barTimes) > 0)
              {
               if(BarTime157 < barTimes[0])
                 {
                  BarTime157 = barTimes[0];
                  buySignal = true;
                 }
              }
           }
        }
        break;
     }

   if(buySignal)
     {
      // Check if buy position already exists
      if(!BuyExists())
        {
         // Close sell if Close_On_Reversal enabled
         if(Close_On_Reversal)
            CloseSellPositions();

         // Open buy
         BuyOrderWithMgm();
        }
     }
  }

//+------------------------------------------------------------------+
//| Check sell signal based on MTF mode                              |
//+------------------------------------------------------------------+
void CheckSellSignal()
  {
   bool sellSignal = false;

   switch(MultiTimeFrame_Mode)
     {
      case EE:
         sellSignal = IsBearishTF(PERIOD_W1, false) && IsBearishTF(PERIOD_D1, false) &&
                      IsBearishTF(PERIOD_H4, false) && IsBearishTF(PERIOD_H1, true);
         break;

      case DD:
         sellSignal = IsBearishTF(PERIOD_D1, false) && IsBearishTF(PERIOD_H4, false) &&
                      IsBearishTF(PERIOD_H1, false) && IsBearishTF(PERIOD_M15, true);
         break;

      case BB:
         sellSignal = IsBearishTF(PERIOD_H1, false) && IsBearishTF(PERIOD_M15, false) &&
                      IsBearishTF(PERIOD_M5, false) && IsBearishTF(PERIOD_M1, true);
         break;

      case CC:
         sellSignal = IsBearishTF(PERIOD_H4, false) && IsBearishTF(PERIOD_H1, false) &&
                      IsBearishTF(PERIOD_M15, false) && IsBearishTF(PERIOD_M5, true);
         break;

      case AA:
        {
         ENUM_TIMEFRAMES curTF = (ENUM_TIMEFRAMES)Period();
         if(IsBearishTF(curTF, false))
           {
            datetime barTimes[];
            ArraySetAsSeries(barTimes, true);
            if(CopyTime(_Symbol, PERIOD_CURRENT, 0, 1, barTimes) > 0)
              {
               if(BarTime167 < barTimes[0])
                 {
                  BarTime167 = barTimes[0];
                  sellSignal = true;
                 }
              }
           }
        }
        break;
     }

   if(sellSignal)
     {
      if(!SellExists())
        {
         if(Close_On_Reversal)
            CloseBuyPositions();

         SellOrderWithMgm();
        }
     }
  }

//+------------------------------------------------------------------+
//| Check if buy position exists                                     |
//+------------------------------------------------------------------+
bool BuyExists()
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_BUY)
            return true;
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//| Check if sell position exists                                    |
//+------------------------------------------------------------------+
bool SellExists()
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_SELL)
            return true;
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//| Count buy positions                                              |
//+------------------------------------------------------------------+
int CountBuy()
  {
   int k = 0;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_BUY)
            k++;
        }
     }
   return k;
  }

//+------------------------------------------------------------------+
//| Count sell positions                                             |
//+------------------------------------------------------------------+
int CountSell()
  {
   int k = 0;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_SELL)
            k++;
        }
     }
   return k;
  }

//+------------------------------------------------------------------+
//| Close all sell positions                                         |
//+------------------------------------------------------------------+
void CloseSellPositions()
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_SELL)
           {
            trade.PositionClose(posInfo.Ticket());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Close all buy positions                                          |
//+------------------------------------------------------------------+
void CloseBuyPositions()
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber && posInfo.PositionType() == POSITION_TYPE_BUY)
           {
            trade.PositionClose(posInfo.Ticket());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Get last closed deal profit for martingale                       |
//+------------------------------------------------------------------+
double GetLastDealProfit(double &lastLots)
  {
   lastLots = Lots;
   double profit = 0;
   datetime lastTime = 0;

   HistorySelect(0, TimeCurrent());
   int total = HistoryDealsTotal();

   for(int i = total - 1; i >= 0; i--)
     {
      ulong ticket = HistoryDealGetTicket(i);
      if(ticket == 0)
         continue;

      if(HistoryDealGetString(ticket, DEAL_SYMBOL) != _Symbol)
         continue;

      if(HistoryDealGetInteger(ticket, DEAL_MAGIC) != MagicNumber)
         continue;

      long dealEntry = HistoryDealGetInteger(ticket, DEAL_ENTRY);
      if(dealEntry != DEAL_ENTRY_OUT && dealEntry != DEAL_ENTRY_INOUT)
         continue;

      datetime dealTime = (datetime)HistoryDealGetInteger(ticket, DEAL_TIME);
      if(dealTime > lastTime)
        {
         lastTime = dealTime;
         profit = HistoryDealGetDouble(ticket, DEAL_PROFIT);
         lastLots = HistoryDealGetDouble(ticket, DEAL_VOLUME);
        }
     }
   return profit;
  }

//+------------------------------------------------------------------+
//| Buy order with martingale management                             |
//+------------------------------------------------------------------+
void BuyOrderWithMgm()
  {
   // Send notification
   SendBuyNotification();

   // Martingale lot computation
   double lastLots = Lots;
   double profit = GetLastDealProfit(lastLots);
   CurrentBuyLots = lastLots;

   if(profit > 0)
     {
      CurrentBuyLots = CurrentBuyLots * LotsMultiplierOnProfit;
      if(LotsResetOnProfit)
         CurrentBuyLots = Lots;
     }
   else if(profit < 0)
     {
      CurrentBuyLots = CurrentBuyLots * LotMultiplierOnLoss;
      if(LotsResetOnLoss)
         CurrentBuyLots = Lots;
     }

   if(CurrentBuyLots > MaxLots)
      CurrentBuyLots = MaxLots;

   double lotvalue = NormalizeDouble(CurrentBuyLots, 2);
   double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   if(lotvalue < minLot) lotvalue = minLot;
   if(lotvalue > maxLot) lotvalue = maxLot;

   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double SL = ask - Stoploss_Pips * PipValue * _Point;
   if(Stoploss_Pips == 0) SL = 0;
   double TP = ask + Takeprofit_Pips * PipValue * _Point;
   if(Takeprofit_Pips == 0) TP = 0;

   SL = NormalizeDouble(SL, _Digits);
   TP = NormalizeDouble(TP, _Digits);

   if(ECN_Broker)
     {
      if(trade.Buy(lotvalue, _Symbol, ask, 0, 0, ExpertComment))
        {
         // Modify to add SL/TP
         ulong posTicket = trade.ResultOrder();
         if(posTicket > 0 && (SL != 0 || TP != 0))
           {
            Sleep(500);
            trade.PositionModify(posTicket, SL, TP);
           }
        }
      else
         Print("Buy OrderSend error: ", trade.ResultRetcodeDescription());
     }
   else
     {
      if(!trade.Buy(lotvalue, _Symbol, ask, SL, TP, ExpertComment))
         Print("Buy OrderSend error: ", trade.ResultRetcodeDescription());
     }
  }

//+------------------------------------------------------------------+
//| Sell order with martingale management                            |
//+------------------------------------------------------------------+
void SellOrderWithMgm()
  {
   SendSellNotification();

   double lastLots = Lots;
   double profit = GetLastDealProfit(lastLots);
   CurrentSellLots = lastLots;

   if(profit > 0)
     {
      CurrentSellLots = CurrentSellLots * LotsMultiplierOnProfit;
      if(LotsResetOnProfit)
         CurrentSellLots = Lots;
     }
   else if(profit < 0)
     {
      CurrentSellLots = CurrentSellLots * LotMultiplierOnLoss;
      if(LotsResetOnLoss)
         CurrentSellLots = Lots;
     }

   if(CurrentSellLots > MaxLots)
      CurrentSellLots = MaxLots;

   double lotvalue = NormalizeDouble(CurrentSellLots, 2);
   double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   if(lotvalue < minLot) lotvalue = minLot;
   if(lotvalue > maxLot) lotvalue = maxLot;

   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   double SL = bid + Stoploss_Pips * PipValue * _Point;
   if(Stoploss_Pips == 0) SL = 0;
   double TP = bid - Takeprofit_Pips * PipValue * _Point;
   if(Takeprofit_Pips == 0) TP = 0;

   SL = NormalizeDouble(SL, _Digits);
   TP = NormalizeDouble(TP, _Digits);

   if(ECN_Broker)
     {
      if(trade.Sell(lotvalue, _Symbol, bid, 0, 0, ExpertComment))
        {
         ulong posTicket = trade.ResultOrder();
         if(posTicket > 0 && (SL != 0 || TP != 0))
           {
            Sleep(500);
            trade.PositionModify(posTicket, SL, TP);
           }
        }
      else
         Print("Sell OrderSend error: ", trade.ResultRetcodeDescription());
     }
   else
     {
      if(!trade.Sell(lotvalue, _Symbol, bid, SL, TP, ExpertComment))
         Print("Sell OrderSend error: ", trade.ResultRetcodeDescription());
     }
  }

//+------------------------------------------------------------------+
//| Send Buy Notification                                            |
//+------------------------------------------------------------------+
void SendBuyNotification()
  {
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double SL = ask - Stoploss_Pips * PipValue * _Point;
   double TP = ask + Takeprofit_Pips * PipValue * _Point;

   string msg = ExpertComment + ". " + _Symbol + ". Buy Signal."
                + " Price: " + DoubleToString(ask, _Digits)
                + ". TP: " + DoubleToString(TP, _Digits)
                + ". SL: " + DoubleToString(SL, _Digits)
                + ". MTF Mode: " + TMode;

   if(Email_Notification)
      SendMail(ExpertComment, msg);
   if(Alert_Notification)
      Alert(msg);
   if(MT5_Messages)
      SendNotification(msg);
  }

//+------------------------------------------------------------------+
//| Send Sell Notification                                           |
//+------------------------------------------------------------------+
void SendSellNotification()
  {
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   double SL = bid + Stoploss_Pips * PipValue * _Point;
   double TP = bid - Takeprofit_Pips * PipValue * _Point;

   string msg = ExpertComment + ". " + _Symbol + ". Sell Signal."
                + " Price: " + DoubleToString(bid, _Digits)
                + ". TP: " + DoubleToString(TP, _Digits)
                + ". SL: " + DoubleToString(SL, _Digits)
                + ". MTF Mode: " + TMode;

   if(Email_Notification)
      SendMail(ExpertComment, msg);
   if(Alert_Notification)
      Alert(msg);
   if(MT5_Messages)
      SendNotification(msg);
  }

//+------------------------------------------------------------------+
//| Trailing Stop                                                    |
//+------------------------------------------------------------------+
void DoTrailingStop()
  {
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);

   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(posInfo.SelectByIndex(i))
        {
         if(posInfo.Symbol() != _Symbol || posInfo.Magic() != MagicNumber)
            continue;

         double openPrice = posInfo.PriceOpen();
         double sl = posInfo.StopLoss();
         double tp = posInfo.TakeProfit();

         if(posInfo.PositionType() == POSITION_TYPE_BUY)
           {
            if(ask - openPrice > TrailingStop_Pips * PipValue * _Point)
              {
               double newSL = ask - TrailingStop_Pips * PipValue * _Point;
               if(sl < newSL - TrailingGap_Pips * PipValue * _Point)
                 {
                  double newTP = tp;
                  if(NewTakeProfit_Pips != 0)
                     newTP = ask + (NewTakeProfit_Pips + TrailingStop_Pips) * PipValue * _Point;
                  newSL = NormalizeDouble(newSL, _Digits);
                  newTP = NormalizeDouble(newTP, _Digits);
                  trade.PositionModify(posInfo.Ticket(), newSL, newTP);
                 }
              }
           }
         else if(posInfo.PositionType() == POSITION_TYPE_SELL)
           {
            if(openPrice - bid > TrailingStop_Pips * PipValue * _Point)
              {
               double newSL = bid + TrailingStop_Pips * PipValue * _Point;
               if(sl > newSL + TrailingGap_Pips * PipValue * _Point || sl == 0)
                 {
                  double newTP = tp;
                  if(NewTakeProfit_Pips != 0)
                     newTP = bid - (NewTakeProfit_Pips + TrailingStop_Pips) * PipValue * _Point;
                  newSL = NormalizeDouble(newSL, _Digits);
                  newTP = NormalizeDouble(newTP, _Digits);
                  trade.PositionModify(posInfo.Ticket(), newSL, newTP);
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Chart Comment Display                                            |
//+------------------------------------------------------------------+
void ChartCommentDisplay()
  {
   string Date = TimeToString(TimeCurrent(), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
   string expStr = TimeToString(expDate, TIME_DATE | TIME_MINUTES | TIME_SECONDS);

   if(isAuthorized() || IsDemo())
     {
      Comment(
         "\n ", Copyright,
         "\n ", Date, "\n",
         "\n ", AuthMessage(), "\n",
         "\n ", EA_Name,
         "\n Starting Lot: ", Lots,
         "\n Layer Multiplier: ", MartingaleMultiplier,
         "\n Equity: $", NormalizeDouble(AccountInfoDouble(ACCOUNT_EQUITY), 2),
         "\n Buy: ", CountBuy(), " | Sell: ", CountSell(),
         "\n");
     }
   else if(!isAuthorized() && !IsDemo() && (TimeCurrent() < expDate))
     {
      Comment(
         "\n ", Copyright,
         "\n ", Date, "\n",
         "\n ", AuthMessage(), "\n",
         "\n ", EA_Name,
         "\n Starting Lot: ", Lots,
         "\n Layer Multiplier: ", MartingaleMultiplier,
         "\n Equity: $", NormalizeDouble(AccountInfoDouble(ACCOUNT_EQUITY), 2),
         "\n Buy: ", CountBuy(), " | Sell: ", CountSell(),
         "\n\n ExpireDate: ", expStr,
         "\n");
     }
   else
     {
      Alert(ExpiryAlert);
      ExpertRemove();
      Comment("\n" + ExpiryAlert);
     }
  }

//+------------------------------------------------------------------+
//| Authorization                                                    |
//+------------------------------------------------------------------+
bool isAuthorized()
  {
   long accountNumber = AccountInfoInteger(ACCOUNT_LOGIN);
   string accountName = AccountInfoString(ACCOUNT_NAME);
   bool isAllowed = false;

   int accSize = ArraySize(allowedAccountNumbers);
   int nameSize = ArraySize(allowedAccountNames);

   for(int i = 0; i < accSize; i++)
     {
      if((int)accountNumber == allowedAccountNumbers[i])
        {
         isAllowed = true;
         break;
        }
     }

   if(!isAllowed)
     {
      for(int i = 0; i < nameSize; i++)
        {
         if(accountName == allowedAccountNames[i])
           {
            isAllowed = true;
            break;
           }
        }
     }

   return isAllowed;
  }

//+------------------------------------------------------------------+
//| Run Authorization                                                |
//+------------------------------------------------------------------+
int RunAuthorization()
  {
   if(IsDemo())
     {
      Print("Demo account detected, skipping authorization");
      return(INIT_SUCCEEDED);
     }

   if(TimeCurrent() > expDate)
     {
      if(isAuthorized())
        {
         return(INIT_SUCCEEDED);
        }
      else
        {
         Alert(ExpiryAlert);
         ExpertRemove();
         Comment("\n" + ExpiryAlert);
         return(INIT_FAILED);
        }
     }

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Auth Message                                                     |
//+------------------------------------------------------------------+
string AuthMessage()
  {
   long accNum = AccountInfoInteger(ACCOUNT_LOGIN);
   string accName = AccountInfoString(ACCOUNT_NAME);

   if(IsDemo())
     {
      return("Demo account detected.\n Account Authorized.\n Account Number: " + IntegerToString(accNum) + "\n Account Name: " + accName);
     }
   else if((TimeCurrent() < expDate) && !isAuthorized())
     {
      return("Account " + IntegerToString(accNum) + " is Unauthorized, EA will expire soon.\n Trials Mode Activated.");
     }
   else if(isAuthorized())
     {
      return("Account Authorized.\n Account Number: " + IntegerToString(accNum) + "\n Account Name: " + accName);
     }
   else
      return(ExpiryAlert);
  }
//+------------------------------------------------------------------+
