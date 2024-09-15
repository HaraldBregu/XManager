enum LoginErrorType {
  invalidEmail,
  userNotfound,
  wrongPassword,
  userDisabled,
  invalidCredential,
  accountExistsWithDifferentCredential,
  operationNotAllowed,
  userNotFound,
  invalidVerificationCode,
  invalidVerificationId,
  toManyRequests,
}

// Firebase errors
// https://stackoverflow.com/questions/67617502/what-are-the-error-codes-for-flutter-firebase-auth-exception

LoginErrorType parseLoginErrorCode(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return LoginErrorType.invalidEmail;
    case 'user-not-found':
      return LoginErrorType.userNotfound;
    case 'wrong-password':
      return LoginErrorType.wrongPassword;
    case 'user-disabled':
      return LoginErrorType.userDisabled;
    case 'invalid-credential':
      return LoginErrorType.invalidCredential;
    case 'account-exists-with-different-credential':
      return LoginErrorType.accountExistsWithDifferentCredential;
    case 'operation-not-allowed':
      return LoginErrorType.operationNotAllowed;
    case 'invalid-verification-code':
      return LoginErrorType.invalidVerificationCode;
    case 'invalid-verification-id':
      return LoginErrorType.invalidVerificationId;
    case 'too-many-requests':
      return LoginErrorType.toManyRequests;
    default:
      throw ArgumentError('Invalid login error code: $errorCode');
  }
}

enum AppPermissionStatus {
  granted,
  denied,
  permanentlyDenied,
}

enum AppBluetoothAdapterState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off
}

enum DeviceType {
  none,
  dinamo,
}

enum DevicePosition {
  none,
  dinamoLeft,
  dinamoRight,
  dinamoLeftRight,
}
