//+------------------------------------------------------------------+
//|                                        EA Aligator Gozaimasu.mq5 |
//|                                 Copyright © 2022, Syarief Azman. |
//|                                          http://t.me/EABudakUbat |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2022, BuBat's Trading"
#property link      "https://t.me/EABudakUbat"
#property version   "1.06"
#property description   "This is a single entry EA."
#property description   "Recommended capital is 100 usd, choose trending pair."
#property description   "The EA Trades based on Bill William Alligator, Awesome Oscillator, RSI, and Stoch. "
#property description   "It buy on uptrend and sell on downtrend."
#property description   "MultiTimeFrame mode take 4 different timeframes into account before entering the trades."
#property description   " "
#property description   "Ayuh bangkit darah pahlawan. Pantang undur sebelum MC. Agi idop, agi ngelaban! "
#property description   "Join our Telegram channel : https://t.me/EABudakUbat"
#property description   "Facebook : https://m.me/EABudakUbat"
#property description   "Tel: +60194961568 (Budak Ubat)"
#property icon        "\\Images\\bupurple.ico";
#include <stdlib.mqh>
#include <WinUser32.mqh>


#define Copyright "Copyright © 2022, BuBat's Trading"
#property copyright Copyright
//+------------------------------------------------------------------+
//| Name of the EA                                                   |
//+------------------------------------------------------------------+
extern string EA_Name = "EA Aligator Gozaimasu v1.06 ";
string Owner = "BUDAK UBAT";
string Contact = "WHATSAPP/TELEGRAM : +60194961568";
//+------------------------------------------------------------------+
//| Authorization and Expiration date for the EA                     |
//+------------------------------------------------------------------+
datetime expDate = D'2026.03.28 23:55'; // yyyy.mm.dd<-- expired date
int allowedAccountNumbers[9999] =
  {
   51379350, 220757761, 10589171, 220757426, 241764167, 220756561, 220756639, 301419237, 16581411, 231104393, 220754569, 290921520, 220754551, 220754458, 220754351, 110030128, 220753629, 220753544, 3805175, 231104416, 231101347, 231103989, 231103990, 260802695, 220747326, 231102420, 231100797, 231101152, 46138418, 290894056, 231099736, 290891017, 290891018, 231098986, 231097084, 231098630, 31018538, 536221, 301419571, 301419462, 301419236, 220476053, 13301739, 301419002, 301418623, 31018009, 271757912, 301417622, 1235226, 41328586, 301415814, 13300444, 38039998, 91931537, 1235225, 301415091, 301414688, 49156221, 15120370, 4574565, 407676, 271758951, 271758209, 41029112, 230325793, 271757233, 271756669, 49154578, 4573169, 260801772, 260800857, 40855756, 40818759, 30472764, 4572375, 260799123, 4120301, 22779978, 20966306, 260796883, 4571803, 260796867, 20981220, 5670568, 56171660, 241743374, 241743130, 24493784, 280788856, 44625475, 301410426, 38027769, 91922301, 4569257, 301408129, 301407379, 280790191, 384721, 301407291, 14253088, 301406548, 381957, 241738068, 15116397, 10259378, 374657, 33164480, 271750884, 31009450, 13039831, 75040932, 38023755, 13038587, 38278508, 45470568, 45471082, 90529337, 378600, 231094469, 13037390, 110447778, 231093230, 231093215, 280768223, 40172447, 3779695, 368622, 231092130, 231091871, 231091541, 231090788, 271405414, 13035331, 5075800, 271747529, 271747624, 271747617, 271747922, 128629018, 271747823, 13034491, 271747340, 40103100, 271746810, 24172371, 1228497, 67023650, 271746403, 241694961, 271745914, 271745778, 271745657, 271745025, 301406367, 5814938, 4618919, 359136, 301405259, 251005201, 301404899, 301404787, 230878495, 40005610, 50928949, 251023611, 310589109, 251011686, 56136701, 250738053, 50926643, 50926990, 6020467, 301402076, 301401831, 301401552, 241673648, 241673652, 260793536, 260793354, 260793151, 260793137, 330261658, 260792844, 310414845, 10582534, 25196877, 24281643, 260792334, 241637147, 260791720, 47105460, 75024017, 25182784, 25180557, 25182018, 43187065, 38008250, 349409, 10581650, 290827504, 10581156, 10581157, 46114152, 2100202361, 320325985, 250776195, 230878487, 10580112, 220677181, 212528, 301383073, 25134823, 110367864, 38007561, 320336495, 320341625, 10578632, 342856, 290788014, 25124937, 50911541, 320325985, 11758925, 24366538, 10577296, 271713150, 271714435, 310433979, 271710987, 241288762, 5879494, 10576950, 5879178, 1210812, 271708317, 1210655, 271706164, 4554051, 141006588, 47095826, 4566698, 6007330, 310433370, 310432147, 310427789, 4566517, 310428731, 6007088, 310428380, 467378, 467379, 260788186, 5874167, 4566325, 310416709, 310420287, 9785154, 310417582, 310412921, 310414039, 310413555, 1600109727, 310411959, 310411239, 6005601, 260789913, 230944394, 320125264, 5864001, 260784697, 260782092, 141000344, 56129966, 56129967, 38005357, 56129965, 22595771, 330246906, 17751851, 24372660, 110019895, 53483829, 2132602615, 102865, 260772890, 38216624, 56128453, 330259968, 330261080, 6973836, 250855267, 56119492, 24440346, 20932039, 330253189, 330252350, 437814, 6002511, 330247349, 22013702, 46102642, 56126565, 120201094, 51407995, 231088399, 231080470, 231080474, 38003230, 2100200249, 192139837, 231074929, 339376, 339176, 231067931, 320321354, 231065509, 220748121, 24368645, 24368642, 24368628, 24368617, 141136159, 192080160, 192080166, 192087997, 192080154, 290729490, 220734699, 6748098, 290768531, 301326664, 301326668, 310359156, 301329698, 750729, 13027894, 13527690, 301329704, 301329710, 10576779, 56120025, 310402183, 320323525, 301329718, 320287929, 320287926, 300724432, 301329724, 38000971, 320305818, 320287928, 320287930, 290797780, 320293256, 999049102, 189402, 187461, 1000012579, 192079962, 46002444, 47074913, 301329729, 5015555, 10574113, 10574122, 2100199368, 2100102903, 301370702, 301364931, 301364963, 301363842, 22668478, 117043700, 271619370, 271619248, 271619247, 271619242, 169745, 301342826, 5103852, 10572601, 301338471, 301340934, 2100127831, 301338667, 301338700, 301338711, 60127544, 241334311, 301333295, 21327810, 62630015, 290811032, 290811144, 35124407, 226727, 271376212, 271589085, 290793203, 290803005, 290803011, 290803023, 290803031, 290803035, 290803042, 290803045, 290777186, 290777238, 5793561, 290797783, 280428807, 290708505, 290708508, 10565339, 22642646, 60124625, 290793095, 290776570, 290778420, 290791966, 290791971, 290791974, 290791975, 290791976, 290791978, 290791980, 290791982, 290790446, 60127270, 290783307, 50893152, 60127243, 9106202, 4561741, 766118, 290779891, 290777138, 4561464, 24333650, 271705126, 271702365, 271702356, 271701961, 271701959, 271701950, 271700614, 271700604, 271700600, 271698838, 58808192, 22620250, 22619162, 60126730, 271680740, 65209315, 60126358, 53409128, 2875737, 5711440, 5711469, 15769428, 112883, 271670101, 271663568, 250972252, 250979131, 4559342, 3754760, 3754799, 60126208, 250966681, 250973804, 250966081, 800837865, 271628286, 260657559, 56105041, 250959657, 250957659, 35055890, 2100198278, 2100198280, 2100197940, 250953184, 250951695, 250950477, 250949189, 56104289, 363317, 250937747, 2100198277, 330231524, 1149678, 5767394, 5618549, 60125487, 117017757, 220579967, 60124536, 13025770, 330226965, 60124742, 2100197910, 13025412, 5000445, 5763809, 60124966, 60124932, 5763058, 330215114, 330215118, 330215126, 5762992, 330213208, 13024948, 330212436, 60124502, 362926, 548188, 13024780, 290448830, 320247513, 5670568, 60124670, 280755909, 21454957, 53379729, 13024449, 13022238, 60124033, 5527955, 5527967, 5586556, 5586494, 5586473, 5586460, 5585377, 60124032, 108151, 280742519, 280742542, 3751953, 280734909, 1148217, 5753815, 571958, 571729, 260753046, 260756315, 280730787, 280730796, 5585003, 13022980, 320207539, 46175797, 260764032, 260762646, 260758710, 310307023, 3957871, 5743926, 5434951, 241612110, 241612108, 27362937, 241612106, 241612105, 241612104, 241612103, 241612102, 241612100, 241612096, 241604510, 5742489, 241605261, 241617296, 443354, 22546495, 13021463, 13004694, 241591851, 290748564, 800833896, 241606464, 241605554, 231047192, 290589021, 241599814, 241599469, 13020888, 90307343, 90876405, 241598720, 241598716, 241598721, 241598555, 241598558, 241598559, 241596128, 231052121, 230942650, 241587481, 241587697, 241586738, 44094296, 5522658, 686468, 35050856, 330023862, 5724392, 220093895, 24110069, 47055958, 24390748, 220683034, 20890279, 231041409, 220670829, 231040169, 5711441, 290505538, 51194337, 310200794, 231038313, 55006805, 231037934, 8963723, 88014706, 4457412, 6336708, 360439, 20314776, 890367718, 8002244, 5727022, 5727021, 5727019, 5727018, 5727017, 5724676, 5724673, 5724670, 5713913, 5713912, 53338904, 231036521, 10569792, 10569822, 10569823, 10569824, 10569825, 260675215, 3748617, 330032453, 220708708, 10570144, 10570145, 10570146, 10570181, 220680918, 220694255, 220703637, 10570143, 10569437, 46071377, 220698139, 290636244, 220696924, 310364137, 310364161, 320243283, 310367068, 220695974, 220694810, 220694807, 220692136, 220692127, 10569667, 46070806, 220691140, 250852939, 438088, 220689347, 20829806, 220689025, 220689151, 241501008, 271557181, 250280548, 437834, 10568483, 90865412, 320183680, 21398598, 229488, 46069257, 220680804, 220678889, 310390721, 220677774, 320258092, 10568801, 320236039, 5611439, 310360242, 310393621, 330179201, 330019766, 310390036, 52133589, 310387193, 310382563, 310381317, 310362509, 310380447, 22224590, 5714333, 4558630, 5713692, 435807, 4558456, 310373184, 320239407, 320206708, 320206716, 320206723, 320206732, 4558004, 310371777, 260600979, 5711107, 310364286, 33126040, 90866470, 5434953, 301318199, 310361207, 310360465, 435036, 310360389, 320259320, 4557465, 789012, 345678
  }; // Authorized account number
