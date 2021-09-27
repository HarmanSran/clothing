import 'package:bitcoin_ticker/utilities/coin_data.dart';
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
          Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = ${exchangeRateBTC != null ? exchangeRateBTC : '?'} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = ${exchangeRateETH != null ? exchangeRateETH : '?'} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = ${exchangeRateLTC != null ? exchangeRateLTC : '?'} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
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
                      await coinData.getCoinExchangeRate(crypto, newCurrency);
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
