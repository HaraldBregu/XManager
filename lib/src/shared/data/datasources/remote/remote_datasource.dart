import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/shared/data/models/device_model.dart';
import 'package:xmanager/src/shared/data/models/dinamo_model.dart';
import 'package:xmanager/src/shared/data/models/profile_model.dart';
import 'package:xmanager/src/shared/data/models/program_model.dart';
import 'package:xmanager/src/shared/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<void> login(String email, String password);
  Future<void> logOut();
  Future<void> register(String email, String password);
  Future<UserModel?> get currentUser;
  Future<ProfileModel> getCurrentProfile();
  Future<List<DeviceModel>> getMyDevices();
  Future<List<ProgramModel>> getPrograms();
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

  @override
  Future<List<ProgramModel>> getPrograms() async {
    final firestore = FirebaseFirestore.instance;
    final programsRef = firestore.collection('programs');
    //final query = programsRef.orderBy("id");
    //final query = programsRef.where("title", isNull: false);
    /*
    .where("data", isNotEqualTo: []);
    .where("devicePosition", isNull: false)
    .where("deviceType", isNull: false)
    .where("deviceVersion", isNull: false)
    */
    final data = await programsRef.get();

    final programs = data.docs.map((doc) {
      final map = doc.data();
      final data = ProgramModel.fromJson(map);
      return data;
    }).where((element) {
      final hasTitle = element.title.isNotEmpty;
      final hasData = element.data.isNotEmpty;
      final hasDeviceVersion = element.deviceVersion.isNotEmpty;
      return hasTitle && hasData && hasDeviceVersion;
    }).toList();

    return programs;
  }
}
