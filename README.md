# 🐊 EA Aligator Gozaimasu v1.06

> **What is this?** A fully automated Expert Advisor for MetaTrader 4 that trades based on the **Bill Williams Alligator** indicator, confirmed by **Awesome Oscillator (AO)**, **RSI**, and **Stochastic**. It buys in uptrends and sells in downtrends, with multi-timeframe confirmation to filter out noise.

---

## 📖 Table of Contents

1. [How It Works](#-how-it-works)
2. [Trading Strategy Explained](#-trading-strategy-explained)
3. [Multi-Timeframe Modes](#-multi-timeframe-modes)
4. [Requirements](#-requirements)
5. [Installation](#-installation)
6. [EA Settings (Detailed)](#%EF%B8%8F-ea-settings-detailed)
7. [Auto-Compounding Modes](#-auto-compounding-modes)
8. [Martingale / Lot Management](#-martingale--lot-management)
9. [Trailing Stop](#-trailing-stop)
10. [Trading Hours Filter](#-trading-hours-filter)
11. [Notifications](#-notifications)
12. [Authorization & Expiry](#-authorization--expiry)
13. [How to Stop the EA](#-how-to-stop-the-ea)
14. [Troubleshooting](#-troubleshooting)
15. [FAQ](#-faq)

---

## 🔄 How It Works

The EA follows a simple principle: **trade with the trend, confirmed across multiple timeframes**.

```
ALLIGATOR INDICATOR        AWESOME OSCILLATOR        STOCHASTIC + RSI
(Trend Direction)          (Momentum)                (Overbought/Oversold Filter)
        │                        │                           │
        ▼                        ▼                           ▼
┌───────────────────────────────────────────────────────────────┐
│                    ALL 4 MUST AGREE                           │
│     Timeframe 1 ✅  →  Timeframe 2 ✅  →  Timeframe 3 ✅    │
│                         →  Timeframe 4 ✅                    │
└───────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────┴─────────┐
                    │                   │
               BUY SIGNAL          SELL SIGNAL
            (All bullish)       (All bearish)
```

**In plain English:**
1. The EA checks the **Alligator** indicator — are the lips, teeth, and jaw lines in the correct order for a trend?
2. The **Awesome Oscillator** must confirm momentum — positive for buy, negative for sell.
3. **Stochastic** must NOT be overbought (for buys) or oversold (for sells) — this filters out late entries.
4. **RSI** must be below 70 (for buys) or above 30 (for sells) — another exhaustion filter.
5. All 4 indicators across **all configured timeframes** must agree before a trade is placed.
6. Only **one trade per direction** is allowed at any time (single entry).
7. If **Close on Reversal** is enabled, opposite trades are closed before opening new ones.

---

## 📊 Trading Strategy Explained

### Indicators Used

| Indicator | Parameters | Role |
|-----------|-----------|------|
| **Bill Williams Alligator** | Jaw=13/8, Teeth=8/5, Lips=5/3 (SMMA, Median) | Determines trend direction |
| **Awesome Oscillator (AO)** | Default | Confirms momentum direction |
| **Stochastic** | K=5, D=3, Slowing=3 (SMA) | Filters overbought/oversold |
| **RSI** | Period=14, Close price | Additional exhaustion filter |

### Buy Conditions (all must be true on each timeframe)

1. **Alligator Bullish:** Lips > Teeth > Jaw (lines spreading upward)
2. **AO Positive:** Awesome Oscillator > 0 (bullish momentum)
3. **Stochastic Not Overbought:** Main < 80 AND Main > Signal (still rising)
4. **RSI Not Overbought:** RSI < 70

### Sell Conditions (all must be true on each timeframe)

1. **Alligator Bearish:** Lips < Teeth < Jaw (lines spreading downward)
2. **AO Negative:** Awesome Oscillator < 0 (bearish momentum)
3. **Stochastic Not Oversold:** Main > 20 AND Main < Signal (still falling)
4. **RSI Not Oversold:** RSI > 30

### Entry Timeframe (Lowest TF in the mode)

On the **lowest timeframe** of the selected mode, the EA applies a slightly different check:
- Instead of checking Lips > Teeth > Jaw, it checks that **price (Open[0]) is above the Jaw** for buys (or below the Jaw for sells).
- This ensures the current candle has actually broken into the trend, not just showing aligned moving averages.

---

## 🕐 Multi-Timeframe Modes

The EA offers 5 trading modes. Each mode checks 4 timeframes that must **all agree** before entering a trade. This dramatically reduces false signals.

| Mode | Label | Timeframes (Highest → Lowest) | Best For |
|------|-------|-------------------------------|----------|
| **AA** | No MTF | Current chart TF only | Quick testing, single TF trading |
| **BB** | Scalperz | H1, M15, M5, M1 | Scalping, high-frequency |
| **CC** | Intradayz | H4, H1, M15, M5 | **Intraday trading (default)** |
| **DD** | Swingz | D1, H4, H1, M15 | Swing trading, multi-day holds |
| **EE** | Positionz | W1, D1, H4, H1 | Position trading, long-term |

> 💡 **Recommended:** Start with **Intradayz (CC)** for a good balance between signal quality and frequency. Change to **Swingz (DD)** for less frequent but higher-quality setups.

> ⚠️ **Important:** The chart timeframe doesn't matter — the EA fetches data from the configured timeframes internally. You can view any timeframe you like.

---

## 📋 Requirements

- **MetaTrader 4** — any broker that supports MT4
- **Recommended capital:** $100 USD minimum per pair
- **Trending pairs** work best — EURUSD, GBPUSD, USDJPY, XAUUSD, indices
- **VPS recommended** for 24/7 operation (optional)

---

## 📂 Installation

### Step 1: Download the EA
Download the compiled `.ex4` file.

### Step 2: Open your MT4 data folder
1. Open MetaTrader 4
2. Click **File → Open Data Folder**
3. Navigate to `MQL4\Experts\`

### Step 3: Copy the EA file
Place the `.ex4` file into the `MQL4\Experts\` folder.

### Step 4: Refresh and attach
1. Go back to MetaTrader 4
2. In the **Navigator** panel (Ctrl+N), right-click **Expert Advisors** → **Refresh**
3. You should see **EA Aligator Gozaimasu** in the list
4. Drag it onto a chart of your chosen pair

### Step 5: Configure settings
In the EA dialog:
- **Common tab:** ☑ Check **Allow live trading**
- **Inputs tab:** Adjust settings as needed (see below)
- Click **OK**

### Step 6: Enable Auto Trading
Make sure the **Auto Trading** button in the MT4 toolbar is **enabled** (green icon).

---

## ⚙️ EA Settings (Detailed)

### Core Trading Settings

| Setting | Type | Default | Description |
|---------|------|---------|-------------|
| `Lots` | double | `0.01` | Base lot size for each trade |
| `Takeprofit_Pips` | int | `50` | Take profit distance in pips |
| `Stoploss_Pips` | int | `50` | Stop loss distance in pips |
| `Close_On_Reversal` | bool | `true` | Close opposite trades when a reversal signal appears |
| `MultiTimeFrame_Mode` | enum | `CC (Intradayz)` | Which multi-timeframe mode to use |
| `AutoCompounding_Mode` | enum | `A (Off)` | Auto lot-sizing based on equity |
| `ECN_Broker` | bool | `false` | Enable for ECN brokers (sends order without SL/TP first, then modifies) |

### Close on Reversal

When `Close_On_Reversal = true`:
- If the EA gets a **buy signal** and there are open **sell** orders → it closes all sells first, then opens the buy
- If the EA gets a **sell signal** and there are open **buy** orders → it closes all buys first, then opens the sell
- This ensures you're always positioned in the direction of the trend

When `Close_On_Reversal = false`:
- The EA simply opens new trades without closing opposite ones
- This can result in hedged positions (both buy and sell open simultaneously)

### ECN Broker Mode

Some ECN brokers don't allow setting SL/TP at order time. When `ECN_Broker = true`:
1. The EA sends the order **without** SL/TP
2. Once the order is confirmed, it **modifies** the order to add SL/TP
3. This avoids "Invalid stops" errors on ECN brokers

---

## 📈 Auto-Compounding Modes

Auto-compounding adjusts your lot size based on your account equity. As your account grows, your position size grows proportionally.

| Mode | Label | Formula | Example ($1,000 equity, Lots=0.01) |
|------|-------|---------|--------------------------------------|
| **A** | Off | `Lots` (fixed) | 0.01 lots |
| **B** | Very High Risk | `Lots ÷ 50 × Equity` | 0.01 / 50 × 1000 = **0.20 lots** |
| **C** | High Risk | `Lots ÷ 100 × Equity` | 0.01 / 100 × 1000 = **0.10 lots** |
| **D** | Medium Risk | `Lots ÷ 1,000 × Equity` | 0.01 / 1000 × 1000 = **0.01 lots** |
| **E** | Low Risk | `Lots ÷ 10,000 × Equity` | 0.01 / 10000 × 1000 = **0.001 lots** |
| **F** | Very Low Risk | `Lots ÷ 100,000 × Equity` | 0.01 / 100000 × 1000 = **0.0001 lots** |

> ⚠️ **Warning:** Mode B and C can produce very large lot sizes on bigger accounts. Start with Mode D or E if unsure.

---

## 🎲 Martingale / Lot Management

The EA includes a martingale-style lot management system. After each closed trade, the lot size for the next trade is adjusted based on whether the last trade was a win or a loss.

| Setting | Default | Description |
|---------|---------|-------------|
| `LotMultiplierOnLoss` | `2.25` | Multiply lot size by this after a losing trade |
| `LotsMultiplierOnProfit` | `1.0` | Multiply lot size by this after a winning trade |
| `MaxLots` | `999` | Maximum allowed lot size (safety cap) |
| `LotsResetOnProfit` | `true` | Reset to base lot after a winning trade |
| `LotsResetOnLoss` | `false` | Reset to base lot after a losing trade |

### How it works:

1. **After a loss:** Next lot = Previous lot × `LotMultiplierOnLoss` (2.25x by default)
2. **After a win:** If `LotsResetOnProfit = true`, lots reset to the base `Lots` value
3. This creates a **recovery sequence** — after losing, the next trade is larger to recover the loss
4. After a win, the lot resets to normal

**Example sequence** (base lot = 0.01, multiplier = 2.25):
```
Trade 1: 0.01 lots → LOSS
Trade 2: 0.02 lots (0.01 × 2.25, rounded) → LOSS
Trade 3: 0.05 lots (0.02 × 2.25) → WIN
Trade 4: 0.01 lots (reset to base) → ...
```

> ⚠️ **Risk Warning:** Martingale can be dangerous. The lot size can grow exponentially after consecutive losses. Always set a reasonable `MaxLots` and use proper capital management.

---

## 📍 Trailing Stop

When enabled, the trailing stop follows the price to lock in profits as the trade moves in your favor.

| Setting | Default | Description |
|---------|---------|-------------|
| `TrailingStop` | `false` | Enable/disable trailing stop |
| `TrailingStop_Pips` | `25` | Distance from current price to trailing SL |
| `TrailingGap_Pips` | `7` | Minimum distance price must move before trailing activates |
| `NewTakeProfit_Pips` | `0` | If > 0, dynamically adjusts TP along with the trailing SL |

### How it works:

1. The trailing stop only activates once price has moved `TrailingStop_Pips` pips in profit
2. It trails `TrailingGap_Pips` behind the trailing distance as a buffer
3. For **buy orders**: SL moves up as price rises, but never moves down
4. For **sell orders**: SL moves down as price falls, but never moves up
5. If `NewTakeProfit_Pips > 0`: The TP is also adjusted forward by `NewTakeProfit_Pips + TrailingStop_Pips` from current price

---

## ⏰ Trading Hours Filter

Control which days and hours the EA is allowed to trade.

| Setting | Default | Description |
|---------|---------|-------------|
| `Monday` – `Sunday` | All `true` | Enable/disable trading on specific days |
| `HoursFrom` | `0` | Start trading hour (local time) |
| `HoursTo` | `24` | Stop trading hour (local time) |

**Examples:**
- Trade only during London + NY session: `HoursFrom = 8`, `HoursTo = 22`
- Skip Friday trading: `Friday = false`
- The filter uses **local time** (your computer's clock), not server time

> 💡 **Note:** The hours filter supports overnight ranges. For example, `HoursFrom = 22` and `HoursTo = 6` means "trade from 10 PM to 6 AM".

---

## 📬 Notifications

The EA can send alerts when trades are placed.

| Setting | Default | Description |
|---------|---------|-------------|
| `Email_Notification` | `true` | Send trade signals via email (configure in MT4 → Tools → Options → Email) |
| `Alert_Notification` | `false` | Show popup alert windows |
| `MT4_Messages` | `true` | Send push notifications to MT4 mobile app |

Each notification includes: pair name, signal direction, entry price, TP, SL, and the active multi-timeframe mode.

---

## 🔐 Authorization & Expiry

The EA has a built-in authorization and expiry system:

- **Demo accounts:** Always allowed, no restrictions
- **Live accounts:** Work during the trial period (before expiry date)
- **After expiry:** Only authorized account numbers/names can continue using the EA
- **Current expiry:** `2026-03-28 23:55`

If the EA expires on your account, it will:
1. Show an alert message
2. Remove itself from the chart
3. Contact information is displayed for renewal

---

## 🛑 How to Stop the EA

### Temporarily pause:
- Click the **Auto Trading** button in the MT4 toolbar (icon turns red)
- The EA stays attached but won't place new trades

### Remove from chart:
- Right-click on the chart → **Expert Advisors** → **Remove**

### Close all trades:
- Manually close trades in the Trade tab, or
- Remove the EA (it won't close existing trades on removal)

---

## ❗ Troubleshooting

### "OrderSend() error - 130 Invalid stops"
**Cause:** SL or TP is too close to the current price.
**Fix:** Increase `Stoploss_Pips` and `Takeprofit_Pips`. Minimum depends on your broker's stop level.

### "OrderSend() error - 131 Invalid trade volume"
**Cause:** Lot size is below broker minimum or above maximum.
**Fix:** Check your `Lots` setting. Minimum is usually 0.01.

### "Not enough bars"
**Cause:** The chart doesn't have enough historical data loaded.
**Fix:** Scroll back on the chart to load more history, or wait for more bars to form.

### EA not placing any trades
**Causes:**
1. **Auto Trading is OFF** — check the toolbar button (should be green)
2. **Allow live trading not checked** — right-click chart → Expert Advisors → Properties → Common tab
3. **Trading hours filter** — check if current time is within `HoursFrom`–`HoursTo`
4. **Day filter** — check if today's day is enabled
5. **Indicators not aligned** — all 4 indicators across all timeframes must agree. This is strict by design.

### EA expired message
**Cause:** The expiry date has passed and your account is not authorized.
**Fix:** Contact Budak Ubat for renewal, or use a demo account for trial.

### "OrderModify() error"
**Cause:** Usually happens with ECN broker mode when the stop level is invalid.
**Fix:** Try enabling `ECN_Broker = true` if you're on an ECN broker, or check your broker's minimum stop distance.

---

## ❓ FAQ

**Q: What pairs does this work best on?**
A: Trending pairs like EURUSD, GBPUSD, USDJPY, XAUUSD, and indices. The Alligator indicator works best on instruments that trend clearly. Avoid ranging/choppy pairs.

**Q: What timeframe should I use?**
A: The chart timeframe doesn't matter — the EA uses its own multi-timeframe settings. Start with **Intradayz (CC)** mode which is the default.

**Q: Why isn't the EA trading?**
A: The multi-timeframe requirement is very strict. All 4 timeframes × 4 indicators must agree. Sometimes it takes hours or days to find a valid signal. This is by design — quality over quantity.

**Q: Can I run this on multiple pairs?**
A: Yes! Attach the EA to different chart pairs. Each instance is independent. The `MagicNumber` ensures trades don't interfere with each other.

**Q: Is martingale safe?**
A: Martingale carries significant risk. The default multiplier of 2.25x means after 3 consecutive losses, your lot is ~11x the base size. Always set `MaxLots` to a reasonable value and never risk more than you can afford.

**Q: Does the EA close trades on its own?**
A: Yes — trades are closed by TP, SL, trailing stop, or by the **Close on Reversal** feature. The EA does not leave trades unmanaged.

**Q: Can I backtest this EA?**
A: Yes. Open MetaTrader 4 → **Strategy Tester** (Ctrl+R), select the EA, choose a pair and timeframe, set the dates, and click Start. Note that multi-timeframe modes require history data for all relevant timeframes.

---

## 📁 File Structure

```
EA Aligator Gozaimasu/
├── EA - Aligator Gozaimasu v1.06 - .mq4    ← Source code
└── README.md                                 ← This documentation
```

---

## ⚠️ Important Warnings

- **Always test on a demo account first** before using real money
- **Past performance does not guarantee future results**
- **Martingale is risky** — consecutive losses can wipe out an account
- **Monitor your trades** — especially during high-impact news events
- **Start with small lots** — increase only after thorough testing
- **VPS recommended** for 24/7 uninterrupted operation

---

<p align="center">
  <strong>Built with ❤️ by Syarief Azman</strong><br>
  Bill Williams Alligator · Awesome Oscillator · RSI · Stochastic<br><br>
  📬 For support: <a href="https://t.me/EABudakUbat">t.me/EABudakUbat</a> | WhatsApp/Telegram: +60194961568
</p>
