enum LoginErrorType {
  invalidCredentials,
  invalidEmail,
  emailNotConfirmed,
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
    case 'invalid_credentials':
      return LoginErrorType.invalidEmail;
    case 'email_not_confirmed':
      return LoginErrorType.invalidEmail;

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
  dinamo;

  String get value {
    switch (this) {
      case DeviceType.dinamo:
        return 'DINAMO';
    }
  }

  String get description {
    switch (this) {
      case DeviceType.dinamo:
        return 'Dinamo';
    }
  }

  static DeviceType fromString(String value) {
    switch (value) {
      case 'DINAMO':
        return DeviceType.dinamo;
      default:
        throw ArgumentError('Invalid device type: $value');
    }
  }
}

enum DeviceLocation {
  leftFoot,
  rightFoot;

  String get value {
    switch (this) {
      case DeviceLocation.leftFoot:
        return 'LEFT_FOOT';
      case DeviceLocation.rightFoot:
        return 'RIGHT_FOOT';
    }
  }

  String get description {
    switch (this) {
      case DeviceLocation.leftFoot:
        return 'Left foot';
      case DeviceLocation.rightFoot:
        return 'Right foot';
    }
  }

  static DeviceLocation fromString(String value) {
    switch (value) {
      case 'LEFT_FOOT':
        return DeviceLocation.leftFoot;
      case 'RIGHT_FOOT':
        return DeviceLocation.rightFoot;
      default:
        throw ArgumentError('Invalid device location: $value');
    }
  }
}

enum DeviceFeature {
  demo;

  String get value {
    switch (this) {
      case DeviceFeature.demo:
        return 'DEMO';
    }
  }

  static DeviceFeature fromString(String value) {
    switch (value) {
      case 'DEMO':
        return DeviceFeature.demo;
      default:
        throw ArgumentError('Invalid device location: $value');
    }
  }
}
