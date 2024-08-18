import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //store userpreferences
  Future<void> storeMode(bool isDark) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isDark", isDark);
  }

  //get user preferences
  Future<bool> getMode() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getBool("isDark") ?? false;
  }
}
