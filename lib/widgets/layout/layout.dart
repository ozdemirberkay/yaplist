import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget> actions;
  const Layout({
    super.key,
    required this.body,
    this.actions = const [],
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
