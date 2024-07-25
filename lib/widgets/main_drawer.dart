import 'package:flutter/material.dart';
import 'package:vue_v4/screens/auth/splash.dart';
import 'package:vue_v4/screens/drawer/edit_profile.dart';

import '../app/cache_helper/cache_helper.dart';
import '../screens/drawer/help.dart';
import '../screens/drawer/notification_setting.dart';
import '../services/theme_services.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("wessam mahmoud"),
            accountEmail: const Text('cardiologist'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/DocorInChooseRole.png'),
            ),
            decoration: BoxDecoration(
              color: ThemeManager.deepBlue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettings(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Are you sure to loge out ?',
                              style: headingStyle.copyWith(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 60,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            const WidgetStatePropertyAll(
                                                Colors.white),
                                        backgroundColor: WidgetStatePropertyAll(
                                            ThemeManager.deepBlue),
                                      ),
                                      onPressed: () {
                                        CacheHelper.saveData(
                                                key: 'introScreen', value: false)
                                            .then(
                                          (value) {
                                            print('User log out ');
                                          },
                                        );
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SplashScreen(),
                                            ));
                                      },
                                      child: const Text('Loge Out'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 60,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            const WidgetStatePropertyAll(
                                                Colors.white),
                                        backgroundColor: WidgetStatePropertyAll(
                                            ThemeManager.gryVu),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
