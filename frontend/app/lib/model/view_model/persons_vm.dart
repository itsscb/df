import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/pb/person.pb.dart';
import 'package:flutter/material.dart';

class PersonsViewModel with ChangeNotifier {
  PersonsViewModel() {
    listPersons();
  }
  ApiResponse _apiResponse = ApiResponse.initial('Keine Daten');

  final BackendService _service = BackendService();

  ApiResponse get response {
    return _apiResponse;
  }

  void listPersons() async {
    _apiResponse = ApiResponse.loading('Bereite alles vor');
    try {
      _apiResponse =
          ApiResponse.completed(await _service.listPersons(), 'done');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
