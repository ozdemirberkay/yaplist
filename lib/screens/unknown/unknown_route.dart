import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/icon/home_icon.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class UnknwonRoute extends StatelessWidget {
  const UnknwonRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      titleWidget: const HomeIcon(),
      title: tr("pageNotFound"),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr("pageNotFound"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              width: double.infinity,
              child: MasterButton(
                label: tr("homePage"),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.initialScreen, (route) => false);
                },
                icon: Icons.home,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
