import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junior/model/preferences.dart';
import 'package:junior/settings_page/body.dart';

// ignore: always_use_package_imports
import '../../theme.dart';

class SortOptions extends StatefulWidget {
  final Function(String option) sortBy;
  final String sortOption;

  // ignore: use_key_in_widget_constructors, sort_constructors_first
  const SortOptions({this.sortBy, this.sortOption});

  @override
  _SortOptions createState() {
    // ignore: no_logic_in_create_state
    return _SortOptions(sortBy: this.sortBy, sortOption: this.sortOption);
  }
}

class _SortOptions extends State<SortOptions> {
  final Function(String option) sortBy;
  final String sortOption;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  _SortOptions({this.sortBy, this.sortOption});

  var isSortListVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.sort,
                  color: linkColor,
                  size: 20,
                ),
                label: Text(sortOption,
                    style: const TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    isSortListVisible = !isSortListVisible;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: linkColor,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          Visibility(
              visible: isSortListVisible,
              child: SortHorizontalTiles(sortBy: sortBy))
        ]));
  }
}

// ignore: must_be_immutable
class SortHorizontalTiles extends StatelessWidget {
  final Function(String option) sortBy;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  SortHorizontalTiles({this.sortBy});

  List<String> sortingOptions = [
    'Alphabetical',
    'Most Recent',
    'Rating',
    'Ongoing',
    'Complete',
    'To Read'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sortingOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      saveSortOption(sortingOptions[index]);
                      sortBy(sortingOptions[index]);
                    },
                    child: Text(sortingOptions[index]),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white.withAlpha(170)),
                    ),
                  );
                })));
  }
}
