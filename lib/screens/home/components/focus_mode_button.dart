import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';

class FocusModeButton extends StatelessWidget {
  const FocusModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.pomodoro);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withAlpha(30)
            ]),
            borderRadius: Constants.borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Icon(
                  Icons.stars,
                  size: 36,
                  color: AppColors.reversePrimaryColor(
                    Theme.of(context),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr('focusMode'),
                        style: TextStyle(
                          color:
                              AppColors.reversePrimaryColor(Theme.of(context)),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        tr('focusDescription'),
                        style: TextStyle(
                          color:
                              AppColors.reversePrimaryColor(Theme.of(context)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, size: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
