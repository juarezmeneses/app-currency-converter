import 'package:app_currency_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency = CurrencyModel.getCurrencies()[0];
  CurrencyModel fromCurrency = CurrencyModel.getCurrencies()[1];

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'BTC') {
      returnValue = value * toCurrency.btc;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
