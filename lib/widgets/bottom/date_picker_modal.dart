import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/widgets/button/master_button.dart';

class DatePickerModal extends StatelessWidget {
  final Function(DateTime) onDateTimeChanged;
  const DatePickerModal({super.key, required this.onDateTimeChanged});

  static void show(
      {required BuildContext context,
      required Function(DateTime) onDateTimeChanged}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: Constants.borderRadius,
        ),
        context: context,
        builder: (context) {
          return DatePickerModal(
            onDateTimeChanged: onDateTimeChanged,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: onDateTimeChanged),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: MasterButton(
                label: tr("select"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.check),
          )
        ],
      ),
    );
  }
}
