import 'package:Junior/details_page/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class NovelTile extends StatelessWidget {
  final Novel novel;

  NovelTile({this.novel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: tileColor),
        child: ExpansionTile(
          title: Text(
            novel.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(novel.getChapterProgress(),
              style: TextStyle(color: Colors.white, fontSize: 16)),
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingAndLink(
                    link: novel.novelLink,
                    rating: novel.novelRating,
                  ),
                  SizedBox(height: 15),
                  NovelNotes(novel.notes),
                  SizedBox(height: 10),
                  DetailsButton(novel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndLink extends StatelessWidget {
  final String link;
  final int rating;

  RatingAndLink({this.link, this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (link != '') {
      children.add(
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding:
                EdgeInsets.only(top: 5, bottom: 5, right: 10),
                child: Row(
                  children: [
                    Text('Link to Current Chapter',
                        style: TextStyle(
                            color: linkColor, fontSize: 16)),
                    SizedBox(width: 5),
                    Icon(
                      Icons.article_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          )
      );
    }

    if (rating != 0) {
      children.add(
          IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 18,
            ),
            child: StarDisplay(value: rating),
          )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}

class StarDisplayWidget extends StatelessWidget {
  // courtesy of https://gist.github.com/sma/1f22ef926ef878f10915aa9e00bc9eaa
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;

  const StarDisplayWidget({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
  })
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}

class StarDisplay extends StarDisplayWidget {
  const StarDisplay({Key key, int value = 0})
      : super(
    key: key,
    value: value,
    filledStar: const Icon(Icons.star),
    unfilledStar: const Icon(Icons.star_border),
  );
}

class NovelNotes extends StatelessWidget {
  final String notes;

  NovelNotes(this.notes);

  @override
  Widget build(BuildContext context) {
    if (notes == '') {
      return Container();
    } else {
      return Text(notes,
        style: TextStyle(color: textColor, fontSize: 16),
        textAlign: TextAlign.left,
      );
    }
  }
}

class DetailsButton extends StatelessWidget {
  final Novel novel;

  DetailsButton(this.novel);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(64, 75, 96, 0.95),
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(novel: novel)),
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 1,
            top: 5,
            right: 1,
            bottom: 5,
          ),
          width: double.infinity,
          child: Text('Update Details',
              style: TextStyle(
                  fontSize: 16,
                  color: linkColor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
