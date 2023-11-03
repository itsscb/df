import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/pb/account.pb.dart';
import 'package:flutter/material.dart';

class AccountViewModel with ChangeNotifier {
  AccountViewModel() {
    _init();
  }
  ApiResponse _apiResponse = ApiResponse.initial('Keine Daten');

  final BackendService _service = BackendService();
  Account? _account;

  ApiResponse get response {
    return _apiResponse;
  }

  Account? get account {
    return _account;
  }

  void _init() async {
    _apiResponse = ApiResponse.loading('Bereite alles vor');
    try {
      _apiResponse = ApiResponse.completed(await _service.getAccount(), 'done');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchAccount() async {
    _apiResponse = ApiResponse.loading('Hole Account');
    notifyListeners();
    try {
      _apiResponse = ApiResponse.completed(await _service.getAccount(), 'done');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _apiResponse = ApiResponse.loading('Logge aus');
    notifyListeners();
    try {
      await BackendService.logout();
      _apiResponse = ApiResponse.completed(null, 'Erfolgreich ausgeloggt');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    print(_apiResponse.message);
    notifyListeners();
  }
}
