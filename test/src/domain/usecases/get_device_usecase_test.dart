import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/device_entity.dart';
import 'package:xmanager/src/domain/repository/device_repository.dart';
import 'package:xmanager/src/domain/usecases/get_device_usecase.dart';

import 'get_device_usecase_test.mocks.dart';

@GenerateMocks([DeviceRepository])
void main() {
  late MockDeviceRepository mockDeviceRepository;
  late GetDeviceUsecase usecase;

  setUp(() {
    mockDeviceRepository = MockDeviceRepository();
    usecase = GetDeviceUsecase(mockDeviceRepository);
  });

  test('should get device from repository', () async {
    const tTypeDevice = "DINAMOnn";
    const tDevice = DeviceEntity(
      name: "Name Device",
      version: "1.0.0",
      type: DeviceType.dinamo,
    );

    when(mockDeviceRepository.getDeviceByType(any))
        .thenAnswer((_) async => const Right(tDevice));

    final result = await usecase(tTypeDevice);

    expect(result, const Right(tDevice));
    verify(mockDeviceRepository.getDeviceByType(tTypeDevice));
    verifyNoMoreInteractions(mockDeviceRepository);
  });
}
