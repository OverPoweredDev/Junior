import 'package:Junior/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  bool darkMode;

  Preferences({this.darkMode = true});
}

Future<Preferences> loadPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool darkMode = preferences.get('darkMode') ?? true;

  if (darkMode)
    setDarkMode();
  else
    setLightMode();

  return Preferences(darkMode: darkMode);
}

Future<bool> savePreferences(Preferences pref) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('darkMode', pref.darkMode);
  return true;
}