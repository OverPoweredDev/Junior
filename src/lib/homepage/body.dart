import 'package:Junior/homepage/components/add_novel_button.dart';
import 'package:Junior/homepage/components/novel_tile.dart';
import 'package:Junior/homepage/components/searchbar.dart';
import 'package:Junior/homepage/components/sort_options.dart';
import 'package:Junior/homepage/components/title.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/model/preferences.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

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
    loadData();
  }

  // this is a bit of a hack, I'm calling an async from init
  // and once I get a response, I refresh the State.
  // FutureBuilder is more 'right' but it completely breaks searching
  // and sorting.
  loadData() async {
    novelList = await getNovelList();
    preferences = await loadPreferences();

    searchList.addAll(novelList);
    sortBy(preferences.sortBy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            HomePageTitle(),
            SizedBox(height: 60),
            SearchBar(
              onSearch: filterSearchResults,
              editingController: editingController,
            ),
            SizedBox(height: 20),
            AddNovelButton(),
            SizedBox(height: 20),
            SortOptions(
              sortBy: sortBy,
              sortOption: sortOption,
            ),
            ListView.builder(
              //otherwise there's two Scrollables and we can't scroll the list
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: novelList.length,
              itemBuilder: (BuildContext context, int index) {
                return NovelTile(novel: novelList[index]);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void sortBy(String option) {
    switch (option) {
      case 'Alphabetical':
        novelList.sort((novel1, novel2) {
          return novel1.title.toLowerCase().compareTo(novel2.title.toLowerCase());
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
          if(novel1.isComplete == novel2.isComplete){
            sortValue = novel2.lastEdited.compareTo(novel1.lastEdited);
          } else if (novel1.isComplete) {
            sortValue = 1;
          } else if (novel2.isComplete) {
            sortValue = -1;
          }

          return sortValue;
        });
        break;
    }

    setState(() {sortOption = option;});
  }

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(novelList);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });

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
}
