import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrencyBox extends StatefulWidget {
  const CurrencyBox({Key? key}) : super(key: key);

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  String _dropdownValue = "Real";
  List<String> dropDownOptions = [
    "Real",
    "Dolar",
    "Euro",
    "BTC",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton(
                iconEnabledColor: Colors.amber,
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text('Real'),
                    value: "Real",
                  ),
                  DropdownMenuItem(
                    child: Text('Dolar'),
                    value: "Dolar",
                  ),
                  DropdownMenuItem(
                    child: Text('Euro'),
                    value: "Euro",
                  ),
                  DropdownMenuItem(
                    child: Text('BTC'),
                    value: "BTC",
                  ),
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
              ),
            )),
        SizedBox(width: 10),
        const Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  )),
            )),
      ],
    );
  }
}
