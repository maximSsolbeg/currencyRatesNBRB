import 'package:currency_rates/components/currency_textfield.dart';
import 'package:currency_rates/providers/cur_rates_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';

class CalculateCurrency extends StatefulWidget {
  final String firstCurrency; //usd, eur, rub
  final String secondCurrency;
  final Color? bgrColor;
  final Color? textColor;

  const CalculateCurrency({
    Key? key,
    required this.firstCurrency,
    required this.secondCurrency,
    this.bgrColor = CustomColors.primaryGray,
    this.textColor = CustomColors.paleGray,
  }) : super(key: key);

  State<CalculateCurrency> createState() => _CalculateCurrencyState();
}

class _CalculateCurrencyState extends State<CalculateCurrency> {
  double firstCurrencyValue = 0.0;
  double secondCurrencyValue = 0.0;

  void changeFirstCurValue(val) {
    if (secondCurrencyValue != 0.0) {
      setState(() {
        secondCurrencyValue = 0.0;
      });
    }
    firstCurrencyValue = val > 0.0 ? val : val.abs();
  }

  void changeSecondCurValue(val) {
    if (firstCurrencyValue != 0.0) {
      setState(() {
        firstCurrencyValue = 0.0;
      });
    }
    secondCurrencyValue = val > 0.0 ? val : val.abs();
  }

  void calculateExchangeValue(CurRatesProvider allCurRatesState) {
    late double currentCurrencyRate;

    if (widget.firstCurrency == 'usd') {
      currentCurrencyRate = allCurRatesState.getUsdData.Cur_OfficialRate;
    } else if (widget.firstCurrency == 'eur') {
      currentCurrencyRate = allCurRatesState.getEurData.Cur_OfficialRate;
    } else if (widget.firstCurrency == 'rub') {
      currentCurrencyRate = allCurRatesState.getRubData.Cur_OfficialRate / 100; //cur scale is 1:100
    } else {
      currentCurrencyRate = 1.0;
    }

    if (firstCurrencyValue != 0.0) {
      setState(() {
        secondCurrencyValue =
            firstCurrencyValue * currentCurrencyRate;
      });
    } else if (secondCurrencyValue != 0.0) {
      setState(() {
        firstCurrencyValue =
            secondCurrencyValue / currentCurrencyRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CurRatesProvider _allCurRatesState = Provider.of<CurRatesProvider>(context);

    return Column(children: [
      CurrencyTextField(
        curAbbreviation: widget.firstCurrency,
        onChangeInputValue: (val) => changeFirstCurValue(val),
        assignedValue: firstCurrencyValue,
      ),
      CurrencyTextField(
        curAbbreviation: widget.secondCurrency,
        onChangeInputValue: (val) => changeSecondCurValue(val),
        assignedValue: secondCurrencyValue,
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
          onPressed: () => calculateExchangeValue(_allCurRatesState),
          child: Text('Calculate', style: TextStyle(color: widget.textColor)),
        ),
      )
    ]);
  }
}
