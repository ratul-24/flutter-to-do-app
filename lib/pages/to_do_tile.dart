import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final bool taskStatus;
  final String taskName;
  final Function(bool?)? onChanged;
  final VoidCallback? onDelete;

  const ToDoTile({super.key,required this.taskName,required this.taskStatus, required this.onChanged, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.cyan[200],
              borderRadius: BorderRadius.circular(10),
            ),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(value: taskStatus, onChanged: onChanged),
                Text(taskName),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: ElevatedButton(
                  onPressed: onDelete, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Icon(Icons.delete)
                  ),
                  ),
              ],
            ),
          ),
      );
  }
}