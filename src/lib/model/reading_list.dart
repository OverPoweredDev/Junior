import 'package:junior/model/novel.dart';

Set<String> allTags = Set<String>();
List readingLists = [];

class ReadingList {
  ReadingList({this.listName, this.numNovels});

  String listName;
  int numNovels;
}

List generateReadingLists() {
  readingLists.clear();

  for (var novel in novelList) {
    for (var tag in novel.novelTags) {
      allTags.add(tag);
      int idx = readingLists.indexWhere((list) => list.listName == tag);
      if(idx != -1){
        readingLists[idx].numNovels += 1;
      } else {
        readingLists.add(
          ReadingList(
            listName: tag,
            numNovels: 1,
          ),
        );
      }
    }
  }

  readingLists.insert(
    0,
    ReadingList(listName: 'All Novels', numNovels: novelList.length),
  );

  readingLists.sort((list1, list2) {
    return list2.numNovels.compareTo(list1.numNovels);
  });

  return readingLists;
}