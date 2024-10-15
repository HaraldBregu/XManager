import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/repository/device_repository.dart';
import 'package:xmanager/src/shared/domain/usecases/save_device_usecase.dart';

import 'save_device_usecase_test.mocks.dart';

@GenerateMocks([DeviceRepository])
void main() {
  late MockDeviceRepository mockDeviceRepository;
  late SaveDeviceUsecase usecase;

  setUp(() {
    mockDeviceRepository = MockDeviceRepository();
    usecase = SaveDeviceUsecase(mockDeviceRepository);
  });

  test('should save or create a device', () async {
    const tTypeDevice = DeviceType.dinamo;
    const tNameDevice = "Dinamo";
    const tVersionDevice = "1.0.0";

    const tDevice = DeviceEntity(
      name: "Name Device",
      version: "1.0.0",
      type: DeviceType.dinamo,
    );

    when(
      mockDeviceRepository.saveDevice(
        type: anyNamed('type'),
        name: anyNamed('name'),
        version: anyNamed('version'),
      ),
    ).thenAnswer((_) async => const Right(tDevice));

    final result = await usecase(
      const DeviceParams(
        name: tNameDevice,
        type: tTypeDevice,
        version: tVersionDevice,
      ),
    );

    expect(result, const Right(tDevice));

    verify(
      mockDeviceRepository.saveDevice(
        type: tTypeDevice,
        name: tNameDevice,
        version: tVersionDevice,
      ),
    );
    verifyNoMoreInteractions(mockDeviceRepository);
  });
}
