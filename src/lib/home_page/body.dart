import 'package:flutter/material.dart';
import 'package:junior/home_page/components/add_novel_button.dart';
import 'package:junior/home_page/components/novel_count.dart';
import 'package:junior/home_page/components/novel_tile.dart';
import 'package:junior/home_page/components/reading_lists.dart';
import 'package:junior/home_page/components/searchbar.dart';
import 'package:junior/home_page/components/sort_options.dart';
import 'package:junior/home_page/components/title.dart';
import 'package:junior/model/changelog.dart';
import 'package:junior/model/novel.dart';
import 'package:junior/model/preferences.dart';
import 'package:junior/model/reading_list.dart';
import 'package:junior/settings_page/components/export_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: always_use_package_imports
import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController;
  Preferences preferences;
  String sortOption = 'Sort';
  String readingList = 'All Novels';

  List displayList = [];
  List novelList = [];

  @override
  void initState() {
    super.initState();
    showChangelog(context);
    loadData();
  }

  // this is a bit of a hack, I'm calling an async from init
  // and once I get a response, I refresh the State.
  // FutureBuilder is more 'right' but it completely breaks searching
  // and sorting.
  loadData() async {
    readingLists.clear();
    novelList = await getNovelList();
    preferences = await loadPreferences();

    if (preferences.exportAutomatically) autoSave();
    if (preferences.enableReadingLists) {
      readingLists = generateReadingLists();
      readingList = 'All Novels';
    }

    displayList.clear();
    displayList.addAll(novelList);
    sortBy(preferences.sortBy);
  }

  showChangelog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String seenVersion = prefs.getString('seenVersion') ?? '0';

    if (seenVersion != '1.4.0') {
      showChangeDialog(context);
      prefs.setString('seenVersion', '1.4.0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        color: textColor,
        backgroundColor: backgroundColor,
        onRefresh: () async => await loadData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const HomePageTitle(),
              const SizedBox(height: 80),
              SearchBar(
                onSearch: filterSearchResults,
                editingController: editingController,
              ),
              const SizedBox(height: 20),
              const AddNovelButton(),
              const SizedBox(height: 20),
              SortOptions(
                sortBy: sortBy,
                sortOption: sortOption,
              ),
              ReadingListTiles(
                onSearch: fillReadingList,
                setSelectedOption: setSelectedList,
                selectedOption: readingList,
                renameList: renameReadingList,
                deleteList: deleteReadingList,
                loadData: loadData,
              ),
              ListView.builder(
                //otherwise there's two Scrollables and we can't scroll the list
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: displayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NovelTile(novel: displayList[index]);
                },
              ),
              const SizedBox(height: 10),
              NovelCount(numNovels: displayList.length),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void sortBy(String option) {
    switch (option) {
      case 'Alphabetical':
        displayList.sort((novel1, novel2) {
          return novel1.title
              .toLowerCase()
              .compareTo(novel2.title.toLowerCase());
        });
        break;
      case 'Most Recent':
        displayList.sort((novel1, novel2) {
          return novel2.lastEdited.compareTo(novel1.lastEdited);
        });
        break;
      case 'Rating':
        displayList.sort((novel1, novel2) {
          return novel2.novelRating.compareTo(novel1.novelRating);
        });
        break;
      case 'Ongoing':
        displayList.sort((novel1, novel2) {
          int sortValue = 0;
          if (novel1.novelStatus == novel2.novelStatus) {
            sortValue = novel2.lastEdited.compareTo(novel1.lastEdited);
          } else if (novel2.novelStatus == 'Ongoing') {
            sortValue = 1;
          } else if (novel1.novelStatus == 'Ongoing') {
            sortValue = -1;
          }

          return sortValue;
        });
        break;
      case 'Complete':
        displayList.sort((novel1, novel2) {
          int sortValue = 0;
          if (novel1.novelStatus == novel2.novelStatus) {
            sortValue = novel2.lastEdited.compareTo(novel1.lastEdited);
          } else if (novel2.novelStatus == 'Complete') {
            sortValue = 1;
          } else if (novel1.novelStatus == 'Complete') {
            sortValue = -1;
          }

          return sortValue;
        });
        break;
      case 'To Read':
        displayList.sort((novel1, novel2) {
          int sortValue = 0;
          if (novel1.novelStatus == novel2.novelStatus) {
            sortValue = novel2.lastEdited.compareTo(novel1.lastEdited);
          } else if (novel2.novelStatus == 'To Read') {
            sortValue = 1;
          } else if (novel1.novelStatus == 'To Read') {
            sortValue = -1;
          }

          return sortValue;
        });
        break;
    }

    sortOption = option;
    setState(() {
    });
  }

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(novelList);
    if (query.isNotEmpty) {
      List dummyListData = [];
      for (var item in dummySearchList) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      }

      setState(() {
        displayList.clear();
        displayList.addAll(dummyListData);
      });

      return;

    } else {
      setState(() {
        displayList.clear();
        displayList.addAll(novelList);
      });
    }
  }

  void fillReadingList(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(novelList);
    if (query.isNotEmpty) {
      List dummyListData = [];
      for (var item in dummySearchList) {
        if (item.isInList(query)) {
          dummyListData.add(item);
        }
      }

      setState(() {
        displayList.clear();
        displayList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        displayList.clear();
        displayList.addAll(novelList);
      });
    }
  }

  void renameReadingList(String original, String newName) {
    for(var novel in novelList){
        int idx = novel.novelTags.indexWhere((tag) => tag == original);
        if(idx != -1){
          novel.novelTags.removeAt(idx);
          novel.novelTags.insert(idx, newName);
        }
    }

    saveNovelList(novelList);
    setState(() {});
  }


  void deleteReadingList(String original) {
    for(var novel in novelList){
        int idx = novel.novelTags.indexWhere((tag) => tag == original);
        if(idx != -1){
          novel.novelTags.removeAt(idx);
          novel.novelTags;
        }
    }

    saveNovelList(novelList);
    setState(() {});
  }

  void setSelectedList(String listName) {
    setState(() {
      readingList = listName;
    });
  }

  void autoSave() async {
    const int dayInMilliseconds = 86400000;

    bool moreThanADay(int milliseconds) {
      return DateTime.now().millisecondsSinceEpoch - milliseconds >
          dayInMilliseconds;
    }

    // just Autosave if lastSaved is unknown
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int milliseconds = prefs.getInt('lastSaved') ??
        DateTime.now().millisecondsSinceEpoch - dayInMilliseconds * 2;

    if (moreThanADay(milliseconds)) {
      await exportData(
          'autosaves/novelList-autosave-' + getRandomNumbers() + '.txt');
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(
            'Autosaved Data to Download/Junior/autosaves/',
            style: TextStyle(color: textColor),
          ),
          backgroundColor: tileColor.withAlpha(255),
        ),
      );
      prefs.setInt('lastSaved', DateTime.now().millisecondsSinceEpoch);
    }
  }
}
