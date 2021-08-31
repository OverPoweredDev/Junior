import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortOptions extends StatelessWidget {
  final Function(String option) sortBy;
  final String sortOption;

  SortOptions({this.sortBy, this.sortOption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton<String>(
            icon: Container(),
            hint: Row(
              children: [
                Icon(
                  Icons.sort,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 10),
                Text(
                  sortOption,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            elevation: 0,
            style: const TextStyle(color: Colors.white),
            dropdownColor: Color.fromRGBO(69, 76, 95, 1.0),
            isDense: true,
            underline: Container(),
            onChanged: (String newValue) {
              sortBy(newValue);
            },
            items: <String>['Alphabetical', 'Most Recent', 'Rating']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
