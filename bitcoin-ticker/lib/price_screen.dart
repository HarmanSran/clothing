import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/currency_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();

  String selectedCurrency = 'USD';
  int exchangeRateBTC;
  int exchangeRateETH;
  int exchangeRateLTC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            CurrencyTile(
              crypto: 'BTC',
              currency: selectedCurrency,
              exchangeRate: exchangeRateBTC,
            ),
            CurrencyTile(
              crypto: 'ETH',
              currency: selectedCurrency,
              exchangeRate: exchangeRateETH,
            ),
            CurrencyTile(
              crypto: 'LTC',
              currency: selectedCurrency,
              exchangeRate: exchangeRateLTC,
            ),
          ]),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: currenciesList
                  .map((currency) =>
                      DropdownMenuItem(child: Text(currency), value: currency))
                  .toList(),
              onChanged: (newCurrency) async {
                for (String crypto in cryptoList) {
                  var coinExchangeRate =
                      await coinData.getCoinData(crypto, newCurrency);
                  setState(() {
                    selectedCurrency = newCurrency;
                    if (crypto == 'BTC') {
                      exchangeRateBTC = coinExchangeRate != null
                          ? coinExchangeRate['rate'].toInt()
                          : null;
                    } else if (crypto == 'ETH') {
                      exchangeRateETH = coinExchangeRate != null
                          ? coinExchangeRate['rate'].toInt()
                          : null;
                    } else if (crypto == 'LTC') {
                      exchangeRateLTC = coinExchangeRate != null
                          ? coinExchangeRate['rate'].toInt()
                          : null;
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
