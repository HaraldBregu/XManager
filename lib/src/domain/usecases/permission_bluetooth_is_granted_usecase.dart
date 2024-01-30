import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';

class PermissionBluetoothIsGrantedUsecase
    implements BaseUseCase<bool, NoParams> {
  final PermissionsRepository permissionsRepository;

  PermissionBluetoothIsGrantedUsecase(this.permissionsRepository);

  @override
  Future<bool> call(NoParams params) async =>
      permissionsRepository.bluetoothPermissionGranted();
}
