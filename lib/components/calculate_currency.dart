import 'package:currency_rates/components/currency_textfield.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';

class CalculateCurrency extends StatefulWidget {
  final String firstCurrency;
  final String secondCurrency;
  final Color? bgrColor;
  final Color? textColor;

  const CalculateCurrency(
      {Key? key,
        required this.firstCurrency,
        required this.secondCurrency,
        this.bgrColor = CustomColors.primaryGray,
        this.textColor = CustomColors.paleGray,
      })
      : super(key: key);

  State<CalculateCurrency> createState() => _CalculateCurrencyState();
}

class _CalculateCurrencyState extends State<CalculateCurrency> {
  bool _isButtonDisabled = true;
  double firstCurrencyValue = 0.0;
  double secondCurrencyValue = 0.0;

  @override
  void changeButtonCondition() {
    setState(() {
      _isButtonDisabled = !_isButtonDisabled;
    });
  }

  void changeFirstCurValue(val) {
    firstCurrencyValue = double.parse(val);
    // final double formattedVal;
    // var initialVal = double.parse(val);
    // if(secondCurrencyValue != 0.0){
    //   secondCurrencyValue = 0.0;
    // }
    // firstCurrencyValue = ;
  }

  void changeSecondCurValue(val) {
    secondCurrencyValue = double.parse(val);
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurRatesState = Provider.of<CurRatesProvider>(context);

    double calculateExchangeValue() {
      if(firstCurrencyValue != 0) {
        return firstCurrencyValue * _allCurRatesState.getUsdData.Cur_OfficialRate;
      } else if(secondCurrencyValue != 0) {
        return secondCurrencyValue / _allCurRatesState.getUsdData.Cur_OfficialRate;
      } else {
        return 0.0;
      }
    }

    return Column(children: [
      CurrencyTextfield(
          curAbbreviation: widget.firstCurrency,
          onChangeInputValue: (val) => changeFirstCurValue(val)
    ),
      CurrencyTextfield(
          curAbbreviation: widget.secondCurrency,
          onChangeInputValue: (val) => changeSecondCurValue(val)
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: widget.bgrColor,
            onPrimary: CustomColors.paleGray,
            shadowColor: CustomColors.primaryGray,
            elevation: 5,
          ),
          onPressed: () {},
          child: Text('Calculate',
              style: TextStyle(color: widget.textColor)),
        ),
      )
    ]);
  }
}
