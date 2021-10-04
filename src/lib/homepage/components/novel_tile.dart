// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:junior/details_page/body.dart';
import 'package:junior/model/novel.dart';
import 'package:junior/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NovelTile extends StatelessWidget {
  final Novel novel;

  // ignore: sort_constructors_first
  const NovelTile({this.novel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(color: tileColor),
        child: ExpansionTile(
          title: Text(
            novel.title,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(novel.getChapterProgress(),
              style: TextStyle(color: textColor, fontSize: 16)),
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingAndLink(
                    link: novel.novelLink,
                    rating: novel.novelRating,
                  ),
                  const SizedBox(height: 15),
                  NovelNotes(novel.notes),
                  const SizedBox(height: 10),
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

  // ignore: sort_constructors_first
  const RatingAndLink({this.link, this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (link != '') {
      children.add(Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
            child: Row(
              children: [
                Text('Link to Novel',
                    style: TextStyle(color: linkColor, fontSize: 16)),
                const SizedBox(width: 5),
                Icon(
                  Icons.launch,
                  color: linkColor,
                  size: 18,
                ),
              ],
            ),
          ),
          onTap: () {
            launch(link);
          },
        ),
      ));
    }

    if (rating != 0) {
      children.add(
        StarDisplay(value: rating),
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

  // ignore: sort_constructors_first
  const StarDisplayWidget({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
  })  : assert(value != null),
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
          filledStar: const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unfilledStar: const Icon(
            Icons.star_outlined,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        );
}

class NovelNotes extends StatelessWidget {
  final String notes;

  // ignore: sort_constructors_first
  const NovelNotes(this.notes);

  @override
  Widget build(BuildContext context) {
    if (notes == '') {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          notes,
          style: TextStyle(color: textColor, fontSize: 16),
          textAlign: TextAlign.left,
        ),
      );
    }
  }
}

class DetailsButton extends StatelessWidget {
  final Novel novel;

  // ignore: sort_constructors_first
  const DetailsButton(this.novel);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 20, 0.2),
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsPage(novel: novel)),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 1,
            top: 5,
            right: 1,
            bottom: 5,
          ),
          width: double.infinity,
          child: Text('Update Details',
              style: TextStyle(
                  fontSize: 16, color: linkColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
