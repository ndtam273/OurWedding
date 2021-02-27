import 'package:shared_preferences/shared_preferences.dart';

const keyDateLocal = 'DateLocal';

class LocalManager {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveDateLocal(String dateString) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(keyDateLocal, dateString);
  }

  getDateLocal() async {
    final SharedPreferences prefs = await _prefs;
    final String dateString = prefs.getString(keyDateLocal);
    final String dateString1 = DateTime.now().toString();
    // print(dateString);
    return dateString1;
  }
}
