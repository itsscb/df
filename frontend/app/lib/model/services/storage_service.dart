import 'package:fixnum/fixnum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageItem {
  StorageItem(this.key, this.value);

  final String key;
  final String value;
}

class StorageService {
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> writeData(StorageItem item) async {
    await _secureStorage.write(
      key: item.key,
      value: item.value,
    );
  }

  Future<String?> readData(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<List<StorageItem>> readAllSecureData() async {
    var allData = await _secureStorage.readAll();
    List<StorageItem> list =
        allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  Future<bool> containsData(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  Future<void> deleteSecureData(StorageItem item) async {
    await _secureStorage.delete(
      key: item.key,
    );
  }

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll();
  }

  Future<void> setNotificationSetting(bool enabled) async {
    return await writeData(StorageItem('notifications', enabled ? '1' : '0'));
  }

  Future<bool> get notificationSetting async {
    final enabled = await readData('notifications') == '1' ? true : false;
    return enabled;
  }

  Future<int> get accountLevel async {
    int? level;
    final lev = await readData('account_level');
    if (lev != null) {
      level = int.tryParse(lev);
    }
    return level ?? 0;
  }

  Future<void> setAccessToken(String accessToken) async {
    return await writeData(StorageItem('access_token', accessToken));
  }

  Future<String?> get accessToken async {
    return await readData('access_token');
  }

  Future<void> setVerified(bool verified) async {
    return await writeData(StorageItem('verified', verified ? '1' : '0'));
  }

  Future<bool> get verified async {
    return await readData('verified') == '1';
  }

  Future<void> setAccountId(Int64 accountId) async {
    return await writeData(StorageItem('account_id', '$accountId'));
  }

  Future<Int64> get accountId async {
    Int64? accountId;
    final id = await readData('account_id');
    if (id != null) {
      final i = Int64.tryParseInt(id);
      if (i != null) {
        accountId = i;
      }
    }
    return accountId ?? Int64(0);
  }

  Future<void> setAccountLevel(int level) async {
    return await writeData(StorageItem('account_level', '$level'));
  }

  Future<void> initAccountLevel() async {
    return await writeData(StorageItem('account_level', '0'));
  }

  Future<void> addAccountLevel() async {
    int? level;
    final l = await readData('account_level');
    if (l != null) {
      level = int.tryParse(l);
    }
    return await writeData(
        StorageItem('account_level', '${level != null ? level + 1 : 1}'));
  }
}
