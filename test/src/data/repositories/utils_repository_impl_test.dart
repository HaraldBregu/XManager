import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/data/datasources/local/utils_datasource.dart';
import 'package:xmanager/src/data/repository/utils_repository_impl.dart';

import 'utils_repository_impl_test.mocks.dart';

@GenerateMocks([UtilsDataSource])
void main() {
  late UtilsRepositoryImpl utilsRepositoryImpl;
  late MockUtilsDataSource mockUtilsDataSource;

  setUp(() {
    mockUtilsDataSource = MockUtilsDataSource();
    utilsRepositoryImpl = UtilsRepositoryImpl(mockUtilsDataSource);
  });

  group('test email validation', () {
    const tEmail = "john.doe@mail.com";
    test(
      'should return true when passed a valid email',
      () async {
        when(mockUtilsDataSource.validEmail(tEmail))
            .thenAnswer((_) async => true);
        utilsRepositoryImpl.validEmail(tEmail);
        verify(mockUtilsDataSource.validEmail(tEmail));
      },
    );
    test(
      'should return false when passed an invalid email',
      () async {
        when(mockUtilsDataSource.validEmail(tEmail))
            .thenAnswer((_) async => false);
        utilsRepositoryImpl.validEmail(tEmail);
        verify(mockUtilsDataSource.validEmail(tEmail));
      },
    );
  });

  group('test password strength', () {
    const tPassword = "password";
    test(
      'should return a value from 0 to 100 when passed a password',
      () async {
        when(mockUtilsDataSource.passwordStrengthPerc(tPassword))
            .thenAnswer((_) async => 100.0);
        utilsRepositoryImpl.passwordStrengthPerc(tPassword);
        verify(mockUtilsDataSource.passwordStrengthPerc(tPassword));
      },
    );
  });
}
