import 'package:Junior/details_page/components/novel_data.dart';
import 'package:Junior/homepage/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EditButton(
          innerText: 'UPDATE DETAILS',
          buttonColor: const Color.fromRGBO(50, 155, 196, 1.0),
          textColor: Colors.white,
          onPressed: () {
            if (NovelData.isChanged) {
              NovelData.novel.lastEdited = DateTime.now();
              saveNovelList(novelList);
            }

            final snackBar = SnackBar(
              backgroundColor: backgroundColor,
              duration: const Duration(seconds: 1),
              content: Text(
                'Updated ' + NovelData.novel.title,
                style: TextStyle(
                  color: linkColor,
                ),
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        const SizedBox(height: 10),
        EditButton(
          innerText: 'DELETE NOVEL',
          buttonColor: const Color.fromRGBO(255, 89, 99, 1.0),
          textColor: Colors.white,
          onPressed: () {
            novelList.remove(NovelData.novel);
            saveNovelList(novelList);

            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        const SizedBox(height: 10),
        EditButton(
          innerText: 'GO BACK',
          buttonColor: const Color.fromRGBO(142, 142, 142, 1.0),
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  final String innerText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  const EditButton({
    @required this.innerText,
    @required this.buttonColor,
    @required this.textColor,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(6),
          width: double.infinity,
          child: Text(innerText,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
