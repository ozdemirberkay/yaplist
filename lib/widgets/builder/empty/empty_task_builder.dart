import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yaplist/shareds/constants/assets.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';

class EmptyTaskBuilder extends StatelessWidget {
  const EmptyTaskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (MediaQuery.orientationOf(context) == Orientation.portrait)
            Lottie.asset(
              Assets.task,
              width: MediaQuery.sizeOf(context).width / 2,
            ),
          Text(tr("taskNotFound"), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          MasterButton(
              label: tr("addTask"),
              onPressed: () {
                Navigator.pushNamed(context, Routes.taskManager);
              },
              icon: Icons.add),
        ],
      ),
    );
  }
}
