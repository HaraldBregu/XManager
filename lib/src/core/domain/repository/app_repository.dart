import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';

abstract class AppRepository {
  Future<DataState<UserEntity>> getUser();
  Future<DataState<AppEntity>> getApp();

  Future<DataState<bool>> userAuthorised();
  Future<DataState<bool>> saveFullName(String fullname);
  Future<DataState<bool>> exitUser();
}
