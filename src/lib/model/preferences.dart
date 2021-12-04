import 'package:junior/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  bool darkMode;
  bool enableReadingLists;
  bool exportAutomatically;
  String sortBy;

  // ignore: sort_constructors_first
  Preferences(
      {this.darkMode = true,
      this.sortBy = 'Ongoing',
      this.exportAutomatically = true,
      this.enableReadingLists = true});
}

Future<Preferences> loadPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool darkMode = preferences.get('darkMode') ?? true;
  bool exportReminder = preferences.get('exportAutomatically') ?? true;
  bool enableReadingLists = preferences.get('enableReadingLists') ?? true;
  String sortBy = preferences.get('sortBy') ?? 'Ongoing';

  if (darkMode) {
    setDarkMode();
  } else {
    setLightMode();
  }

  return Preferences(
    darkMode: darkMode,
    sortBy: sortBy,
    exportAutomatically: exportReminder,
    enableReadingLists: enableReadingLists,
  );
}

Future<bool> saveDarkModeOption(bool isDarkMode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('darkMode', isDarkMode);
  return true;
}

Future<bool> saveReadingListsOption(bool showReadingLists) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('enableReadingLists', showReadingLists);
  return true;
}

Future<bool> saveSortOption(String sortBy) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('sortBy', sortBy);
  return true;
}

Future<bool> saveExportReminder(bool export) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('exportAutomatically', export);
  return true;
}
