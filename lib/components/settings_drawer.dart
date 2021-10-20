import 'package:currency_rates/colors.dart';
import 'package:currency_rates/pages/about_app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  final _url = 'https://www.nbrb.by/engl/today/about/general';

  void _launchAboutUsNBRBpage() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    void goToSeeAllPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AboutAppPage(),
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.paleGray,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'NBRB Rates',
                style: TextStyle(
                  fontSize: 30,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  color: CustomColors.primaryGray,
                ),
              ),
            ]),
          ),
          ListTile(
            title: const Text('About the App'),
            onTap: goToSeeAllPage,
          ),
          ListTile(
            title: const Text('About the National Bank'),
            onTap: _launchAboutUsNBRBpage,
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
