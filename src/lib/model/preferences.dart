class Preferences {
  bool darkMode;

  Preferences({this.darkMode = true});
}

Preferences loadPreferences() {
  return Preferences();
}