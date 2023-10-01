import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: 40,
      width: double.infinity,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("searchBarText"),
            ),
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
      ),
    );
  }
}
