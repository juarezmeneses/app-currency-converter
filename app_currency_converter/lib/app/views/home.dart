import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 56,
                          child: DropdownButton(
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
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Background color
                ),
                child: Text('Convert'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
