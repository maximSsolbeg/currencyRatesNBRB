import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the App',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
      body: AboutAppPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class AboutAppPageBody extends StatelessWidget {
  const AboutAppPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text('This application built on public API of National Bank '
          'of Republic of Belarus posted on the official website of '
          'the bank: https://www.nbrb.by',
      style: TextStyle(
        height: 1.5,
        fontSize: 18
      )),
    );
  }
}
