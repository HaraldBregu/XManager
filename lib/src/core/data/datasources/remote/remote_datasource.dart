import 'package:xmanager/src/core/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<void> login(String email, String password);
  Future<bool> logOut();
  Future<void> register(String email, String password);
  Future<UserModel> get currentUser;
}