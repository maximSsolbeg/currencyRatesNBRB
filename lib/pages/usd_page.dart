import 'package:currency_rates/models/currency_dynamics_mdl.dart';
import 'package:currency_rates/providers/usd_dynamics_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart' ;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:currency_rates/components/custom_graph.dart';

class UsdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USD details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFFCCD1E0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: CustomColors.secondaryGray),
      ),
      body: UsdPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class UsdPageBody extends StatefulWidget {
  @override
  State<UsdPageBody> createState() => _UsdPageBodyState();
}

class _UsdPageBodyState extends State<UsdPageBody> {
  String reformatDate(date) {
    DateTime parseDt = DateTime.parse(date);
    var newFormat = DateFormat('dd.MM.yy');
    String updatedDt = newFormat.format(parseDt);

    return updatedDt;
  }

  @override
  Widget build(BuildContext context) {
    UsdDynamicsProvider _usdDynamicsState = Provider.of<UsdDynamicsProvider>(context);
    return Center(
      child: Column(
        children: [
          CustomGraph(
              graphData: _usdDynamicsState.getUsdDynamicsList as List<CurrencyDynamics>,
              titleText: 'Dynamics of BYN against USD',
              graphName: 'USD dynamics',
              lineColor: CustomColors.deepOrange,
              primaryXAxisIsVisible: true,
              primaryYAxisIsVisible: true,
          ),
        ],
      ),
    );
  }
}
