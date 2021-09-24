import 'package:flutter/material.dart';
import 'package:currency_rates/providers/refinancing_rate_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:provider/provider.dart';
import 'package:currency_rates/common/format_date.dart';
import 'general_list_tile.dart';

class RefinancingRateList extends StatefulWidget{
  @override
  State<RefinancingRateList> createState() => _RefinancingRateListState();
}

class _RefinancingRateListState extends State<RefinancingRateList> {
  @override
  Widget build(BuildContext context){
    RefinancingRateProvider _refinancingRateState = Provider.of<RefinancingRateProvider>(context);
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        GeneralListTile(
          titleText: FormatDate(_refinancingRateState.getCurrentRefRate.Date),
          subtitleText: 'Date of last changes',
          leadingIcon: '%',
          // TODO: inject SVG icon -> 'assets/percent.svg',
          leadingIconBgColor: CustomColors.lightPurple,
          leadingIconColor: CustomColors.deepPurple,
          trailingValue: '${_refinancingRateState.getCurrentRefRate.Value}%',
          trailingSubText: '-',
        ),
      ],
    );
  }
}
