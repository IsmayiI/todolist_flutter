import 'package:flutter/material.dart';

import 'package:todo_hive_app/constants/constants.dart';
import 'components.dart';

class BoxDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback saveTask;
  final VoidCallback cancelTask;
  const BoxDialog({
    super.key,
    required this.controller,
    required this.saveTask,
    required this.cancelTask,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              hintText: 'To Do',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(
                text: 'Save',
                onPressed: saveTask,
              ),
              const SizedBox(width: 8),
              MyButton(
                text: 'Cancel',
                onPressed: cancelTask,
              ),
            ],
          )
        ],
      ),
    );
  }
}
