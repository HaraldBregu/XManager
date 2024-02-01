import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';
import 'package:xmanager/src/domain/usecases/valid_email_usecase%20copy.dart';

import 'valid_email_usecase_test.mocks.dart';

@GenerateMocks([UtilsRepository])
void main() {
  late MockUtilsRepository mockUtilsRepository;
  late ValidEmailUseCase usecase;

  setUp(() {
    mockUtilsRepository = MockUtilsRepository();
    usecase = ValidEmailUseCase(mockUtilsRepository);
  });

  test('should return true for valid email', () async {
    const tEmail = "john.doe@mail.com";

    when(mockUtilsRepository.validEmail(tEmail)).thenAnswer((_) async => true);

    final result = await usecase(tEmail);

    expect(result, true);
    verify(mockUtilsRepository.validEmail(tEmail));
    verifyNoMoreInteractions(mockUtilsRepository);
  });

  test('should return false for invalid email', () async {
    const tEmail = "john.do%&e@mail.com";

    when(mockUtilsRepository.validEmail(tEmail)).thenAnswer((_) async => false);

    final result = await usecase(tEmail);

    expect(result, false);
    verify(mockUtilsRepository.validEmail(tEmail));
    verifyNoMoreInteractions(mockUtilsRepository);
  });
}
