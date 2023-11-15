import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/model/services/storage_service.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    // init();
  }
  ApiResponse _apiResponse = ApiResponse.initial('Keine Daten');

  final BackendService _service = BackendService();
  final StorageService _storageService = StorageService();

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

  // Future<bool> isLoggedIn(BuildContext context) async {
  //   final messenger = ScaffoldMessenger.of(context);
  //   final navigator = Navigator.of(context);
  //   bool loggedIn = false;
  //   try {
  //     loggedIn = await BackendService.isLoggedIn;
  //   } catch (err) {
  //     if (err.toString().contains('session is blocked')) {
  //       _apiResponse = ApiResponse.error('Sitzung ist abgelaufen');
  //       navigator.pushAndRemoveUntil(
  //           MaterialPageRoute(
  //               builder: (builder) => HomePage(
  //                     loggedOut: true,
  //                   )),
  //           (route) => false);
  //       messenger.showSnackBar(SnackBar(
  //         backgroundColor: CustomColors.error,
  //         content: const Text(
  //           'Sitzung ist abgelaufen',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         // action: SnackBarAction(
  //         //   label: 'Details',
  //         //   onPressed: () {
  //         //     if (context.mounted) {
  //         //       showDialog(
  //         //           context: context,
  //         //           builder: (context) => AlertDialog(
  //         //                 backgroundColor: Colors.black,
  //         //                 icon: Icon(
  //         //                   Icons.error,
  //         //                   color: CustomColors.error,
  //         //                 ),
  //         //                 content: Text(
  //         //                   err.toString(),
  //         //                   textAlign: TextAlign.center,
  //         //                 ),
  //         //               ));
  //         //     }
  //         //   },
  //         // ),
  //       ));
  //     }
  //   }
  //   return loggedIn;
  // }

  Future<Account?> get account async {
    notifyListeners();
    final acc = await _service.account;
    ApiResponse.completed(acc);
    notifyListeners();
    return acc;
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
      resp = await _service.login(email: email, password: password);
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
      resp = await _service.createAccount(email: email, password: password);
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

  Future<bool> resendVerification(
    BuildContext context,
  ) async {
    bool resp = false;
    final messenger = ScaffoldMessenger.of(context);

    // _apiResponse = ApiResponse.loading('Logge ein');
    notifyListeners();
    try {
      final accountId = await _storageService.accountId;
      resp = await _service.resendVerification(accountId: accountId);
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.success,
        content: const Text(
          'E-Mail gesendet',
          style: TextStyle(color: Colors.white),
        ),
      ));
      _apiResponse = ApiResponse.completed(resp);
    } catch (e) {
      messenger.showSnackBar(SnackBar(
        backgroundColor: CustomColors.error,
        content: const Text(
          'E-Mail wurde nicht gesendet',
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
