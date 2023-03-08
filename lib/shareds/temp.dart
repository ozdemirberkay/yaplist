import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yaplist/models/task.dart';

List<Task> tempTasks = [
  Task(id: 1, title: "Deneme görevi", isCompleted: true),
  Task(id: 2, title: "Postman sil", isCompleted: false),
  Task(id: 3, title: "Deneme görevi 12312xws", isCompleted: false),
  Task(id: 4, title: "Notion doldur", isCompleted: false),
];

class denemeslide extends StatelessWidget {
  const denemeslide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
          Slidable(
            key: ValueKey(1),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(title: Text('Slide me')),
          ),
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {}
