import 'package:flutter/material.dart';
import 'package:junior/faq_page/components/faq_list.dart';
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
        children: FAQList,
      ),
    );
  }
}
