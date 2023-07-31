import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/resources/data_state.dart';

abstract class AppRepository {
  Future<DataState<bool>> userAuthorised();
  Future<DataState<bool>> saveFullName(String fullname);
  Future<DataState<AppEntity>> getApp();
  Future<DataState<bool>> exitUser();
}
