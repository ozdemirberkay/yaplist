import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class ModalLabel extends StatelessWidget {
  final String label;
  const ModalLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          //TODO color fix
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: Constants.borderRadius,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
