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
            child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                )
            ),
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
            title: const Text('Contact Us'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
