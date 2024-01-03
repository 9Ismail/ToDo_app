import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final textController;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox(
      {required this.textController,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(26)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new task',
              ),
            ),

            //buttons-->save and cancle
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(buttonName: 'Save', onPressed: onsave),
                SizedBox(
                  width: 12,
                ),
                //cancel button
                MyButton(buttonName: 'cancel', onPressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
