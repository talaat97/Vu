import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isdarkmode';
  _saveThemeToBox(bool isdarkmode) {
    _box.write(_key, isdarkmode);
  }

  bool _loadThemeFrombox() {
    return _box.read<bool>(_key) ?? false;
  }

  ThemeMode get Theme {
    if (_loadThemeFrombox()) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFrombox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFrombox());
  }
}

class ThemeManager {
  static Color litteBlue = const Color.fromRGBO(83, 167, 216, 1);
  static Color gryVu = Colors.grey.withOpacity(0.5);
  static Color deepBlue = const Color.fromRGBO(1, 92, 146, 1);
  static final light = ThemeData(
      primaryColor: primaryClr,
      // ignore: deprecated_member_use

      brightness: Brightness.light);
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    // ignore: deprecated_member_use

    brightness: Brightness.dark,
  );
}

TextStyle get headingStyle {
  return TextStyle(
    fontSize: 25,
    color: ThemeManager.deepBlue,
    fontWeight: FontWeight.w800,
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ThemeManager.gryVu,
  );
}

TextStyle get titleStyle {
  return TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ThemeManager.litteBlue,
  );
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ThemeManager.deepBlue,
    ),
  );
}

TextStyle get body20Style {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}

TextStyle get body30tyle {
  return const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
