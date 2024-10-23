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

    final programsRef = firestore
        .collection('programs')
        .where("user_id", isNull: false)
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser?.uid);

    final data = await programsRef.get();

    final programs = data.docs.map((doc) {
      final map = doc.data();
      final data = ProgramModel.fromJson(map);
      return data;
    }).where((element) {
      final hasTitle = element.title.isNotEmpty;
      final hasData = element.data.isNotEmpty;
      final hasType = element.deviceType != DeviceType.none;
      final hasPosition = element.devicePosition != DevicePosition.none;
      final hasDeviceVersion = element.deviceVersion.isNotEmpty;
      return hasTitle && hasData && hasType && hasPosition && hasDeviceVersion;
    }).toList();

    return programs;
  }

  // TEST
  Future<void> createProgram(ProgramModel program) async {
    final firestore = FirebaseFirestore.instance;

    // personal: 32td54OR8efto9xixr6pbLJVdu12
    // Spartan: DlOPAJLSCuVC2jwsqYQm1M9j3ZI2
    final programsRef = firestore.collection('programs');
    final programsprivate = programsRef.doc();
    /*
                      const newProgram = ProgramEntity(
                        title: "User A",
                        data: [],
                        deviceType: DeviceType.none,
                        devicePosition: DevicePosition.none,
                        deviceVersion: '',
                      );*/
    programsprivate.set(program.toJson());
    /*
                      programsprivate.set({
                        "user_id": FirebaseAuth.instance.currentUser?.uid,
                        "title": "Tiro con l'esterno destro",
                        "data": [23, 45, 98],
                        "device_type": 0,
                        "device_position": 1,
                        "device_version": "1.0.0",
                      });*/

    //final query = programsRef.orderBy("id");
  }
}
