import 'package:Junior/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  bool darkMode;
  String sortBy;

  Preferences({this.darkMode = true, this.sortBy = 'Ongoing'});
}

Future<Preferences> loadPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool darkMode = preferences.get('darkMode') ?? true;
  String sortBy = preferences.get('sortBy') ?? 'Ongoing';

  if (darkMode)
    setDarkMode();
  else
    setLightMode();

  return Preferences(darkMode: darkMode, sortBy: sortBy);
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