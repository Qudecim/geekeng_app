import 'package:flutter/material.dart';
import 'package:geekeng/style.dart';
import 'package:geekeng/backend.dart';


class AddWord extends StatefulWidget {
  final Map group;
  const AddWord({Key? key, required this.group}) : super(key: key);

  @override
  _AddWord createState() => _AddWord();
}

class _AddWord extends State<AddWord> {
  
  final TextEditingController _engController = TextEditingController();
  final TextEditingController _rusController = TextEditingController();

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Add words group'),
    content: Column(
      children: [
        Text('English:'),
        TextField(
          controller: _engController,
        ),
        Text('Russian:'),
        TextField(
          controller: _rusController,
        )
      ],
    ),
    actions: [
      TextButton(
        child: const Text(
          'Cancel',
          style: TextStyle(color: MainStyle.main),
        ),
        onPressed: () {
          Navigator.pop(context, '');
        },
      ),
      TextButton(
        child: const Text(
          'Accept',
          style: TextStyle(color: MainStyle.main),
        ),
        onPressed: () {
          Backend.addWord(widget.group['id'], _engController.text, _rusController.text);
          Navigator.popAndPushNamed(context, '/group', arguments: {'group':widget.group});
        },
      ),
    ],
  );
}