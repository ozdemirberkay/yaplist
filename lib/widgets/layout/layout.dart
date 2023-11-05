import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? titleWidget;
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  final Widget? drawer;
  const Layout({
    super.key,
    required this.body,
    this.actions = const [],
    required this.title,
    this.leading,
    this.titleWidget,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleWidget ?? Text(title),
        centerTitle: true,
        actions: actions,
        leading: leading,
      ),
      drawer: drawer,
      body: body,
    );
  }
}
