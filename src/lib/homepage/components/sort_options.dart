import 'package:Junior/model/preferences.dart';
import 'package:Junior/settings_page/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import '../../theme.dart';

class SortOptions extends StatelessWidget {
  final Function(String option) sortBy;
  final String sortOption;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  const SortOptions({this.sortBy, this.sortOption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            icon: Container(),
            hint: Row(
              children: [
                Icon(
                  Icons.sort,
                  color: linkColor,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  sortOption,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            elevation: 0,
            style: TextStyle(color: textColor),
            dropdownColor: tileColor.withAlpha(255),
            isDense: true,
            underline: Container(),
            onChanged: (String newValue) {
              saveSortOption(newValue);
              sortBy(newValue);
            },
            items: <String>[
              'Alphabetical',
              'Most Recent',
              'Rating',
              'Ongoing',
              'Complete',
              'On Hiatus'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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
    );
  }
}
