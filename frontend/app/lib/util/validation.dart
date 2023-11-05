final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final nameRegExp =
    RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
final passwordRegExp = RegExp(r'^.+$');

extension valString on String {
  bool get isValidEmail {
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    return nameRegExp.hasMatch(this);
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
}
