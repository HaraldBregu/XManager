// Mocks generated by Mockito 5.4.4 from annotations
// in xmanager/test/src/domain/usecases/password_strength_perc_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i2;

import 'package:mockito/mockito.dart' as _i1;
import 'package:xmanager/src/domain/repository/utils_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeColor_0 extends _i1.SmartFake implements _i2.Color {
  _FakeColor_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UtilsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUtilsRepository extends _i1.Mock implements _i3.UtilsRepository {
  MockUtilsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> validEmail(String? email) => (super.noSuchMethod(
        Invocation.method(
          #validEmail,
          [email],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i2.Color> passwordStrengthColor(String? password) =>
      (super.noSuchMethod(
        Invocation.method(
          #passwordStrengthColor,
          [password],
        ),
        returnValue: _i4.Future<_i2.Color>.value(_FakeColor_0(
          this,
          Invocation.method(
            #passwordStrengthColor,
            [password],
          ),
        )),
      ) as _i4.Future<_i2.Color>);

  @override
  _i4.Future<double> passwordStrengthPerc(String? password) =>
      (super.noSuchMethod(
        Invocation.method(
          #passwordStrengthPerc,
          [password],
        ),
        returnValue: _i4.Future<double>.value(0.0),
      ) as _i4.Future<double>);
}