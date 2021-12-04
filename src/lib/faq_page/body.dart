import 'package:flutter/material.dart';
import 'package:junior/faq_page/components/faq_card.dart';
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
        elevation: 0,
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

