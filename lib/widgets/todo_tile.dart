import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  void Function(BuildContext)? deleteFunction;

  ToDoTile({
    required this.taskName,
    required this.taskCompleted,
    required this.onchanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.black,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                    value: taskCompleted,
                    onChanged: onchanged,
                    activeColor: Colors.black),

                //taskname
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
