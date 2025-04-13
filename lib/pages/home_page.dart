import 'package:flutter/material.dart';

import 'package:todo_hive_app/components/components.dart';
import 'package:todo_hive_app/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  final todoList = <Todo>[
    Todo('To Do 1', false),
    Todo('To Do 2', true),
  ];

  void toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void saveTask() {
    setState(() {
      todoList.add(Todo(controller.text.trim(), false));
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void cancelTask() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (_) => BoxDialog(
        controller: controller,
        saveTask: saveTask,
        cancelTask: cancelTask,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text('To Do'),
      ),

      // floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      // body
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: TodoTile(
            todo: todoList[index],
            onChanged: toggleTodo,
            onDelete: (context) => deleteTask(index),
          ),
        ),
      ),
    );
  }
}
