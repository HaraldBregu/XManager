import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';

class PermissionBluetoothRequestUsecase implements BaseUseCase<void, NoParams> {
  final PermissionsRepository permissionsRepository;

  PermissionBluetoothRequestUsecase(this.permissionsRepository);

  @override
  Future<void> call(NoParams params) async =>
      permissionsRepository.requestBluetoothPermission();
}
