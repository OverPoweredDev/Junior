import 'package:junior/faq_page/components/faq_card.dart';

const List<FAQCard> FAQList = [
  FAQCard(
    title: "What are dynamic links?",
    data: dynamicLinksAnswer,
  ),
  FAQCard(
    title: "How do Tags / Reading Lists even Work?",
    data: novelTagsAnswer,
  ),
];

const String dynamicLinksAnswer =
"""A lot of novel websites use a simple

name.com/novel/chapterNum

format. So you can simply replace the chapterNum part with <num> or <num-d> to pad with zero's and the app automatically updates the link from your chapter Count

Example:
https://boxnovel.com/novel/super-gene/chapter-<num>/

if your chapter progress is 3460, becomes

https://boxnovel.com/novel/super-gene/chapter-3460/

Similarly, <num-6> would turn into .../chapter-003460. Not useful in this case but some sites pad the links with 0's
""";

const String novelTagsAnswer =
"""Alright Tags are easy enough to understand, they're just the tags or genres like say 'CN' you would assign to a novel. Apart form those, you can also tag a novel as part of your 'Favourites' or 'Top 10'.

What the Reading Lists update does is it turns these tags into lists. That is, it'll automatically add all novels with the 'Favourites' tag to Reading List titled 'Favourites'. Naturally, it's the same for 'CN' or 'Top 10' or any other tag you have.
""";