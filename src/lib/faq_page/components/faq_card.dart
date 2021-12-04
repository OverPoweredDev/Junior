import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions(
      {Key key, @required this.title, @required this.data})
      : super(key: key);
  final String title;
  final String data;

  @override
  State<FrequentlyAskedQuestions> createState() => _FrequentlyAskedQuestions();
}

class _FrequentlyAskedQuestions extends State<FrequentlyAskedQuestions> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: TextStyle(
          color: linkColor,
        ),
      ),
      // leading: const Icon(Icons.add),
      // trailing: const Icon(Icons.add),
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.data,
              style: TextStyle(
                color: linkColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
