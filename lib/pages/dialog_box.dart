import 'package:flutter/material.dart';
import 'package:to_do_app/pages/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController myController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.myController, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[100],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Save", onPressed: onSave),
                const SizedBox(width: 5,),
                Button(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}