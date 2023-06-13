import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class DatePickerModal extends StatelessWidget {
  final Function(DateTime) onDateTimeChanged;
  final DateTime? initialDate;
  const DatePickerModal(
      {super.key, required this.onDateTimeChanged, this.initialDate});

  static void show(
      {required BuildContext context,
      required Function(DateTime) onDateTimeChanged,
      DateTime? initialDate}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return DatePickerModal(
            onDateTimeChanged: onDateTimeChanged,
            initialDate: initialDate,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectDate = initialDate ?? DateTime.now();

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModalLabel(label: tr("selectDate")),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: CupertinoDatePicker(
              initialDateTime: selectDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                selectDate = value;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: MasterButton(
                label: tr("select"),
                onPressed: () {
                  onDateTimeChanged(selectDate);
                  Navigator.of(context).pop();
                },
                icon: Icons.check),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
