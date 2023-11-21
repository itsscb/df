final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final nameRegExp = RegExp(r"^[a-zA-ZäöüÄÖÜß]+(?:[-\s][a-zA-ZäöüÄÖÜß]+)?$");
final phoneRegExp = RegExp(r"^(?:\+49|0)[1-9][0-9\s\-\/]*$");
final streetRegExp = RegExp(r"^[a-zA-ZäöüÄÖÜß\s\-\d]+$");
final houseNumberRegExp = RegExp(r"^[0-9]+$");
final zipRegExp = RegExp(r"^\d{5}$");
final cityRegExp = RegExp(r"^[a-zA-ZäöüÄÖÜß\s\-\.,]+$");
final passwordRegExp = RegExp(
    r'^(?=.*[a-zäöü])(?=.*[A-ZÄÖÜ])(?=.*\d)(?=.*[@$!%*?&])[A-Za-zäöüÄÖÜ\d@$!%*?&]{8,}$');

extension valString on String {
  bool get isValidEmail {
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    return nameRegExp.hasMatch(this);
  }

  bool get isValidStreetAddress {
    return streetRegExp.hasMatch(this);
  }

  bool get isValidHouseNumber {
    return houseNumberRegExp.hasMatch(this);
  }

  bool get isValidZip {
    return zipRegExp.hasMatch(this);
  }

  bool get isValidCity {
    return cityRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotEmpty {
    return this != trim();
  }

  bool get isValidPhone {
    return phoneRegExp.hasMatch(this);
  }

  String get titleCase {
    return split(' ')
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(' ');
  }
}
