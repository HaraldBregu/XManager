import 'package:dartz/dartz.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/data/datasources/local/shared_preferences_datasource.dart';
import 'package:xmanager/src/domain/entities/application_entity.dart';
import 'package:xmanager/src/domain/repository/application_repository.dart';

class AppRepositoryImpl implements ApplicationRepository {
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSourceImpl;
  final PermissionsDataSourceImpl permissionsDataSourceImpl;

  AppRepositoryImpl({
    required this.sharedPreferencesDataSourceImpl,
    required this.permissionsDataSourceImpl,
  });

  // @override
  // Future<Either<Failure, AppModel>> getApp() async {
  //   try {
  //     final app = await sharedPreferencesDataSourceImpl.getApp();
  //     return Right(app);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  @override
  Future<bool> locationPermissionGranted() async {
    return permissionsDataSourceImpl.locationPermissionGranted();
  }

  @override
  Future<bool> requestLocationPermission() async {
    final req = await permissionsDataSourceImpl.requestLocationPermission();
    return req.isGranted;
  }

  @override
  Future<bool> bluetoothPermissionGranted() async {
    return permissionsDataSourceImpl.bluetoothPermissionGranted();
  }

  @override
  Future<bool> requestBluetoothPermission() async {
    final req = await permissionsDataSourceImpl.requestBluetoothPermission();
    return req.isGranted;
  }

  @override
  Future<bool> bluetoothConnectPermissionGranted() async {
    return permissionsDataSourceImpl.bluetoothConnectPermissionGranted();
  }

  @override
  Future<bool> requestBluetoothConnectPermission() async {
    final req =
        await permissionsDataSourceImpl.requestBluetoothConnectPermission();
    return req.isGranted;
  }

  @override
  Future<bool> bluetoothScanPermissionGranted() {
    return permissionsDataSourceImpl.bluetoothScanPermissionGranted();
  }

  @override
  Future<bool> requestBluetoothScanPermission() async {
    final req =
        await permissionsDataSourceImpl.requestBluetoothScanPermission();
    return req.isGranted;
  }

  @override
  Future<Either<Failure, ApplicationEntity>> getApp() {
    // TODO: implement getApp
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, bool>> saveFullName(String fullname) async {
  //   try {
  //     final success =
  //       await _sharedPreferencesDataSource.setUserFullName(fullname);
  //     return Right(success);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserEntity>> getUser() async {
  //   try {
  //     return Right(await _sharedPreferencesDataSource.getUser());
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> userAuthorised() async {
  //   try {
  //     final user = await _sharedPreferencesDataSource.getUser();
  //     return Right(user.fullname.isNotEmpty);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> exitUser() async {
  //   try {
  //     final user = await _sharedPreferencesDataSource.clearUserFullName();
  //     return Right(user);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }
}
