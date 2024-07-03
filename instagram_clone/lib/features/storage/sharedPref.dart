import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefNote {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> noteList = [];

  // Method to store a value in the list
  Future<void> write({required String key, required String v}) async {
    final SharedPreferences prefs = await _prefs;
    noteList = prefs.getStringList(key) ?? [];
    noteList.add(v);
    prefs.setStringList(key, noteList);
    print(prefs.getStringList(key));
  }

  // Method to get the list of values
  Future<List<String>> read({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key) ?? [];
  }

  // Method to delete a value
  Future<void> remove({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
