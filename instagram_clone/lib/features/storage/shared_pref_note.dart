import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefNote {
  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
  List<String> noteList = [];

  //method one
  Future<void> write({required String key, required String v}) async {
    final SharedPreferences prefs = await _prefs;
    //! fetch previous list
    //! get list from store and save it to notelist
    noteList.addAll(prefs.getStringList(key) ?? []);
    noteList.add(v);
    prefs.setStringList(key, noteList);
    print(prefs.getStringList(key));
  }

//method two
  Future<String> read({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    final String? value = prefs.getString(key);
    return value ?? 'No Value Received'; 
  }

  //method two
  Future<void> remove({required var key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}

