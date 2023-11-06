import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
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

  Future<List<Person>> listPersons() async {
    List<Person> persons = [];
    _apiResponse = ApiResponse.loading('Lade Daten');
    try {
      persons = await _service.listPersons();
      _apiResponse = ApiResponse.completed(persons);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
    return persons;
  }

  Future<Person> createPerson(BuildContext context,
      {required String firstname,
      required String lastname,
      required String street,
      required String zip,
      required String city,
      required String country,
      required DateTime birthday}) async {
    Person person = Person();
    _apiResponse = ApiResponse.loading('Erstelle Person');
    try {
      person = await _service.createPerson(
          firstname: firstname,
          lastname: lastname,
          street: street,
          zip: zip,
          city: city,
          country: country,
          birthday: birthday);
      _apiResponse = ApiResponse.completed(person);
    } catch (err) {
      _apiResponse = ApiResponse.error(err.toString());
    }
    notifyListeners();
    return person;
  }
}
