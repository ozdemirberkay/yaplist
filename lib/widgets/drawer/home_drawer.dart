import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/icon/home_icon.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.bounceIn,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HomeIcon(size: 65),
                const SizedBox(height: 5),
                Text(
                  'Yaplist',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(tr('settings')),
            onTap: () {
              InterstitialAdManager.instance.loadAndShowAd();
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(Routes.settings);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: BannerAdManager.instance.loadAndShowAd(),
          ),
        ],
      ),
    );
  }
}
