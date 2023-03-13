import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/shareds/bloc/todo_bloc.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: Layout(
        title: tr("addTask"),
        body: Column(
          children: const [
            InputField(label: "Deneme123"),
            SizedBox(height: 20),
            InputField(label: "Deneme123"),
          ],
        ),
      ),
    );
  }
}
