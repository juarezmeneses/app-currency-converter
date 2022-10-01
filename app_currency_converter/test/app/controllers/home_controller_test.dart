import 'dart:convert';

import 'package:app_currency_converter/app/controllers/home_controller.dart';
import 'package:app_currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('Deve converter de real para dolar com vírgula', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de real para dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de dolar para real', () {
    homeController.toCurrency = CurrencyModel.getCurrencies()[1];
    homeController.fromCurrency = CurrencyModel.getCurrencies()[0];

    toText.text = '1.0';
    homeController.convert();
    expect(fromText.text, '5.65');
  });
}
