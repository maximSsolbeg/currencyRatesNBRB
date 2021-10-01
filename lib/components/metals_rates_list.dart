import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/providers/metals_rates_provider.dart';
import 'package:currency_rates/colors.dart';
import 'package:provider/provider.dart';
import 'general_list_tile.dart';

class MetalsRatesList extends StatefulWidget{
  @override
  State<MetalsRatesList> createState() => _MetalsRatesListState();
}

class _MetalsRatesListState extends State<MetalsRatesList> {
  @override
  Widget build(BuildContext context){
    MetalsRatesProvider _metalsRatesState = Provider.of<MetalsRatesProvider>(context);
    return ListView(
      children: [
        GeneralListTile(
          titleText: 'Gold',
          subtitleText: '+0.05%**',
          leadingIcon: 'Au',
          leadingIconBgColor: CustomColors.saturatedGold,
          leadingIconColor: CustomColors.paleGold,
          trailingValue: '${_metalsRatesState.getGoldData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
        ),
        GeneralListTile(
          titleText: 'Silver',
          subtitleText: '+0.01%**',
          leadingIcon: 'Ag',
          // leadingIconBgColor: CustomColors.saturatedGold,
          // leadingIconColor: CustomColors.paleGold,
          trailingValue: '${_metalsRatesState.getSilverData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
        ),
        GeneralListTile(
          titleText: 'Platinum',
          subtitleText: '-0.02%**',
          leadingIcon: 'Pt',
          leadingIconBgColor: CustomColors.lightPurple,
          leadingIconColor: CustomColors.deepPurple,
          trailingValue: '${_metalsRatesState.getPlatinumData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
        ),
        GeneralListTile(
          titleText: 'Palladium',
          subtitleText: '+0.03%**',
          leadingIcon: 'Pd',
          leadingIconBgColor: CustomColors.lightBlue,
          leadingIconColor: CustomColors.deepBlue,
          trailingValue: '${_metalsRatesState.getPalladiumData.Value}',
          trailingSubText: 'BYN / 1g',
          symbolsInsteadOfIcon: true,
        ),
      ]
    );
  }
}
