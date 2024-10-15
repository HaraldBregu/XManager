import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/shared/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/shared/data/repository/ble_repository_impl.dart';

import 'ble_repository_impl_test.mocks.dart';

@GenerateMocks([BleDataSource])
@GenerateMocks([PermissionsDataSource])
void main() {
  late BleRepositoryImpl bleRepositoryImpl;
  late MockBleDataSource mockBleDataSource;
  late MockPermissionsDataSource mockPermissionsDataSource;

  setUp(() {
    mockBleDataSource = MockBleDataSource();
    mockPermissionsDataSource = MockPermissionsDataSource();
    bleRepositoryImpl = BleRepositoryImpl(
      mockBleDataSource,
      mockPermissionsDataSource,
    );
  });

  void runTestsWithRequiredPermissionsGranted(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockPermissionsDataSource.bluetoothPermissionGranted())
            .thenAnswer((_) async => true);
        when(mockPermissionsDataSource.bluetoothScanPermissionGranted())
            .thenAnswer((_) async => true);
        when(mockPermissionsDataSource.bluetoothConnectPermissionGranted())
            .thenAnswer((_) async => true);
      });

      body();
    });
  }

  runTestsWithRequiredPermissionsGranted(() {
    group('test ble repository', () {
      const tUuid = "45:46:56:67";
      test(
        'should test connection and return true',
        () async {
          when(mockBleDataSource.isConnected(tUuid))
              .thenAnswer((_) async => true);

          final result = await bleRepositoryImpl.isConnected(tUuid);

          verify(mockBleDataSource.isConnected(tUuid));

          expect(result, equals(true));
        },
      );
      test(
        'should test connection and return false',
        () async {
          when(mockBleDataSource.isConnected(tUuid))
              .thenAnswer((_) async => false);

          final result = await bleRepositoryImpl.isConnected(tUuid);

          verify(mockBleDataSource.isConnected(tUuid));

          expect(result, equals(false));
        },
      );
    });
  });
}
