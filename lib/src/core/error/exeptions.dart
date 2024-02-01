import 'package:xmanager/src/core/enums.dart';

class NetworkConnectionExeption implements Exception {}

class LoginWithEmailException implements Exception {
  final LoginErrorType errorType;
  LoginWithEmailException(this.errorType);
}

class ServerExeption implements Exception {}

class CacheExeption implements Exception {}

class DatabaseExeption implements Exception {}
