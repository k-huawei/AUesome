import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  //GOALS
  // 1. Audio Settings (for Text to Speech): volume, pitch, male/female, language
  //

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SettingsList(
              sections: [
                SettingsSection(
                  title: 'App Settings',
                  tiles: [
                    SettingsTile(
                      title: 'Language',
                      subtitle: 'English',
                      leading: Icon(Icons.language),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      title: 'Use fingerprint',
                      leading: Icon(Icons.fingerprint),
                      switchValue: null,
                      onToggle: (bool value) {},
                    ),
                  ],
                ),
              ],
            )

          ],

        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}



