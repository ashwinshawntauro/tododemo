import 'package:flutter/material.dart';
import 'package:todo_demo/keys/checkable_todo.dart';
import 'package:todo_demo/keys/todo_item.dart';

// enum Priority { urgent, normal, low }
class Todo {
  const Todo(this.text, this.priority);
  final String text;
  final Prioritys priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});
  @override
  State<StatefulWidget> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'Learn Flutter',
      Prioritys.normal,
    ),
    const Todo(
      'New Langauge',
      Prioritys.low,
    ),
    const Todo(
      'DSA',
      Prioritys.urgent,
    ),
  ];

  List<Todo> get _orderedTodos{
    final sortedTodo = List.of(_todos);
    sortedTodo.sort((a,b){
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodo;
  }
  void _changeOrder(){
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child:
              TextButton.icon(onPressed: _changeOrder, icon: _order == 'asc' ? const Icon(Icons.arrow_downward): const Icon(Icons.arrow_upward), label: Text('Sort ${_order == 'asc'? 'Descending' : 'Ascending' }')),
        ),
        Expanded(child: Column(
          children: [
            for(final todo in _orderedTodos)
            CheckableTodoItem(todo.text, todo.priority, key: ObjectKey(todo),),
          ],
        ))
      ],
    );
  }
}
