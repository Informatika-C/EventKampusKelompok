import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  SharedPreferences? _sharedPreferencesInstance;

  Future<SharedPreferences> init() async {
    _sharedPreferencesInstance ??= await SharedPreferences.getInstance();
    return _sharedPreferencesInstance!;
  }
}
