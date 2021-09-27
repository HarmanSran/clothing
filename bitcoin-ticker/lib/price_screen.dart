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
  Map<String, int> exchangeRates = new Map();

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map((crypto) => CurrencyTile(
                      crypto: crypto,
                      currency: selectedCurrency,
                      exchangeRate: exchangeRates[crypto],
                    ))
                .toList(),
          ),
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
                    exchangeRates[crypto] = coinExchangeRate != null
                        ? coinExchangeRate['rate'].toInt()
                        : null;
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
