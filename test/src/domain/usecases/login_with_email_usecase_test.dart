import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/user_entity.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/domain/usecases/login_with_email_usecase.dart';

import 'get_current_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late LogInWithEmailUseCase usecase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = LogInWithEmailUseCase(mockUserRepository);
  });

  test('should login and return current user', () async {
    when(mockUserRepository.login("email", "password"))
        .thenAnswer((_) async => const Right(true));

    const loginParams = LoginParams(email: "email", password: "password");
    final result = await usecase(loginParams);

    expect(result, const Right(true));
    verify(mockUserRepository.login("email", "password"));
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return an error on login', () async {
    when(mockUserRepository.login("email", "password"))
        .thenAnswer((_) async => Left(LoginError()));

    const loginParams = LoginParams(email: "email", password: "password");
    final result = await usecase(loginParams);

    expect(result, Left(LoginError()));
    verify(mockUserRepository.login('email', 'password'));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
