import 'package:flutter/material.dart';
import 'package:junior/faq_page/body.dart';
import 'package:junior/theme.dart';

// ignore: always_use_package_imports
import 'novel_data.dart';

// ignore: use_key_in_widget_constructors
class NovelLink extends StatelessWidget {
  final String link = NovelData.novel.novelLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Link to Novel',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 16,
                color: textColor.withOpacity(0.7),
              ),
              splashRadius: 12,
              onPressed: () => showLinkInfo(context),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: TextEditingController()..text = link,
            style: TextStyle(color: textColor, fontSize: 16),
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
            ),
            onChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.novelLink = text;
            },
          ),
        )
      ],
    );
  }
}

String linkInfo = """
Dynamic Links are also supported. The explanation for those won't fit here so I'd advise you to
""";

showLinkInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Column(
        children: [
          Text(
            linkInfo,
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 10),
          const FindMoreButton(),
        ],
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}

class FindMoreButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FindMoreButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Material(
        color: tileColor,
        borderRadius: BorderRadius.circular(6.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FAQScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Text(
              'LEARN MORE',
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
