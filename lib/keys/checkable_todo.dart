import 'package:flutter/material.dart';
import 'package:todo_demo/keys/todo_item.dart';

class CheckableTodoItem extends StatefulWidget{
  const CheckableTodoItem(this.text,this.priority,{super.key});
  final String text;
  final Prioritys priority;
  @override
  State<StatefulWidget> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem>{
  var _done=false;
  void _setDone(bool? isChecked){
    setState(() {
      _done=isChecked??false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;
    if (widget.priority == Prioritys.urgent) {
      icon = Icons.notifications_active;
    }
    if (widget.priority == Prioritys.normal) {
      icon = Icons.list;
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Checkbox(value: _done, onChanged: _setDone,),
          Icon(icon),
          const SizedBox(width: 12),
          Text(widget.text),
        ],
      ),
    );
  }
}