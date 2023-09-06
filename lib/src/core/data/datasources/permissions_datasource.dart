import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsDataSource {
  Future<List<Permission>> permissionList();
  Future<PermissionStatus> permissionStatus(Permission permission);
  Future<PermissionStatus> requestPermission(Permission permission);

  //permission.isDenied
  //permission.isGranted
  //permission.isLimited
  //permission.isPermanentlyDenied
  //permission.isRestricted

}

class PermissionsDataSourceImpl implements PermissionsDataSource {
  PermissionsDataSourceImpl();

  @override
  Future<List<Permission>> permissionList() async {
    return Permission.values;
  }

  @override
  Future<PermissionStatus> permissionStatus(Permission permission) {
    return permission.status;
  }
  
  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }

}
