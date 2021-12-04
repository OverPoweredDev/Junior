import 'package:flutter/material.dart';
import 'package:junior/model/reading_list.dart';
import 'package:junior/theme.dart';

// ignore: must_be_immutable
class ReadingListTiles extends StatelessWidget {
  final void Function() loadData;
  final void Function(String option) onSearch;
  final void Function(String option) setSelectedOption;
  final void Function(String original, String newName) renameList;
  final void Function(String original) deleteList;
  final String selectedOption;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  const ReadingListTiles({
    this.onSearch,
    this.setSelectedOption,
    this.selectedOption,
    this.renameList,
    this.deleteList,
    this.loadData
  });

  ButtonStyle getStyle(String option) {
    if (option == selectedOption) {
      return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          textColor.withAlpha(255),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          textColor.withAlpha(30),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.white.withAlpha(50),
        ),
      );
    }

    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        textColor.withAlpha(200),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        textColor.withAlpha(10),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.white.withAlpha(50),
      ),
    );
  }

  void showRenameDialog(BuildContext context, String oldName) {
    String newName;

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Edit Reading List',
          style: TextStyle(color: textColor),
          textAlign: TextAlign.left,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Note that you can rename to an already existing name',
              style: TextStyle(color: textColor),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: TextEditingController()..text = oldName,
                style: TextStyle(color: textColor, fontSize: 18),
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(5),
                ),
                onChanged: (String text) {
                  newName = text;
                },
              ),
            ),
            const SizedBox(height: 25),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6.0),
              child: InkWell(
                onTap: () {
                  if (newName != '') {
                    renameList(oldName, newName);
                    Navigator.pop(context);
                    loadData();
                  } else {
                    Navigator.pop(context);
                    showInvalidDialog(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  child: const Text(
                    'Rename Tag',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              color: const Color.fromRGBO(255, 89, 99, 1.0),
              borderRadius: BorderRadius.circular(6.0),
              child: InkWell(
                onTap: () {
                  if (newName != '') {
                    renameList(oldName, newName);
                    Navigator.pop(context);
                    loadData();
                  } else {
                    Navigator.pop(context);
                    showInvalidDialog(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  child: const Text(
                    'Delete it Instead',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: tileColor.withAlpha(255),
        scrollable: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (readingLists.isEmpty) {
      return Container();
    }

    return SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: readingLists.length,
          itemBuilder: (BuildContext context, int index) {
            String option = readingLists[index].listName;

            if(option == '' || option == null) return Container();

            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () {
                  if (option == 'All Novels') {
                    setSelectedOption(option);
                    onSearch('');
                  } else {
                    setSelectedOption(option);
                    onSearch(option);
                  }
                },
                onLongPress: () {
                  if (option != 'All Novels') {
                    showRenameDialog(context, option);
                  }
                },
                child: Text(option),
                style: getStyle(option),
              ),
            );
          },
        ),
      ),
    );
  }

  bool isDuplicateTag(String text) {
    return allTags.contains(text);
  }
}

showInvalidDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        "The new Reading List cannot have an empty please try again.",
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