string allowedAccountNames[9999] =
  {
//  "Syarief Azman bin Rosli", "Syarief Azman Bin Rosli", "SYARIEF AZMAN ROSLI",
   "Mohd Nizab Pawan",
   "Nazmi Zakaria",
   "Yusrezal Bin Ramdzan", "Yusrezal Ramdzan",
   "Syed Kamal Al-Yahya Bin Syed Mohd", "Bin Syed Mohd Syed Kamal Al-Yahya",
   "Jimmy Antonio Luciano Baez", "Jimmy Luciano",
   "Ahmad Husaini Bin Shahrul Azmi", "Ahmad Husaini Shahrul Azmi",
   "Zaliha Binti Hussin", "Zaliha Hussin"
  };
string ExpiryAlert = EA_Name + " IS EXPIRED. "
                     "\nAccount " + IntegerToString(AccountNumber()) + " is Unauthorized. "
                     "\nUse Demo account to access Trials Mode. "
                     "\nPLEASE CONTACT " + Owner + " FOR MORE INFO. "
                     "\n" + Contact ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// exported variables
extern double Lots = 0.01;
extern int Takeprofit_Pips = 50;
extern int Stoploss_Pips = 50;
extern bool Close_On_Reversal = true;
string ExpertComment = EA_Name;

