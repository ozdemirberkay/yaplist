import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/shareds/constants/assets.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';

class EmptyTaskBuilder extends StatelessWidget {
  const EmptyTaskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double size = min(MediaQuery.sizeOf(context).height,
            MediaQuery.sizeOf(context).width) /
        2;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.task,
            width: size,
          ),
          Text(tr("taskNotFound"), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          MasterButton(
              label: tr("addTask"),
              onPressed: () {
                InterstitialAdManager.instance.loadAndShowAd();
                Navigator.pushNamed(context, Routes.taskManager);
              },
              icon: Icons.add),
        ],
      ),
    );
  }
}
