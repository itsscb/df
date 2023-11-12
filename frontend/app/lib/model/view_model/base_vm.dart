import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/pages_draft/home_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    // init();
  }
  ApiResponse _apiResponse = ApiResponse.initial('Keine Daten');

  final BackendService _service = BackendService();

  ApiResponse get response {
    return _apiResponse;
  }

  // void init() async {
  //   // if (await BackendService.isLoggedIn) {
  //   try {
  //     _apiResponse = ApiResponse.completed(await _service.getAccount());
  //   } catch (e) {
  //     _apiResponse = ApiResponse.error(e.toString());
  //   }
  //   notifyListeners();
  //   // }
  // }

  Future<bool> isLoggedIn(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    bool loggedIn = false;
    try {
      loggedIn = await BackendService.isLoggedIn;
    } catch (err) {
      if (err.toString().contains('session is blocked')) {
        _apiResponse = ApiResponse.error('Sitzung ist abgelaufen');
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (builder) => HomePage(
                      loggedOut: true,
                    )),
            (route) => false);
        messenger.showSnackBar(SnackBar(
          backgroundColor: CustomColors.error,
          content: const Text(
            'Sitzung ist abgelaufen',
            style: TextStyle(color: Colors.white),
          ),
          // action: SnackBarAction(
          //   label: 'Details',
          //   onPressed: () {
          //     if (context.mounted) {
          //       showDialog(
          //           context: context,
          //           builder: (context) => AlertDialog(
          //                 backgroundColor: Colors.black,
          //                 icon: Icon(
          //                   Icons.error,
          //                   color: CustomColors.error,
          //                 ),
          //                 content: Text(
          //                   err.toString(),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ));
          //     }
          //   },
          // ),
        ));
      }
    }
    return loggedIn;
  }

  Future<void> getAccount(BuildContext context) async {
    _apiResponse = ApiResponse.loading('Lade Daten');
    notifyListeners();
    final messenger = ScaffoldMessenger.of(context);
    try {
      _apiResponse = ApiResponse.completed(await _service.getAccount());
    } catch (e) {
      if (e.toString().contains('session is blocked')) {
        _apiResponse = ApiResponse.error('Sitzung ist abgelaufen');
        messenger.showSnackBar(SnackBar(
          backgroundColor: CustomColors.error,
          content: const Text(
            'Sitzung ist abgelaufen',
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
                          e.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ));
            },
          ),
        ));
      }
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'Sitzung ist abgelaufen',
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
                        e.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ));
          },
        ),
      ));
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _apiResponse = ApiResponse.loading('Logge aus');
    notifyListeners();
    try {
      await BackendService.logout();
      _apiResponse = ApiResponse.completed(true);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    print(_apiResponse.message);
    notifyListeners();
  }

  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    bool resp = false;
    _apiResponse = ApiResponse.loading('Logge ein');
    notifyListeners();
    final messenger = ScaffoldMessenger.of(context);
    try {
      resp = await BackendService.login(email: email, password: password);
      _apiResponse = ApiResponse.completed(resp);
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.success,
        content: const Text(
          'Erfolgreich eingeloggt',
          style: TextStyle(color: Colors.white),
        ),
      ));
    } catch (e) {
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'Login fehlgeschlagen',
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
                        e.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ));
          },
        ),
      ));
      _apiResponse = ApiResponse.error(e.toString());
    }
    print(_apiResponse.message);
    notifyListeners();
    return resp;
  }

  Future<bool> createAccount(BuildContext context,
      {required String email, required String password}) async {
    bool resp = false;
    final messenger = ScaffoldMessenger.of(context);

    _apiResponse = ApiResponse.loading('Logge ein');
    notifyListeners();
    try {
      resp =
          await BackendService.createAccount(email: email, password: password);
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.success,
        content: const Text(
          'Account angelegt',
          style: TextStyle(color: Colors.white),
        ),
      ));
      _apiResponse = ApiResponse.completed(resp);
    } catch (e) {
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'Account anlegen fehlgeschlagen',
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
                        e.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ));
          },
        ),
      ));
      _apiResponse = ApiResponse.error(e.toString());
    }
    print(_apiResponse.message);
    notifyListeners();
    return resp;
  }
}
