import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: textColor,
        ),
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: ListView(
        children: const [
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
          FrequentlyAskedQuestions(
              title: 'What is Flutter?',
              data:
                  'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
        ],
      ),
    );
  }
}

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
