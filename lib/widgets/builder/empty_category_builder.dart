import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';

class EmptyCategoryBuilder extends StatelessWidget {
  const EmptyCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tr("categoryNotFound"), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          MasterButton(
              label: tr("addCategory"),
              onPressed: () {
                Navigator.pushNamed(context, Routes.categoryManager);
              },
              icon: Icons.add),
        ],
      ),
    );
  }
}
