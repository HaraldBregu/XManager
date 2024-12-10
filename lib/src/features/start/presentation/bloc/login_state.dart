import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? email;
  final bool validEmail;
  final String? emailError;
  final String? password;
  final bool passwordVisible;
  //final double passwordStrengthPerc;
  //final Color passwordStrengthColor;
  final bool loginButtonEnabled;

  const LoginState({
    this.email,
    this.validEmail = false,
    this.emailError,
    this.password,
    this.passwordVisible = false,
    // this.passwordStrengthPerc = 0,
    // this.passwordStrengthColor = Colors.transparent,
    this.loginButtonEnabled = false,
  });

  LoginState copyWith({
    String? email,
    bool? validEmail,
    String? emailError,
    String? password,
    bool? passwordVisible,
    // double? passwordStrengthPerc,
    // Color? passwordStrengthColor,
    bool? loginButtonEnabled,
  }) =>
      LoginState(
        email: email ?? this.email,
        validEmail: validEmail ?? this.validEmail,
        emailError: emailError, //?? this.emailError,
        password: password ?? this.password,
        passwordVisible: passwordVisible ?? this.passwordVisible,
        //passwordStrengthPerc: passwordStrengthPerc ?? this.passwordStrengthPerc,
        //passwordStrengthColor: passwordStrengthColor ?? this.passwordStrengthColor,
        loginButtonEnabled: loginButtonEnabled ?? this.loginButtonEnabled,
      );

  @override
  List<Object?> get props => [
        email,
        validEmail,
        emailError,
        password,
        passwordVisible,
        //passwordStrengthPerc,
        //passwordStrengthColor,
        loginButtonEnabled,
      ];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial({
    super.validEmail = false,
    super.passwordVisible = false,
    super.loginButtonEnabled = false,
  });
}
