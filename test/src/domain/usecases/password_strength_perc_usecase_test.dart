import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/shared/domain/repository/utils_repository.dart';
import 'package:xmanager/src/shared/domain/usecases/password_strength_perc_usecase.dart';

import 'valid_email_usecase_test.mocks.dart';

@GenerateMocks([UtilsRepository])
void main() {
  late MockUtilsRepository mockUtilsRepository;
  late PasswordStrengthPercUseCase usecase;

  setUp(() {
    mockUtilsRepository = MockUtilsRepository();
    usecase = PasswordStrengthPercUseCase(mockUtilsRepository);
  });

  test('should return 100 if password is secure', () async {
    const tPassword = "o823475yhbljhb";
    const tResult = 100.0;

    when(mockUtilsRepository.passwordStrengthPerc(tPassword))
        .thenAnswer((_) async => tResult);

    final result = await usecase(tPassword);

    expect(result, tResult);
    verify(mockUtilsRepository.passwordStrengthPerc(tPassword));
    verifyNoMoreInteractions(mockUtilsRepository);
  });

  test('should return 0 if password is not secure', () async {
    const tPassword = "";
    const tResult = 0.0;

    when(mockUtilsRepository.passwordStrengthPerc(tPassword))
        .thenAnswer((_) async => tResult);

    final result = await usecase(tPassword);

    expect(result, tResult);
    verify(mockUtilsRepository.passwordStrengthPerc(tPassword));
    verifyNoMoreInteractions(mockUtilsRepository);
  });
}
