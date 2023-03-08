import 'package:flutter/material.dart';
import 'package:yaplist/models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Widget buildSwipeActionLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.green,
      child: const Icon(
        Icons.done,
      ),
    );
  }

  Widget buildSwipeActionRight() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: const Icon(
        Icons.delete_forever,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: const Color(0xffE2E8F0),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: const Key("asd"),
        secondaryBackground: buildSwipeActionRight(),
        background: buildSwipeActionLeft(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  setState(() {
                    widget.task.isCompleted = value!;
                  });
                },
                value: widget.task.isCompleted,
              ),
              Column(
                children: [
                  Text(
                    widget.task.title,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
