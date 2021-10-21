import 'package:currency_rates/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyTextField extends StatefulWidget {
  final String curAbbreviation;
  final Function(double) onChangeInputValue;
  final double? assignedValue;

  const CurrencyTextField({
    Key? key,
    required this.curAbbreviation,
    required this.onChangeInputValue,
    this.assignedValue,
  }) : super(key: key);

  @override
  State<CurrencyTextField> createState() => _CurrencyTextFieldState();
}

class _CurrencyTextFieldState extends State<CurrencyTextField> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _inputController.text = widget.assignedValue == 0.0
        ? ''
        : widget.assignedValue!
            .toStringAsFixed(2)
            .replaceFirst(RegExp(r'\.?0*$'), '');
    _inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _inputController.text.length));

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
          labelText: 'Amount of ${widget.curAbbreviation.toUpperCase()}',
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
        onChanged: (value) => widget
            .onChangeInputValue(double.parse(value == '' ? '0.0' : value)),
      ),
    ]);
  }
}
