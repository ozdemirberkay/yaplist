import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final List<Widget> actions;
  const Layout({
    super.key,
    required this.body,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: actions,
      ),
      body: body,
    );
  }
}
