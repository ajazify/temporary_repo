import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //method one
  Future<void> store({required String key, required String v}) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString(key, v);
    print(prefs.getString(key));
  }

//method two
  Future<void> getValue({required var key}) async {
    final SharedPreferences prefs = await _prefs;
    final String? value = prefs.getString(key);
    print('value $value');
  }
}

class KeyConst {
  static String NOTEKEY = 'note';
  static String NAMEKEY = 'name';
}
