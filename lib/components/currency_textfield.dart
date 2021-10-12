import 'package:currency_rates/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyTextfield extends StatefulWidget {
  final String curAbbreviation;
  // final VoidCallback clearValue;
  final Function(String) onChangeInputValue;

  const CurrencyTextfield({
    Key? key,
    required this.curAbbreviation,
    required this.onChangeInputValue,
    // required this.clearValue,
  }) : super(key: key);

  @override
  State<CurrencyTextfield> createState() => _CurrencyTextfieldState();
}

class _CurrencyTextfieldState extends State<CurrencyTextfield> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _inputController,
        cursorColor: CustomColors.deepOrange,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(12),
        ],
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: 'enter amount',
          hintStyle: const TextStyle(
              fontSize: 20.0,
              color: CustomColors.paleGray,
              fontWeight: FontWeight.normal),
          labelText: 'Amount of ${widget.curAbbreviation}',
          labelStyle: const TextStyle(
              fontSize: 20.0,
              color: CustomColors.primaryGray,
              fontWeight: FontWeight.normal),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.paleGray),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.primaryGray),
          ),
        ),
        onChanged: (value) => widget.onChangeInputValue(value),
      ),
    ]);
  }
}
