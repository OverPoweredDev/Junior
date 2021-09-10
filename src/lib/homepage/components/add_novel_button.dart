import 'package:Junior/details_page/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class AddNovelButton extends StatelessWidget {

  AddNovelButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Material(
        color: Color.fromRGBO(255, 255, 255, 0.15),
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
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Text(
              'ADD NEW NOVEL',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
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
