import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class DatePickerModal extends StatelessWidget {
  final Function(DateTime) onDateTimeChanged;
  const DatePickerModal({super.key, required this.onDateTimeChanged});

  static void show(
      {required BuildContext context,
      required Function(DateTime) onDateTimeChanged}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return DatePickerModal(
            onDateTimeChanged: onDateTimeChanged,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModalLabel(label: tr("selectDate")),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: onDateTimeChanged,
            ),
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
