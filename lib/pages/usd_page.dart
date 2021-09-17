import 'package:flutter/material.dart';
import 'package:currency_rates/components/settings_drawer.dart';
import 'package:currency_rates/colors.dart' as custom_colors;

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
        iconTheme: const IconThemeData(color: custom_colors.secondaryGray),
      ),
      body: UsdPageBody(),
      endDrawer: const SettingsDrawer(),
    );
  }
}

class UsdPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Move to HomePage'),
          ),
        ],
      ),
    );
  }
}