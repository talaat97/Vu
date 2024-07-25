import 'package:flutter/material.dart';
import 'package:vue_v4/services/theme_services.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

bool _sound = true;
bool _vibrate = true;
bool _flatingNotifaction = false;
bool _lockScreenNotifaction = false;

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(              
              title: Text('Sound'),
              value: _sound,
              onChanged: (bool value) {
                setState(() {
                  _sound = value;
                });
              },
            ),
            SwitchListTile(              
              title: Text('Sound'),
              value: _vibrate,
              onChanged: (bool value) {
                setState(() {
                  _vibrate = value;
                });
              },
            ),
            SwitchListTile(              
              title: Text('Sound'),
              value: _flatingNotifaction,
              onChanged: (bool value) {
                setState(() {
                  _flatingNotifaction = value;
                });
              },
            ),
            SwitchListTile(              
              title: Text('Sound'),
              value: _flatingNotifaction,
              onChanged: (bool value) {
                setState(() {
                  _flatingNotifaction = value;
                });
              },
            ),
            SwitchListTile(              
              title: Text('Sound'),
              value: _lockScreenNotifaction,
              onChanged: (bool value) {
                setState(() {
                  _lockScreenNotifaction = value;
                });
              },
            ),
         
          ],
        ),
      ),
    );
  }

  SwitchListTile CustomeSwitch(
      BuildContext context,
      title,
      subtitle,
      filter,
      // ignore: non_constant_identifier_names
      Function(bool NewValue) OnChange) {
    return SwitchListTile(
      value: filter,
      onChanged: OnChange,
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
      activeColor: ThemeManager.deepBlue,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
