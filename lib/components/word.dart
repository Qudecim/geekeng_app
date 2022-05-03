import 'package:flutter/material.dart';
import 'package:geekeng/style.dart';


class Word extends StatelessWidget {
  final Map word;
  const Word({ required this.word });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Expanded(
          flex: 10,
          child: Container (
            alignment: Alignment.centerRight,
            child: Text(
              word['english'],
              style: const TextStyle(
                color: MainStyle.mainText,
                fontSize: 20,
              ),
            ),
          )
        ),

        Expanded(
          flex: 1,
          child: Container (
            alignment: Alignment.center,
            child: const Text(
              '|',
              style: TextStyle(
                color: MainStyle.mainText,
                fontSize: 20,
              ),
            ),
          )
        ),

        Expanded(
          flex: 10,
          child: Container (
            alignment: Alignment.centerLeft,
            child: Text(
              word['russian'],
              style: const TextStyle(
                color: MainStyle.mainText,
                fontSize: 20,
              ),
            ),
          )
        )
      ],
    )
  );
}