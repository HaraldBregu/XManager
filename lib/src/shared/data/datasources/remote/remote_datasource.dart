import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/shared/data/models/device_model.dart';
import 'package:xmanager/src/shared/data/models/device_program_model.dart';
import 'package:xmanager/src/shared/data/models/dinamo_model.dart';
import 'package:xmanager/src/shared/data/models/profile_model.dart';
import 'package:xmanager/src/shared/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<void> login(String email, String password);
  Future<void> logOut();
  Future<void> register(String email, String password);
  Future<UserModel?> get currentUser;
  Future<ProfileModel> getCurrentProfile();
  Future<List<DeviceModel>> getDevices();
  Future<List<DeviceProgramModel>> getPrograms();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<void> login(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthApiException catch (e) {
      throw LoginWithEmailException(parseLoginErrorCode(e.code ?? ''));
    }
  }

  @override
  Future<void> logOut() => Supabase.instance.client.auth.signOut();

  @override
  Future<void> register(String email, String password) {
    return Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel?> get currentUser async {
    final currentUser = Supabase.instance.client.auth.currentUser;
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
  Future<List<DeviceModel>> getDevices() async {
    final data = await Supabase.instance.client
        .from('devices')
        .select('')
        .order('updated_at', ascending: false);

    final devices = data.map((doc) {
      final data = DeviceModel.fromJson(doc);
      return data;
    }).toList();

    return devices;
  }

  @override
  Future<List<DeviceProgramModel>> getPrograms() async {
    final data = await Supabase.instance.client
        .from('device_programs_versions_view')
        .select();

    return data.map((doc) => DeviceProgramModel.fromJson(doc)).toList();
  }

  // TEST
  Future<void> createProgram(DeviceProgramModel program) async {
    //final firestore = FirebaseFirestore.instance;

    // personal: 32td54OR8efto9xixr6pbLJVdu12
    // Spartan: DlOPAJLSCuVC2jwsqYQm1M9j3ZI2
    //final programsRef = firestore.collection('programs');
    //final programsprivate = programsRef.doc();
    /*
                      const newProgram = ProgramEntity(
                        title: "User A",
                        data: [],
                        deviceType: DeviceType.none,
                        devicePosition: DevicePosition.none,
                        deviceVersion: '',
                      );*/
    //programsprivate.set(program.toJson());
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
