import 'package:Junior/details_page/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class AddNovelButton extends StatelessWidget {

  // ignore: use_key_in_widget_constructors
  const AddNovelButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Material(
        color: tileColor,
        borderRadius: BorderRadius.circular(6.0),
        child: InkWell(
          onTap: () {
            Novel newNovel = Novel(title: '', lastEdited: DateTime.now());
            novelList.add(newNovel);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  novel: newNovel,
                  titleFocus: true,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Text(
              'ADD NEW NOVEL',
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
