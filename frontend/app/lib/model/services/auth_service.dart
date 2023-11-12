import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateWithBiometrics() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    //check if user has enabled biometrics.
    //check
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      // ignore: use_build_context_synchronously
      // final messenger = ScaffoldMessenger.of(context);
      try {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            biometricOnly: false,
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (err) {
        print(err);
        // messenger.showSnackBar(SnackBar(
        //   backgroundColor: CustomColors.error,
        //   content: Text(
        //     'Fehler beim Einrichten der Biometrie: $err',
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // ));
      }
    }
    print(isAuthenticated);
    return isAuthenticated;
  }
}
