import 'package:flutter/material.dart';
import 'package:yaplist/shareds/temp.dart';
import 'package:yaplist/widgets/card/task_card.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "asdasd",
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: tempTasks.length,
            itemBuilder: (context, index) => TaskCard(
              task: tempTasks[index],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => denemeslide(),
            ));
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
