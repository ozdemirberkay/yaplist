import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/shareds/constants/assets.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';

class EmptyCategoryBuilder extends StatelessWidget {
  const EmptyCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double size = min(MediaQuery.sizeOf(context).height,
            MediaQuery.sizeOf(context).width) /
        6;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.category,
            width: size,
          ),
          Text(tr("categoryNotFound"), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          MasterButton(
              label: tr("addCategory"),
              onPressed: () {
                InterstitialAdManager.instance.loadAndShowAd();
                Navigator.pushNamed(context, Routes.categoryManager);
              },
              icon: Icons.add),
        ],
      ),
    );
  }
}
