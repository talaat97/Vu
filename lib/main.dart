import 'package:flutter/material.dart';
import 'package:vue_v4/app/cache_helper/cache_data.dart';
import 'package:vue_v4/app/cache_helper/cache_helper_keys.dart';
import 'package:vue_v4/screens/auth/splash.dart';
import 'package:vue_v4/services/theme_services.dart';
import 'app/cache_helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  CacheData.firstOpen =
      await CacheHelper.getData(key: CacheHelperKeys.firstOpen);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeManager.deepBlue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
