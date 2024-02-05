import 'package:currency_converter/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  late double result;
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    result = 0;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //appBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          "Currency Converter ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NGN ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            //padding...
            Padding(
              padding: const EdgeInsets.all(10.0),
              //Textfield.....
              child: TextField(
                controller: _textEditingController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                ],
                keyboardAppearance: Brightness.dark,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please Enter The Amount in USD !!',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  focusedBorder: customOutlineInputBorder(),
                  enabledBorder: customOutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
            ),
            //TextButton...
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //setState triggers a rebuild...
                  setState(
                    () {
                      String inputText = _textEditingController.text.trim();
                      if (inputText.isNotEmpty) {
                        //try Block.....
                        try {
                          setState(
                            () {
                              result = double.parse(inputText) * 1500;
                              _textEditingController.clear();
                            },
                          );
                        } catch (e) {
                          if (kDebugMode) {
                            print("Error: $e");
                          }
                          // Show an error message to the user...
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Invalid input. Please enter a valid number.",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                  );
                },
                style: customTextButtonStyleFrom(),
                child: const Text("Convert to NGN"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = 0;
                  });
                },
                style: customTextButtonStyleFrom(),
                child: const Text("Reset"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
