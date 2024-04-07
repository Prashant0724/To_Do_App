import 'package:flutter/material.dart';
import 'package:to_do_koko/my_button.dart';

class DialogBox extends StatefulWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;

   DialogBox({
     super.key,
     required this.controller,
     required this.onCancel,
     required this.onsave
   });
  @override
  State<DialogBox> createState() => _DialogBoxState();
}
class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // for user input
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //   save button
                MyButton(text: "Save", onPressed: widget.onsave),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: "Cancle", onPressed: widget.onCancel),

                //   delete cancle button
              ],
            )
          ],
        ),
      ),
    );
  }
}
