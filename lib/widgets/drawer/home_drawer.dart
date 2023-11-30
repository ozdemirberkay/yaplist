import 'package:flutter/material.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/widgets/drawer/widget/language_changer_button.dart';
import 'package:yaplist/widgets/drawer/widget/theme_changer_button.dart';
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ThemeChangerButton(),
                const SizedBox(height: 20),
                const LanguageChangerButton(),
                const SizedBox(height: 20),
                BannerAdManager.instance.loadAndShowAd(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
