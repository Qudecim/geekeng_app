import 'package:flutter/material.dart';
import 'package:geekeng/style.dart';


class GroupButton extends StatelessWidget {
  final Map group;
  const GroupButton({ required this.group });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, '/group');
    },
    onLongPress: () {
      print("Long press");
    },
    child:Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: MainStyle.main,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container (
            child: Text(
              group['name'],
              style: TextStyle(
                fontSize: 28,
                color: Colors.white
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: const Text(
                  'Слов: 10',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                ),
                Container(
                  child: const Text(
                  'Занятий: 5',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                ),
              ],
            ),
          )
        ],
      )
    ),
  );
}