import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/models/app_model.dart';
import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final SharedPreferencesDataSourceImpl _sharedPreferencesDataSource;

  AppRepositoryImpl(this._sharedPreferencesDataSource);

  @override
  Future<DataState<AppModel>> getApp() async {
    final app = await _sharedPreferencesDataSource.getApp();
    return DataSuccess(app);
  }

  @override
  Future<DataState<bool>> saveFullName(String fullname) async {
    final success =
        await _sharedPreferencesDataSource.setUserFullName(fullname);
    return DataSuccess(success);
  }

  @override
  Future<DataState<bool>> userAuthorised() async {
    final user = await _sharedPreferencesDataSource.getUser();
    return DataSuccess(user.fullname.isNotEmpty);
  }
  
  @override
  Future<DataState<bool>> exitUser() async {
    final user = await _sharedPreferencesDataSource.clearUserFullName();
    return DataSuccess(user);
  }
  
  @override
  Future<DataState<UserEntity>> getUser() async {
    final user = await _sharedPreferencesDataSource.getUser();
    return DataSuccess(user);
  }
}