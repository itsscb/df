class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Fehler bei der Kommunikation: ');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Ungültige Anfrage; ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message])
      : super(message, 'Nicht authorisierte Anfrage; ');
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, 'Ungültige Eingabe; ');
}

class InternalException extends AppException {
  InternalException([message]) : super(message, 'Interner Fehler; ');
}
