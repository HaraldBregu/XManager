import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/data/models/device_model.dart';
import 'package:xmanager/src/data/models/dinamo_model.dart';
import 'package:xmanager/src/data/models/profile_model.dart';
import 'package:xmanager/src/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<void> login(String email, String password);
  Future<void> logOut();
  Future<void> register(String email, String password);
  Future<UserModel?> get currentUser;
  Future<ProfileModel> getCurrentProfile();
  Future<List<DeviceModel>> getMyDevices();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LoginWithEmailException(parseLoginErrorCode(e.code));
    }
  }

  @override
  Future<void> logOut() => FirebaseAuth.instance.signOut();
  
  @override
  Future<void> register(String email, String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel?> get currentUser async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null
        ? UserModel(email: currentUser.email ?? '')
        : null;
  }

  @override
  Future<ProfileModel> getCurrentProfile() async => const ProfileModel(
        fullname: "",
        dinamo: DinamoModel(
          leftBleMac: "",
          rightBleMac: "",
        ),
      );
      
  @override
  Future<List<DeviceModel>> getMyDevices() {
    throw UnimplementedError();
  }
}
