import 'package:flutter/material.dart';
import 'package:junior/home_page/body.dart';
import 'package:junior/model/changelog.dart';
import 'package:junior/model/preferences.dart';
import 'package:junior/settings_page/components/export_data.dart';
import 'package:junior/settings_page/components/import_data.dart';
import 'package:junior/settings_page/components/remove_data.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: always_use_package_imports
import '../theme.dart';
// ignore: always_use_package_imports
import 'components/title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Preferences preferences = Preferences();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    preferences = await loadPreferences();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SettingsTitle(),
                const SizedBox(height: 60),
                SettingsList(
                  physics: const NeverScrollableScrollPhysics(),
                  backgroundColor: backgroundColor,
                  shrinkWrap: true,
                  sections: [
                    SettingsSection(
                      title: 'General',
                      titlePadding: const EdgeInsets.only(left: 15, bottom: 10),
                      titleTextStyle: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      tiles: [
                        SettingsTile.switchTile(
                          title: 'Enable Dark Mode',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.invert_colors,
                            color: linkColor,
                          ),
                          switchValue: preferences.darkMode,
                          onToggle: (bool toggle) {
                            preferences.darkMode = toggle;
                            saveDarkModeOption(toggle);

                            if (toggle) {
                              setDarkMode();
                            } else {
                              setLightMode();
                            }

                            setState(() {});
                          },
                        ),
                        SettingsTile(
                          title: 'Rate the App!',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.rate_review,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            launch(
                                'https://play.google.com/store/apps/details?id=com.overpowereddev.junior.src');
                          },
                        ),
                        SettingsTile(
                          title: 'Go Back',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.arrow_back,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: 'Storage',
                      titlePadding:
                          const EdgeInsets.only(top: 40, left: 15, bottom: 10),
                      titleTextStyle: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      tiles: [
                        SettingsTile.switchTile(
                          title: 'Automatic Exporting',
                          subtitle: 'Highly Recommended',
                          titleTextStyle: TextStyle(color: textColor),
                          subtitleTextStyle: TextStyle(
                            color: textColor,
                            fontSize: 12,
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: Icon(
                              Icons.alarm,
                              color: linkColor,
                            ),
                          ),
                          switchValue: preferences.exportAutomatically,
                          onToggle: (bool toggle) {
                            preferences.exportAutomatically = toggle;
                            saveExportReminder(toggle);
                            setState(() {});
                          },
                        ),
                        SettingsTile(
                          title: 'Export Data',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.arrow_circle_up,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            showExportDataDialog(context);
                          },
                        ),
                        SettingsTile(
                          title: 'Import Data',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.arrow_circle_down,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            showImportDataDialog(context);
                          },
                        ),
                        SettingsTile(
                          title: 'Remove All Data',
                          titleTextStyle: TextStyle(color: textColor),
                          subtitle: 'This deletes the AutoSave too',
                          subtitleTextStyle: TextStyle(color: textColor),
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: Icon(
                              Icons.delete,
                              color: linkColor,
                            ),
                          ),
                          onPressed: (context) {
                            showRemoveDataDialog(context);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: 'Other',
                      titlePadding:
                          const EdgeInsets.only(top: 40, left: 15, bottom: 10),
                      titleTextStyle: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      tiles: [
                        SettingsTile(
                          title: 'View Changelog',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.article,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            showChangeDialog(context);
                          },
                        ),
                        SettingsTile(
                          title: 'Report a bug',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.bug_report,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            launch(
                                'https://github.com/OverPoweredDev/Junior/issues/new?assignees=&labels=&template=bug_report.md&title=');
                          },
                        ),
                        SettingsTile(
                          title: 'Request a Feature',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.exit_to_app,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            launch(
                                'https://github.com/OverPoweredDev/Junior/issues/new?assignees=&labels=&template=feature_request.md&title=');
                          },
                        ),
                        SettingsTile(
                          title: 'View Source Code',
                          titleTextStyle: TextStyle(color: textColor),
                          leading: Icon(
                            Icons.code,
                            color: linkColor,
                          ),
                          onPressed: (context) {
                            launch('https://github.com/OverPoweredDev/Junior');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
