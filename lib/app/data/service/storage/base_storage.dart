import 'package:shared_preferences/shared_preferences.dart';

class BaseStorage {
  BaseStorage(this._storage);

  final SharedPreferences _storage;

  Future<String?> read(String key) async {
    return _storage.getString(key);
  }

  Future<void> write(String key, String value) async {
    await _storage.setString(key, value);
  }

  Future<void> delete(String key) async {
    await _storage.remove(key);
  }
}
