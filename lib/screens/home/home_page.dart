import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/builder/category_builder.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_icon_button.dart';
import 'package:yaplist/widgets/drawer/home_drawer.dart';
import 'package:yaplist/widgets/icon/home_icon.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Yaplist",
      titleWidget: const HomeIcon(),
      drawer: const HomeDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("categories")),
                MasterIconButton(
                  icon: Icons.add,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.categoryManager);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: const CategoryBuilder(),
          ),
        ],
      ),
    );
  }
}
