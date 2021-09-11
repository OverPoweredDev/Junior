import 'package:Junior/homepage/body.dart';
import 'package:Junior/model/preferences.dart';
import 'package:Junior/settings_page/components/export_data.dart';
import 'package:Junior/settings_page/components/import_data.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Preferences preferences;

  @override
  void initState() {
    preferences = loadPreferences();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      physics: NeverScrollableScrollPhysics(),
      backgroundColor: backgroundColor,
      shrinkWrap: true,
      sections: [
        SettingsSection(
          title: 'General',
          titlePadding: EdgeInsets.only(left: 15, bottom: 10),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          tiles: [
            SettingsTile.switchTile(
              title: 'Enable Dark Mode',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.invert_colors,
                color: Colors.white,
              ),
              switchValue: preferences.darkMode,
              onToggle: (bool toggle) {
                preferences.darkMode = toggle;
                setState(() {});
              },
            ),
            SettingsTile(
              title: 'Rate the App!',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.rate_review,
                color: Colors.white,
              ),
              onPressed: (context) {
                launch(
                    'https://play.google.com/store/apps/details?id=com.overpowereddev.junior.src');
              },
            ),
            SettingsTile(
              title: 'Go Back',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (context) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Data',
          titlePadding: EdgeInsets.only(top: 40, left: 15, bottom: 10),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          tiles: [
            SettingsTile(
              title: 'Export Data',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.arrow_circle_up,
                color: Colors.white,
              ),
              onPressed: (context) {
                showExportDataDialog(context);
              },
            ),
            SettingsTile(
              title: 'Import Data',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.arrow_circle_down,
                color: Colors.white,
              ),
              onPressed: (context) {
                showImportDataDialog(context);
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Other',
          titlePadding: EdgeInsets.only(top: 40, left: 15, bottom: 10),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          tiles: [
            SettingsTile(
              title: 'Report a bug',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.bug_report,
                color: Colors.white,
              ),
              onPressed: (context) {
                launch(
                    'https://github.com/OverPoweredDev/Junior/issues/new?assignees=&labels=&template=bug_report.md&title=');
              },
            ),
            SettingsTile(
              title: 'Request a Feature',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: (context) {
                launch(
                    'https://github.com/OverPoweredDev/Junior/issues/new?assignees=&labels=&template=feature_request.md&title=');
              },
            ),
            SettingsTile(
              title: 'View Source Code',
              titleTextStyle: TextStyle(color: Colors.white),
              leading: Icon(
                Icons.code,
                color: Colors.white,
              ),
              onPressed: (context) {
                launch('https://github.com/OverPoweredDev/Junior');
              },
            ),
          ],
        )
      ],
    );
  }
}
