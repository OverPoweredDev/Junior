import 'package:Junior/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  bool darkMode;
  bool exportAutomatically;
  String sortBy;

  Preferences({this.darkMode = true, this.sortBy = 'Ongoing', this.exportAutomatically = true});
}

Future<Preferences> loadPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool darkMode = preferences.get('darkMode') ?? true;
  bool exportReminder = preferences.get('exportAutomatically') ?? true;
  String sortBy = preferences.get('sortBy') ?? 'Most Recent';

  if (darkMode)
    setDarkMode();
  else
    setLightMode();

  return Preferences(darkMode: darkMode, sortBy: sortBy, exportAutomatically: exportReminder);
}

Future<bool> saveDarkModeOption(bool isDarkMode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('darkMode', isDarkMode);
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