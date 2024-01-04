import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/models/user_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<void> login(String email, String password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<bool> logOut() async {
    await FirebaseAuth.instance.signOut();
    return FirebaseAuth.instance.currentUser == null;
  }

  @override
  Future<void> register(String email, String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel> get currentUser async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      // if (user == null) throw Exception();
      if (user != null) {
        return UserModel(email: user.email ?? '');
      } else {
        throw Exception();
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
