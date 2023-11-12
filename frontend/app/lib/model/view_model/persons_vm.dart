import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/pb/google/protobuf/timestamp.pb.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/util/colors.dart';
import 'package:fixnum/fixnum.dart';
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
      required Timestamp birthday}) async {
    Person person = Person();
    final messenger = ScaffoldMessenger.of(context);
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
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.success,
        content: const Text(
          'Gepeichert',
          style: TextStyle(color: Colors.white),
        ),
      ));
      _apiResponse = ApiResponse.completed(person);
    } catch (err) {
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'Fehler beim Speichern',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: 'Details',
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.error,
                        color: CustomColors.error,
                      ),
                      content: Text(
                        err.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ));
          },
        ),
      ));
      _apiResponse = ApiResponse.error(err.toString());
    }
    notifyListeners();
    return person;
  }

  Future<Person> updatePerson(BuildContext context,
      {required Int64 id,
      String? firstname,
      String? lastname,
      String? street,
      String? zip,
      String? city,
      String? country,
      Timestamp? birthday}) async {
    Person person = Person();
    final messenger = ScaffoldMessenger.of(context);
    _apiResponse = ApiResponse.loading('Erstelle Person');
    try {
      person = await _service.updatePerson(
          id: id,
          firstname: firstname,
          lastname: lastname,
          street: street,
          zip: zip,
          city: city,
          country: country,
          birthday: birthday);
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.success,
        content: const Text(
          'Gepeichert',
          style: TextStyle(color: Colors.white),
        ),
      ));
      _apiResponse = ApiResponse.completed(person);
    } catch (err) {
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'Fehler beim Speichern',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: 'Details',
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.error,
                        color: CustomColors.error,
                      ),
                      content: Text(
                        err.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ));
          },
        ),
      ));
      _apiResponse = ApiResponse.error(err.toString());
    }
    notifyListeners();
    return person;
  }
}
