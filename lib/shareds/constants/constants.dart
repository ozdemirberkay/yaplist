import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';

class Constants {
  static const double borderRadiusValue = 12.0;
  static final BorderRadius borderRadius =
      BorderRadius.circular(borderRadiusValue);

  static final bool useMaterial3 = true;

  static const String appName = 'Yaplist';

  static final List<CompletedDropdownModel> statusDropdownModelList = [
    CompletedDropdownModel(title: tr("all"), data: "all"),
    CompletedDropdownModel(title: tr("incomplete"), data: "incomplete"),
    CompletedDropdownModel(title: tr("completed"), data: "completed"),
  ];

  static final List<CompletedDropdownModel> priorityDropdownModelList = [
    CompletedDropdownModel(title: tr("high"), data: "high"),
    CompletedDropdownModel(title: tr("medium"), data: "medium"),
    CompletedDropdownModel(title: tr("low"), data: "low"),
  ];
}
