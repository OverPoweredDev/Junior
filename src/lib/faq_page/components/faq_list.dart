import 'package:junior/faq_page/components/faq_card.dart';

//ignore:constant_identifier_names
const List<FAQCard> FAQList = [
  FAQCard(
    title: "What are dynamic links?",
    data: dynamicLinksAnswer,
  ),
  FAQCard(
    title: "How do Tags / Reading Lists even Work?",
    data: novelTagsAnswer,
  ),
  FAQCard(
    title: "Do we have Volume Support?",
    data: volumeSupportAnswer,
  ),
  FAQCard(
    title: "Nothing happens when I press Export Novel Data, what's up with that?",
    data: exportDataAnswer,
  ),
  FAQCard(
    title: "How can I help with development?",
    data: helpAnswer,
  ),
];

const String dynamicLinksAnswer =
"""A lot of novel websites use a simple

name.com/novel/chapterNum

format. So you can simply replace the chapterNum part with <num> or <num-d> to pad with zero's and the app automatically updates the link from your chapter Count.

Example:
https://boxnovel.com/novel/super-gene/chapter-<num>/

if your chapter progress is 3460, becomes

https://boxnovel.com/novel/super-gene/chapter-3460/

Similarly, <num-6> would turn into .../chapter-003460. Not useful in this case but some sites pad the links with 0's. The whole idea is to only update the chapter count and the link just takes you to the right chapter by itself.
""";

const String novelTagsAnswer =
"""Alright Tags are easy enough to understand, they're just the tags or genres like say 'CN' you would assign to a novel. Apart from those, you can also tag a novel as part of your 'Favourites' or 'Top 10'.

What the Reading Lists update does is it turns these tags into lists. That is, it'll automatically add all novels with the 'Favourites' tag to Reading List titled 'Favourites'. Naturally, it's the same for 'CN' or 'Top 10' or any other tag you have.

There's also a setting to disable these if you're not into it (Default is enabled).
""";

const String volumeSupportAnswer =
"""Volume Support is there! Just click on 'Volume' in the Chapter/Volume Progress Heading while editing any Novel and it'll automatically open the volume text fields and take care of the presentation on the home page and all.

As for why it's so hidden? I didn't wanna make the app a mess of buttons everywhere so it ended up being a little inconspicuous. I'm still very happy with how it looks honestly.
""";

const String exportDataAnswer =
"""Some of you guys reported an Issue with Novel Exporting. i.e. when you press the export button, nothing happens. 

Big Thanks to Ana Lopes who told me how to fix it on Github! the issue can be solved by enabling the 'Install from Unknown Sources' setting. Basically it just doesn't let the app store anything otherwise.

I'll try to fix it soon but till then, this isn't Ideal but it solves the problem :/
""";

const String helpAnswer =
"""Any and all contributions are very very welcome. Be it in adding features, spotting and fixing bugs or even just documentation, Junior has a long way to go.

There's a button in Settings to check out the source code, just go there and create an issue for whatever you feel the devs should know or if you wanna help with it yourself.
""";