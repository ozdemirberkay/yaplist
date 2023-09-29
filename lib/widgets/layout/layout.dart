import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  const Layout({
    super.key,
    required this.body,
    this.actions = const [],
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
        leading: leading,
      ),
      body: body,
    );
  }
}
