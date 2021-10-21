import 'package:currency_rates/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text('Settings',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
          ListTile(
            title: const Text('About the App'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Contact us: web375@gmail.com',
                style: TextStyle(
                    color: CustomColors.primaryGray,
                    fontWeight: FontWeight.normal)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Version: 1.0.0',
                style: TextStyle(
                    color: CustomColors.primaryGray,
                    fontWeight: FontWeight.normal)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
