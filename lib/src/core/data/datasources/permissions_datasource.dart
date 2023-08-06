import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsDataSource {
  Future<List<Permission>> permissionList();
  Future<PermissionStatus> permissionStatus(Permission permission);
}

class PermissionsDataSourceImpl implements PermissionsDataSource {
  PermissionsDataSourceImpl();

  @override
  Future<List<Permission>> permissionList() {
    throw UnimplementedError();
  }

  @override
  Future<PermissionStatus> permissionStatus(Permission permission) {
    return permission.status;
  }
}
