import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/user_entity.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/domain/usecases/get_current_user_usecase.dart';

import 'get_current_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late GetCurrentUserUseCase usecase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetCurrentUserUseCase(mockUserRepository);
  });

  test('should get currentUser from repository when logged in', () async {
    const tUser = UserEntity(
      email: 'test@mail.com',
    );

    when(mockUserRepository.currentUser)
        .thenAnswer((_) async => const Right(tUser));

    final result = await usecase(NoParams());

    expect(result, const Right(tUser));
    verify(mockUserRepository.currentUser);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should get exception from repository when not logged in', () async {
    when(mockUserRepository.currentUser)
        .thenAnswer((_) async => Left(NoCurrentUser()));

    final result = await usecase(NoParams());

    expect(result, Left(NoCurrentUser()));
    verify(mockUserRepository.currentUser);
    verifyNoMoreInteractions(mockUserRepository);
  });
}
