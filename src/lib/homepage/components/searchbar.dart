import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onSearch;
  final TextEditingController editingController;

  SearchBar({
    this.onSearch,
    this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: editingController,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
          onChanged: onSearch,
          cursorColor: textColor,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            prefixIcon: Icon(
              Icons.search,
              color: iconColor,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(11),
          ),
        ),
      ),
    );
  }
}
