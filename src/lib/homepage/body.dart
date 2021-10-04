import 'package:flutter/material.dart';
import 'package:junior/homepage/components/add_novel_button.dart';
import 'package:junior/homepage/components/novel_tile.dart';
import 'package:junior/homepage/components/searchbar.dart';
import 'package:junior/homepage/components/sort_options.dart';
import 'package:junior/homepage/components/title.dart';
import 'package:junior/model/changelog.dart';
import 'package:junior/model/novel.dart';
import 'package:junior/model/preferences.dart';
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

  List searchList = [];
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
    novelList = await getNovelList();
    preferences = await loadPreferences();

    if (preferences.exportAutomatically) autoSave();

    searchList.addAll(novelList);
    sortBy(preferences.sortBy);
  }

  showChangelog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenChangelog = prefs.getBool('seenChangeLog-1.2.4') ?? false;

    if (!hasSeenChangelog) {
      showChangeDialog(context);
      prefs.setBool('seenChangeLog-1.2.4', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
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
            ListView.builder(
              //otherwise there's two Scrollables and we can't scroll the list
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: novelList.length,
              itemBuilder: (BuildContext context, int index) {
                return NovelTile(novel: novelList[index]);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void sortBy(String option) {
    switch (option) {
      case 'Alphabetical':
        novelList.sort((novel1, novel2) {
          return novel1.title
              .toLowerCase()
              .compareTo(novel2.title.toLowerCase());
        });
        break;
      case 'Most Recent':
        novelList.sort((novel1, novel2) {
          return novel2.lastEdited.compareTo(novel1.lastEdited);
        });
        break;
      case 'Rating':
        novelList.sort((novel1, novel2) {
          return novel2.novelRating.compareTo(novel1.novelRating);
        });
        break;
      case 'Ongoing':
        novelList.sort((novel1, novel2) {
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
        novelList.sort((novel1, novel2) {
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
      case 'On Hiatus':
        novelList.sort((novel1, novel2) {
          int sortValue = 0;
          if (novel1.novelStatus == novel2.novelStatus) {
            sortValue = novel2.lastEdited.compareTo(novel1.lastEdited);
          } else if (novel2.novelStatus == 'On Hiatus') {
            sortValue = 1;
          } else if (novel1.novelStatus == 'On Hiatus') {
            sortValue = -1;
          }

          return sortValue;
        });
        break;
    }

    setState(() {
      sortOption = option;
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
        novelList.clear();
        novelList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        novelList.clear();
        novelList.addAll(searchList);
      });
    }
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
