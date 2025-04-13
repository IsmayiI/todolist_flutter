import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:todo_hive_app/models/models.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final void Function(Todo) onChanged;
  final void Function(BuildContext) onDelete;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: const Color(0xFFFE4A49),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Material(
        child: ListTile(
          // style
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          tileColor: Colors.yellow,

          // content
          // checkbox
          leading: Checkbox(
            activeColor: Colors.black,
            value: todo.isDone,
            onChanged: (_) => onChanged(todo),
          ),

          // text
          title: Text(
            todo.text,
            style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),

          // function
          onTap: () => onChanged(todo),
        ),
      ),
    );
  }
}
