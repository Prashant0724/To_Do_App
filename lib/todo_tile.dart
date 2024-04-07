import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required  this.deleteFunction
      });

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Slidable(
       endActionPane: ActionPane(
          motion: StretchMotion(),
         children: [
           SlidableAction(onPressed: widget.deleteFunction,
           icon: Icons.delete,
             backgroundColor: Colors.red.shade300,
             borderRadius: BorderRadius.circular(10),
           )
         ],
       ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                  value: widget.taskCompleted, onChanged: widget.onChanged?.call),
              Text(
                widget.taskName,
                style: TextStyle(
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