enum trdtype
  {
   AA = 0,   // No MTF  (Current TimeFrame only)
   BB = 1,   // Scalperz (H1, M15, M5, M1)
   CC = 2,   // Intradayz (H4, H1, M15, M5)
   DD = 3,   // Swingz     (D1, H4, H1, M15)
   EE = 4,   // Positionz (W1, D1, H4, H1)

  };
//--- input parameters
input trdtype MultiTimeFrame_Mode = CC;

enum compound
  {
   A = 0,   // Off                         (EntryLot = Lots)
   B = 1,   // Very High Risk (EntryLot = Lots ÷ 50 × Equity)
   C = 2,   // High Risk           (EntryLot = Lots ÷ 100 × Equity)
   D = 3,   // Medium Risk     (EntryLot = Lots ÷ 1 000 × Equity)
   E = 4,   // Low Risk             (EntryLot = Lots ÷ 10 000 × Equity)
   F = 5,   // Very Low Risk   (EntryLot = Lots ÷ 100 000 × Equity)

  };
//--- input parameters
input compound AutoCompounding_Mode = A;

extern bool ECN_Broker = false;

extern string __Trailing_Function_Below__ = "__Trailing_Function_Below__";
extern bool TrailingStop = False ;
extern int TrailingStop_Pips = 25;
extern int TrailingGap_Pips = 7;
extern int NewTakeProfit_Pips = 0;

extern string __Trading_Time_Function_Below__ = "__Trading_Time_Function_Below__ ";
extern bool Monday = true;
extern bool Tuesday = true;
extern bool Wednesday = true;
extern bool Thursday = true;
extern bool Friday = true;
extern bool Saturday = true;
extern bool Sunday = true;
extern int HoursFrom = 0;
extern int HoursTo = 24;

extern string __Martingale_Function_Below__ = "__Martingale_Function_Below__ ";
extern double LotMultiplierOnLoss = 2.25;
extern double LotsMultiplierOnProfit = 1;
extern double MaxLots = 999;
extern bool LotsResetOnProfit = true;
extern bool LotsResetOnLoss = false;
double MartingaleMultiplier = LotMultiplierOnLoss;

extern string __Notification_Settings__ = "__Notification_Settings__";
extern bool Email_Notification = true;
extern bool Alert_Notification = false;
extern bool MT4_Messages = true;
bool tmsrv = false;

//--- hidden variables
bool Monday155 = Monday;
bool Tuesday155 = Tuesday;
bool Wednesday155 = Wednesday;
bool Thursday155 = Thursday;
bool Friday155 = Friday;
bool Saturday155 = Saturday;
bool Sunday155 = Sunday;
int HoursFrom156 = HoursFrom;
int HoursTo156 = HoursTo;

double BuyLots54 = Lots;
int BuyStoploss54 = Stoploss_Pips;
int BuyTakeprofit54 = Takeprofit_Pips;
string BuyExpertName54 = ExpertComment;
double MaxBuyLots54 = MaxLots;
bool ECNBroker54 = ECN_Broker;
double LotsBuyChOnLoss54 = 0;
double LotsBuyChOnProfit54 = 0;
double LotsBuyMpOnLoss54 = LotMultiplierOnLoss;
double LotsBuyMpOnProfit54 = LotsMultiplierOnProfit;
bool LotsResetOnProfit54 = LotsResetOnProfit;
bool LotsResetOnLoss54 = LotsResetOnLoss;

double SellLots56 = Lots;
int SellStoploss56 = Stoploss_Pips;
int SellTakeprofit56 = Takeprofit_Pips;
string SellExpertName56 = ExpertComment;
double MaxSellLots56 = MaxLots;
bool ECNBroker56 = ECN_Broker;
double LotsSellChOnLoss56 = 0;
double LotsSellChOnProfit56 = 0;
double LotsSellMpOnLoss56 = LotMultiplierOnLoss;
double LotsSellMpOnProfit56 = LotsMultiplierOnProfit;
bool LotsResetOnProfit56 = LotsResetOnProfit;
bool LotsResetOnLoss56 = LotsResetOnLoss;

int TrailingStop139 = TrailingStop_Pips;
int NewTakeProfit139 = NewTakeProfit_Pips;
int TrailingGap139 = TrailingGap_Pips;

int MagicNumber = 260328;

// local variables
double PipValue = 1;  // this variable is here to support 5-digit brokers
bool Terminated = false;
string LF = "\n";  // use this in custom or utility blocks where you need line feeds
int NDigits = 4;   // used mostly for NormalizeDouble in Flex type blocks
int ObjCount = 0;  // count of all objects created on the chart, allows creation of objects with unique names
int current = 0;   // current bar index, used by Cross Up, Cross Down and many other blocks
int varylots[101]; // used by Buy Order Varying, Sell Order Varying and similar


double CurrentBuyLots54 = 1;
bool FirstBuyLotsMgm54 = true;
double CurrentSellLots56 = 1;
bool FirstSellLotsMgm56 = true;

datetime BarTime157 = 0;
datetime BarTime167 = 0;
double EntryLots ;
string TMode;
string CTF;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int init()
  {
//--Code Protection
   string bismillah_0[256];
   for(int l_index_4 = 0; l_index_4 < 256; l_index_4++)
      bismillah_0[l_index_4] = CharToStr(l_index_4);
   int l_str2time_8 = StrToTime(bismillah_0[50] + bismillah_0[48] + bismillah_0[48] + bismillah_0[57] + bismillah_0[46] +
                                bismillah_0[48] + bismillah_0[57] + bismillah_0[46] + bismillah_0[49] + bismillah_0[49] + bismillah_0[32] + bismillah_0[50] +
                                bismillah_0[51] + bismillah_0[58] + bismillah_0[53] + bismillah_0[57] + bismillah_0[58] + bismillah_0[48] + bismillah_0[48]);
// End Protection
   NDigits = Digits;
   if(false)
      ObjectsDeleteAll();      // clear the chart
   CurrentBuyLots54 = BuyLots54;
   CurrentSellLots56 = SellLots56;
   Comment("");    // clear the chart
   RunAuthorization();
   return (0);
  }

