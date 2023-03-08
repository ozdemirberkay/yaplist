import 'package:flutter/material.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/widgets/card/task_card.dart';
import 'package:yaplist/widgets/layout/Layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task(id: 1, title: "Deneme görevi", isCompleted: false),
    Task(id: 2, title: "Postman sil", isCompleted: false),
    Task(id: 3, title: "Deneme görevi 12312xws", isCompleted: false),
    Task(id: 4, title: "Notion doldur", isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(
        children: [
          TaskCard(
            task: tasks[0],
          ),
          TaskCard(
            task: tasks[1],
          ),
          TaskCard(
            task: tasks[2],
          ),
          TaskCard(
            task: tasks[3],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
