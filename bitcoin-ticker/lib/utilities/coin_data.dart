import 'package:bitcoin_ticker/services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// Get apikey from https://www.coinapi.io/
const apiKey = 'ENTER-API-KEY-HERE';

const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<dynamic> getCoinExchangeRate(String crypto, String currency) async {
    String url = "$baseUrl/$crypto/$currency?apikey=$apiKey";
    NetworkHelper networkHelper = NetworkHelper(url);
    var cryptoCurrencyData = await networkHelper.getData();
    return cryptoCurrencyData;
  }
}