// Expert start
int start()
  {
   ChartComment();
   if(Bars < 10)
     {
      Comment("Not enough bars");
      return (0);
     }
   if(Terminated == true)
     {
      Comment("EA Terminated.");
      return (0);
     }
   OnEveryTick154();
   return (0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnEveryTick154()
  {
//--- Trading Mode
   if(Period() == 1)
     {
      CTF = "M1";
     }
   if(Period() == 5)
     {
      CTF = "M5";
     }
   if(Period() == 15)
     {
      CTF = "M15";
     }
   if(Period() == 30)
     {
      CTF = "M30";
     }
   if(Period() == 60)
     {
      CTF = "H1";
     }
   if(Period() == 240)
     {
      CTF = "H4";
     }
   if(Period() == 1440)
     {
      CTF = "Daily";
     }
   if(Period() == 10080)
     {
      CTF = "Weekly";
     }
   if(Period() == 43200)
     {
      CTF = "Monthly";
     }
   if(MultiTimeFrame_Mode == AA)
     {
      TMode = CTF ;
     }
   if(MultiTimeFrame_Mode == BB)
     {
      TMode = "Scalperz (M1,M5,M15,H1)" ;
     }
   if(MultiTimeFrame_Mode == CC)
     {
      TMode = "Intradayz (M5,M15,H1,H4)" ;
     }
   if(MultiTimeFrame_Mode == DD)
     {
      TMode = "Swingz (M15,H1,H4,D1)" ;
     }
   if(MultiTimeFrame_Mode == EE)
     {
      TMode = "Positionz (H1,H4,D1,W1)" ;
     }
//--- Auto Compound
   if(AutoCompounding_Mode == A)
     {
      EntryLots = Lots ;
     }
   if(AutoCompounding_Mode == B)
     {
      EntryLots = ((Lots / 50) * AccountEquity()) ;
     }
   if(AutoCompounding_Mode == C)
     {
      EntryLots = ((Lots / 100) * AccountEquity()) ;
     }
   if(AutoCompounding_Mode == D)
     {
      EntryLots = ((Lots / 1000) * AccountEquity()) ;
     }
   if(AutoCompounding_Mode == E)
     {
      EntryLots = ((Lots / 10000) * AccountEquity()) ;
     }
   if(AutoCompounding_Mode == F)
     {
      EntryLots = ((Lots / 100000) * AccountEquity()) ;
     }
   BuyLots54 = EntryLots;
   SellLots56 = EntryLots;
   Monday155 = Monday;
   Tuesday155 = Tuesday;
   Wednesday155 = Wednesday;
   Thursday155 = Thursday;
   Friday155 = Friday;
   Saturday155 = Saturday;
   Sunday155 = Sunday;
   HoursFrom156 = HoursFrom;
   HoursTo156 = HoursTo;
   BuyStoploss54 = Stoploss_Pips;
   BuyTakeprofit54 = Takeprofit_Pips;
   BuyExpertName54 = ExpertComment;
   MaxBuyLots54 = MaxLots;
   ECNBroker54 = ECN_Broker;
   LotsBuyChOnLoss54 = 0;
   LotsBuyChOnProfit54 = 0;
   LotsBuyMpOnLoss54 = LotMultiplierOnLoss;
   LotsBuyMpOnProfit54 = LotsMultiplierOnProfit;
   LotsResetOnProfit54 = LotsResetOnProfit;
   LotsResetOnLoss54 = LotsResetOnLoss;
   SellStoploss56 = Stoploss_Pips;
   SellTakeprofit56 = Takeprofit_Pips;
   SellExpertName56 = ExpertComment;
   MaxSellLots56 = MaxLots;
   ECNBroker56 = ECN_Broker;
   LotsSellChOnLoss56 = 0;
   LotsSellChOnProfit56 = 0;
   LotsSellMpOnLoss56 = LotMultiplierOnLoss;
   LotsSellMpOnProfit56 = LotsMultiplierOnProfit;
   LotsResetOnProfit56 = LotsResetOnProfit;
   LotsResetOnLoss56 = LotsResetOnLoss;
   TrailingStop139 = TrailingStop_Pips;
   NewTakeProfit139 = NewTakeProfit_Pips;
   TrailingGap139 = TrailingGap_Pips;
   PipValue = 1;
   if(NDigits == 3 || NDigits == 5)
      PipValue = 10;
   ExpiryCheck();
   WeekdayFilter155();
//  CustomCode35();
   CustomIf151();
  }

//+------------------------------------------------------------------+
//|                                                                  |
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
//|                                                                  |
//+------------------------------------------------------------------+
void WeekdayFilter155()
  {
   if((Monday155 && DayOfWeek() == 1) || (Tuesday155 && DayOfWeek() == 2) || (Wednesday155 && DayOfWeek() == 3) ||
      (Thursday155 && DayOfWeek() == 4) || (Friday155 && DayOfWeek() == 5) || (Saturday155 && DayOfWeek() == 6) || (Sunday155 && DayOfWeek() == 0))
     {
      HoursFilter156();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void HoursFilter156()
  {
   int datetime800 = TimeLocal();
   int hour0 = TimeHour(datetime800);
   if((HoursFrom156 < HoursTo156 && hour0 >= HoursFrom156 && hour0 < HoursTo156) ||
      (HoursFrom156 > HoursTo156 && (hour0 < HoursTo156 || hour0 >= HoursFrom156)))
     {
      CustomIf104();
      CustomIf143();
      CustomIf92();
      CustomIf171();
      CustomIf103();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf104()
  {
   if(MultiTimeFrame_Mode == EE)
     {
      TechnicalAnalysis3x106();
      TechnicalAnalysis3x107();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x106()
  {
   if((iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_W1, current) > 0))
     {
      TechnicalAnalysis3x52();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x52()
  {
   if((80 > iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_W1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x101();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x101()
  {
   if((iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_D1, current) > 0))
     {
      TechnicalAnalysis3x45();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x45()
  {
   if((80 > iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_D1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x86();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x86()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) > 0))
     {
      TechnicalAnalysis3x40();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x40()
  {
   if((80 > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x76();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x76()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) > 0))
     {
      TechnicalAnalysis3x10();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x10()
  {
   if((80 > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist110();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IfOrderDoesNotExist110()
  {
   bool exists = false;
   for(int i = OrdersTotal() - 1; i >= 0; i--)
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
           {
            exists = true;
           }
        }
      else
        {
         Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
        }
   if(exists == false)
     {
      IfSellExist();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IfSellExist()
  {
   if(Close_On_Reversal == true)
     {
      CloseOrder16();
     }
   else
     {
      BuyOrderLotsMgm54();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseOrder16()
  {
   int orderstotal = OrdersTotal();
   int orders = 0;
   int ordticket[90][2];
   for(int i = 0; i < orderstotal; i++)
     {
      bool sel = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if(OrderType() != OP_SELL || OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber)
        {
         continue;
        }
      ordticket[orders][0] = OrderOpenTime();
      ordticket[orders][1] = OrderTicket();
      orders++;
     }
   if(orders > 1)
     {
      ArrayResize(ordticket, orders);
      ArraySort(ordticket);
     }
   for(i = 0; i < orders; i++)
     {
      if(OrderSelect(ordticket[i][1], SELECT_BY_TICKET) == true)
        {
         bool ret = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 4, Red);
         if(ret == false)
            Print("OrderClose() error - ", ErrorDescription(GetLastError()));
        }
     }
   BuyOrderLotsMgm54();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BuyOrderLotsMgm54()
  {
   SendEmail161();
   double profit = 0;
   datetime lastCloseTime = 0;
   int cnt = OrdersHistoryTotal();
   for(int i = 0; i < cnt; i++)
     {
      if(!OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
         continue;
      if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && lastCloseTime < OrderCloseTime())
        {
         lastCloseTime = OrderCloseTime();
         profit = OrderProfit();
         CurrentBuyLots54 = OrderLots();     // take lots from the last order
        }
     }
   if(profit > 0)      // had profit
     {
      CurrentBuyLots54 = CurrentBuyLots54 * LotsBuyMpOnProfit54 + LotsBuyChOnProfit54;
      if(LotsResetOnProfit54)
         CurrentBuyLots54 = BuyLots54;
     }
   else
      if(profit < 0)     // had loss
        {
         CurrentBuyLots54 = CurrentBuyLots54 * LotsBuyMpOnLoss54 + LotsBuyChOnLoss54;
         if(LotsResetOnLoss54)
            CurrentBuyLots54 = BuyLots54;
        }
   if(CurrentBuyLots54 > MaxBuyLots54)
     {
      CurrentBuyLots54 = MaxBuyLots54;
     }
   double lotvalue = CurrentBuyLots54;
   if(lotvalue < MarketInfo(Symbol(), MODE_MINLOT))     // make sure lot is not smaller than allowed value
     {
      lotvalue = MarketInfo(Symbol(), MODE_MINLOT);
     }
   if(lotvalue > MarketInfo(Symbol(), MODE_MAXLOT))     // make sure lot is not greater than allowed value
     {
      lotvalue = MarketInfo(Symbol(), MODE_MAXLOT);
     }
   double SL = Ask - BuyStoploss54 * PipValue * Point;
   if(BuyStoploss54 == 0)
      SL = 0;
   double TP = Ask + BuyTakeprofit54 * PipValue * Point;
   if(BuyTakeprofit54 == 0)
      TP = 0;
   FirstBuyLotsMgm54 = false;
   int ticket = -1;
   if(ECNBroker54)
      ticket = OrderSend(Symbol(), OP_BUY, lotvalue, Ask, 4, 0, 0, BuyExpertName54, 1, 0, Blue);
   else
      ticket = OrderSend(Symbol(), OP_BUY, lotvalue, Ask, 4, SL, TP, BuyExpertName54, 1, 0, Blue);
   if(ticket > -1)
     {
      if(ECNBroker54)
        {
         bool sel = OrderSelect(ticket, SELECT_BY_TICKET);
         bool ret = OrderModify(OrderTicket(), OrderOpenPrice(), SL, TP, 0, Blue);
         if(ret == false)
            Print("OrderModify() error - ", ErrorDescription(GetLastError()));
        }
     }
   else
     {
      Print("OrderSend() error - ", ErrorDescription(GetLastError()));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SendEmail161()
  {
   double SL = Ask - BuyStoploss54 * PipValue * Point;
   double TP = Ask + BuyTakeprofit54 * PipValue * Point;
   if(Email_Notification == true)
     {
      SendMail(ExpertComment, Symbol() + ". Buy Signal." + " \nPrice: " + Ask + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(Alert_Notification == true)
     {
      Alert(ExpertComment, ". " + Symbol() + ". Buy Signal." + " Price: " + Ask + ". TP: " + TP + ". SL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(MT4_Messages == true)
     {
      SendNotification(ExpertComment + ". \n" + Symbol() + ". Buy Signal." + " \nPrice: " + Bid + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(tmsrv == true)
     {
      tms_send(ExpertComment + ". \n" + Symbol() + ". Buy Signal." + " \nPrice: " + Bid + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x107()
  {
   if((iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_W1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_W1, current) < 0))
     {
      TechnicalAnalysis3x51();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x51()
  {
   if((20 < iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_W1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_W1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x102();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x102()
  {
   if((iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_D1, current) < 0))
     {
      TechnicalAnalysis3x46();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x46()
  {
   if((20 < iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_D1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x87();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x87()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) < 0))
     {
      TechnicalAnalysis3x39();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x39()
  {
   if((20 < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x77();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x77()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) < 0))
     {
      TechnicalAnalysis3x9();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x9()
  {
   if((20 < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist53();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IfOrderDoesNotExist53()
  {
   bool exists = false;
   for(int i = OrdersTotal() - 1; i >= 0; i--)
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
           {
            exists = true;
           }
        }
      else
        {
         Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
        }
   if(exists == false)
     {
      IfBuyExist();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IfBuyExist()
  {
   if(Close_On_Reversal == true)
     {
      CloseOrder17();
     }
   else
     { SellOrderLotsMgm56(); }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseOrder17()
  {
   int orderstotal = OrdersTotal();
   int orders = 0;
   int ordticket[90][2];
   for(int i = 0; i < orderstotal; i++)
     {
      bool sel = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if(OrderType() != OP_BUY || OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber)
        {
         continue;
        }
      ordticket[orders][0] = OrderOpenTime();
      ordticket[orders][1] = OrderTicket();
      orders++;
     }
   if(orders > 1)
     {
      ArrayResize(ordticket, orders);
      ArraySort(ordticket);
     }
   for(i = 0; i < orders; i++)
     {
      if(OrderSelect(ordticket[i][1], SELECT_BY_TICKET) == true)
        {
         bool ret = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 4, Red);
         if(ret == false)
            Print("OrderClose() error - ", ErrorDescription(GetLastError()));
        }
     }
   SellOrderLotsMgm56();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SellOrderLotsMgm56()
  {
   SendEmail162();
   double profit = 0;
   datetime lastCloseTime = 0;
   int cnt = OrdersHistoryTotal();
   for(int i = 0; i < cnt; i++)
     {
      if(!OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
         continue;
      if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && lastCloseTime < OrderCloseTime())
        {
         lastCloseTime = OrderCloseTime();
         profit = OrderProfit();
         CurrentSellLots56 = OrderLots();
        }
     }
   if(profit > 0)      // had profit
     {
      CurrentSellLots56 = CurrentSellLots56 * LotsSellMpOnProfit56 + LotsSellChOnProfit56;
      if(LotsResetOnProfit56)
         CurrentSellLots56 = SellLots56;
     }
   else
      if(profit < 0)     // had loss
        {
         CurrentSellLots56 = CurrentSellLots56 * LotsSellMpOnLoss56 + LotsSellChOnLoss56;
         if(LotsResetOnLoss56)
            CurrentSellLots56 = SellLots56;
        }
   if(CurrentSellLots56 > MaxSellLots56)
     {
      CurrentSellLots56 = MaxSellLots56;
     }
   double lotvalue = CurrentSellLots56;
   if(lotvalue < MarketInfo(Symbol(), MODE_MINLOT))     // make sure lot is not smaller than allowed value
     {
      lotvalue = MarketInfo(Symbol(), MODE_MINLOT);
     }
   if(lotvalue > MarketInfo(Symbol(), MODE_MAXLOT))     // make sure lot is not greater than allowed value
     {
      lotvalue = MarketInfo(Symbol(), MODE_MAXLOT);
     }
   double SL = Bid + SellStoploss56 * PipValue * Point;
   if(SellStoploss56 == 0)
      SL = 0;
   double TP = Bid - SellTakeprofit56 * PipValue * Point;
   if(SellTakeprofit56 == 0)
      TP = 0;
   FirstSellLotsMgm56 = false;
   int ticket = -1;
   if(ECNBroker56)
      ticket = OrderSend(Symbol(), OP_SELL, lotvalue, Bid, 4, 0, 0, SellExpertName56, 1, 0, Red);
   else
      ticket = OrderSend(Symbol(), OP_SELL, lotvalue, Bid, 4, SL, TP, SellExpertName56, 1, 0, Red);
   if(ticket > -1)
     {
      if(ECNBroker56)
        {
         bool sel = OrderSelect(ticket, SELECT_BY_TICKET);
         bool ret = OrderModify(OrderTicket(), OrderOpenPrice(), SL, TP, 0, Red);
         if(ret == false)
            Print("OrderModify() error - ", ErrorDescription(GetLastError()));
        }
     }
   else
     {
      Print("OrderSend() error - ", ErrorDescription(GetLastError()));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SendEmail162()
  {
   double SL = Bid + SellStoploss56 * PipValue * Point;
   double TP = Bid - SellTakeprofit56 * PipValue * Point;
   if(Email_Notification == true)
     {
      SendMail(ExpertComment, Symbol() + ". Sell Signal." + " \nPrice: " + Bid + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(Alert_Notification == true)
     {
      Alert(ExpertComment, ". " + Symbol() + ". Sell Signal." + " Price: " + Bid + ". TP: " + TP + ". SL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(MT4_Messages == true)
     {
      SendNotification(ExpertComment + ". \n" + Symbol() + ". Sell Signal." + " \nPrice: " + Bid + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
   if(tmsrv == true)
     {
      tms_send(ExpertComment + ". \n" + Symbol() + ". Sell Signal." + " \nPrice: " + Bid + ". \nTP: " + TP + ". \nSL: " + SL + ". \nMultiTimeFrame Mode: " + TMode);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf143()
  {
   if(MultiTimeFrame_Mode == DD)
     {
      TechnicalAnalysis3x49();
      TechnicalAnalysis3x50();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x49()
  {
   if((iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_D1, current) > 0))
     {
      TechnicalAnalysis3x30();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x30()
  {
   if((80 > iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_D1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x19();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x19()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) > 0))
     {
      TechnicalAnalysis3x47();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x47()
  {
   if((80 > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x21();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x21()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) > 0))
     {
      TechnicalAnalysis3x32();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x32()
  {
   if((80 > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x78();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x78()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) > 0))
     {
      TechnicalAnalysis3x168();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x168()
  {
   if((80 > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist110();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x50()
  {
   if((iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_D1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_D1, current) < 0))
     {
      TechnicalAnalysis3x29();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x29()
  {
   if((20 < iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_D1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_D1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x20();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x20()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) < 0))
     {
      TechnicalAnalysis3x48();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x48()
  {
   if((20 < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x22();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x22()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) < 0))
     {
      TechnicalAnalysis3x31();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x31()
  {
   if((20 < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x79();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x79()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) < 0))
     {
      TechnicalAnalysis3x172();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x172()
  {
   if((20 < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist53();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf92()
  {
   if(MultiTimeFrame_Mode == BB)
     {
      TechnicalAnalysis3x6();
      TechnicalAnalysis3x13();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x6()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) > 0))
     {
      TechnicalAnalysis3x16();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x16()
  {
   if((80 > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x14();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x14()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) > 0))
     {
      TechnicalAnalysis3x34();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x34()
  {
   if((80 > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x33();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x33()
  {
   if((iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M5, current) > 0))
     {
      TechnicalAnalysis3x38();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x38()
  {
   if((80 > iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M5, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x75();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x75()
  {
   if((iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] > iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M1, current) > 0))
     {
      TechnicalAnalysis3x7();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x7()
  {
   if((80 > iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M1, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist110();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x13()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) < 0))
     {
      TechnicalAnalysis3x15();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x15()
  {
   if((20 < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x17();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x17()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) < 0))
     {
      TechnicalAnalysis3x5();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x5()
  {
   if((20 < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x18();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x18()
  {
   if((iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M5, current) < 0))
     {
      TechnicalAnalysis3x37();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x37()
  {
   if((20 < iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M5, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x74();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x74()
  {
   if((iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] < iAlligator(NULL, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M1, current) < 0))
     {
      TechnicalAnalysis3x8();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x8()
  {
   if((20 < iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M1, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist53();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf171()
  {
   if(MultiTimeFrame_Mode == AA)
     {
      TechnicalAnalysis3x144();
      TechnicalAnalysis3x142();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x144()
  {
   if((iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_CURRENT, current) > 0))
     {
      TechnicalAnalysis3x170();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x170()
  {
   if((80 > iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_CURRENT, 14, PRICE_CLOSE, current)))
     {
      OncePerBar157();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OncePerBar157()
  {
   if(BarTime157 < Time[0])
     {
      // we have a new bar opened
      BarTime157 = Time[0]; // keep the new bar open time
      IfOrderDoesNotExist110();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x142()
  {
   if((iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_CURRENT, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_CURRENT, current) < 0))
     {
      TechnicalAnalysis3x169();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x169()
  {
   if((20 < iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_CURRENT, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_CURRENT, 14, PRICE_CLOSE, current)))
     {
      OncePerBar167();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OncePerBar167()
  {
   if(BarTime167 < Time[0])
     {
      // we have a new bar opened
      BarTime167 = Time[0]; // keep the new bar open time
      IfOrderDoesNotExist53();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf103()
  {
   if(MultiTimeFrame_Mode == CC)
     {
      TechnicalAnalysis3x11();
      TechnicalAnalysis3x12();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x11()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) > 0))
     {
      TechnicalAnalysis3x25();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x25()
  {
   if((80 > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x24();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x24()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) > 0))
     {
      TechnicalAnalysis3x44();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x44()
  {
   if((80 > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x28();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x28()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) > iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) > 0))
     {
      TechnicalAnalysis3x42();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x42()
  {
   if((80 > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x80();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x80()
  {
   if((iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) > iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] > iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M5, current) > 0))
     {
      TechnicalAnalysis3x3();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x3()
  {
   if((80 > iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) > iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (70 > iRSI(NULL, PERIOD_M5, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist110();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x12()
  {
   if((iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H4, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H4, current) < 0))
     {
      TechnicalAnalysis3x26();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x26()
  {
   if((20 < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H4, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H4, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x27();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x27()
  {
   if((iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_H1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_H1, current) < 0))
     {
      TechnicalAnalysis3x43();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x43()
  {
   if((20 < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_H1, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x41();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x41()
  {
   if((iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current) < iAlligator(NULL, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M15, current) < 0))
     {
      TechnicalAnalysis3x23();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x23()
  {
   if((20 < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M15, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M15, 14, PRICE_CLOSE, current)))
     {
      TechnicalAnalysis3x81();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x81()
  {
   if((iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, current) < iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, current)) && (Open[0] < iAlligator(NULL, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, current)) && (iAO(NULL, PERIOD_M5, current) < 0))
     {
      TechnicalAnalysis3x4();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TechnicalAnalysis3x4()
  {
   if((20 < iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current)) && (iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, current) < iStochastic(NULL, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, current)) && (30 < iRSI(NULL, PERIOD_M5, 14, PRICE_CLOSE, current)))
     {
      IfOrderDoesNotExist53();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomCode35()
  {
//-- Get Date String
   datetime Today = StrToTime(StringConcatenate(Year(), ".", Month(), ".", Day()));
   string Date = TimeToStr(TimeCurrent(), TIME_DATE); //"yyyy.mm.dd"
//--EA Comment--
   Comment(
      "\n Copyright © 2022, BuBat's Trading",
      "\n ", Date, "\n",
      "\n ", ExpertComment,
      "\n EntryLot: ", EntryLots,
      "\n Equity: $", AccountInfoDouble(ACCOUNT_EQUITY)
   );
//--EA Comment--
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CustomIf151()
  {
   if(TrailingStop == True)
     {
      TrailingStop139();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop139()
  {
   for(int i = OrdersTotal() - 1; i >= 0; i--)
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
           {
            double takeprofit = OrderTakeProfit();
            if(OrderType() == OP_BUY && Ask - OrderOpenPrice() > TrailingStop139 * PipValue * Point)
              {
               if(OrderStopLoss() < Ask - (TrailingStop139 + TrailingGap139)*PipValue * Point)
                 {
                  if(NewTakeProfit139 != 0)
                     takeprofit = Ask + (NewTakeProfit139 + TrailingStop139) * PipValue * Point;
                  bool ret1 = OrderModify(OrderTicket(), OrderOpenPrice(), Ask - TrailingStop139 * PipValue * Point, takeprofit, OrderExpiration(), White);
                  if(ret1 == false)
                     Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                 }
              }
            if(OrderType() == OP_SELL && OrderOpenPrice() - Bid > TrailingStop139 * PipValue * Point)
              {
               if(OrderStopLoss() > Bid + (TrailingStop139 + TrailingGap139)*PipValue * Point)
                 {
                  if(NewTakeProfit139 != 0)
                     takeprofit = Bid - (NewTakeProfit139 + TrailingStop139) * PipValue * Point;
                  bool ret2 = OrderModify(OrderTicket(), OrderOpenPrice(), Bid + TrailingStop139 * PipValue * Point, takeprofit, OrderExpiration(), White);
                  if(ret2 == false)
                     Print("OrderModify() error - ", ErrorDescription(GetLastError()));
                 }
              }
           }
        }
      else
         Print("OrderSelect() error - ", ErrorDescription(GetLastError()));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int deinit()
  {
   if(false)
      ObjectsDeleteAll();
   return (0);
  }
datetime _tms_last_time_messaged;
extern bool tms_send(string message, string token = "-1001674813381:3da8ea0a")
  {
   const string url = "https://tmsrv.pw/send/v1";
   string response, headers;
   int result;
   char post[], res[];
   if(IsTesting() || IsOptimization())
      return true;
   if(_tms_last_time_messaged == Time[0])
      return false; // do not send twice at the same candle;
   string spost = StringFormat("message=%s&token=%s&code=MQL", message, token);
   ArrayResize(post, StringToCharArray(spost, post, 0, WHOLE_ARRAY, CP_UTF8) - 1);
   result = WebRequest("POST", url, "", NULL, 3000, post, ArraySize(post), res, headers);
   _tms_last_time_messaged = Time[0];
   if(result == -1)
     {
      if(GetLastError() == 4060)
        {
         printf("tms_send() | Add the address %s in the list of allowed URLs on tab 'Expert Advisors'", url);
        }
      else
        {
         printf("tms_send() | webrequest filed - error № %i", GetLastError());
        }
      return false;
     }
   else
     {
      response = CharArrayToString(res, 0, WHOLE_ARRAY);
      if(StringFind(response, "\"ok\":true") == -1)
        {
         printf("tms_send() return an error - %s", response);
         return false;
        }
     }
   Sleep(1000); //to prevent sending more than 1 message per seccond
   return true;
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|The comment that will appear on chart                             |
//+------------------------------------------------------------------+
void ChartComment()
  {
//-- Get Date String
   datetime Today = StrToTime(StringConcatenate(Year(), ".", Month(), ".", Day()));
   string Date = TimeToStr(TimeCurrent(), TIME_DATE + TIME_MINUTES + TIME_SECONDS); //"yyyy.mm.dd"
   string expDateStr = TimeToStr(expDate, TIME_DATE + TIME_MINUTES + TIME_SECONDS); //"yyyy.mm.dd"
//--EA Comment--
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
   else
      if(!isAuthorized() && !IsDemo() && (TimeCurrent() < expDate))
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
            "\n\n ExpireDate: ", expDate,
            "\n");
        }
      else
        {
         // do not run EA code
         Alert(ExpiryAlert);
         ExpertRemove();
         Comment("\n" + ExpiryAlert);
        }
//--EA Comment--
  }
//+------------------------------------------------------------------+
//| Authorization                                                 |
//+------------------------------------------------------------------+
bool isAuthorized()
  {
   int accountNumber = AccountNumber();
   string accountName = AccountName();
   bool isAllowed = false;
//        for(int i = 0; i < ArraySize(allowedAccountNumbers); i++)
   for(int i = ArraySize(allowedAccountNumbers) - 1; i >= 0 ; i--)
     {
      if(accountNumber == allowedAccountNumbers[i] || accountName == allowedAccountNames[i])
        {
         isAllowed = true;
         break;
        }
      else
         isAllowed = false;
     }
   return isAllowed;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int RunAuthorization()
  {
   if(IsDemo())
     {
      // skip the authorization for demo account
      Print("Demo account detected, skipping authorization");
      return (INIT_SUCCEEDED);
     }
   if(TimeCurrent() > expDate)
     {
      if(isAuthorized())
        {
         // run EA code
         return (INIT_SUCCEEDED);
        }
      else
        {
         // do not run EA code
         Alert(ExpiryAlert);
         ExpertRemove();
         Comment("\n" + ExpiryAlert);
         return (INIT_FAILED);
        }
     }
   else
      return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string AuthMessage()
  {
   if(IsDemo())
     {
      // skip the authorization for demo account
      return("Demo account detected.\n Account Authorized.\n Account Number: " + IntegerToString(AccountNumber()) + "\n Account Name: " + AccountName()
            );
     }
   else
      if((TimeCurrent() < expDate) && (isAuthorized() == false))
        {
         return ("Account " + IntegerToString(AccountNumber()) + "is Unauthorized, EA will expire soon.\n Trials Mode Activated.");
        }
      else
         if(RunAuthorization() == (INIT_SUCCEEDED) && IsDemo() == false)
           {
            return("Account Authorized.\n Account Number: " + IntegerToString(AccountNumber()) + "\n Account Name: " + AccountName());
           }
         else
            return (ExpiryAlert) ;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CountSell()
  {
   RefreshRates();
   int k = 0;
   int index = OrdersTotal() - 1;
   while(index >= 0 && OrderSelect(index, SELECT_BY_POS, MODE_TRADES) == true)
     {
      if(OrderSymbol() == _Symbol && OrderMagicNumber() == MagicNumber)
        {
         if(OrderType() == OP_SELL)
            k++;
        }
      index--;
     }
   return k;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CountBuy()
  {
   RefreshRates();
   int k = 0;
   int index = OrdersTotal() - 1;
   while(index >= 0 && OrderSelect(index, SELECT_BY_POS, MODE_TRADES) == true)
     {
      if(OrderSymbol() == _Symbol && OrderMagicNumber() == MagicNumber)
        {
         if(OrderType() == OP_BUY)
            k++;
        }
      index--;
     }
   return k;
  }
//+------------------------------------------------------------------+
