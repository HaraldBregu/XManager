import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/shared/data/models/device_model.dart';
import 'package:xmanager/src/shared/data/models/program_model.dart';
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
  Future<List<ProgramModel>> getPrograms();
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
        .select('location, mac_address, versions!inner(type, version, data)');

    final devices = data
        .map((element) {
          final dvs = element['versions'] as Map<String, dynamic>;
          return {
            'location': element['location'],
            'mac_address': element['mac_address'],
            'type': dvs['type'],
            'version': dvs['version'],
            'data': dvs['data'],
          };
        })
        .map((Map<String, dynamic> doc) => DeviceModel.fromJson(doc))
        .toList();

    return devices;
  }

  @override
  Future<List<ProgramModel>> getPrograms() async {

    final data = await Supabase.instance.client.from('programs').select(
          'title, duration, feature, command, versions!inner(type, version)',
        );

    return data
        .map((element) {
          final dvs = element['versions'] as Map<String, dynamic>;
          return {
            'title': element['title'],
            'duration': element['duration'],
            'feature': element['feature'],
            'command': element['command'],
            'type': dvs['type'],
            'version': dvs['version'],
          };
        })
        .map((doc) => ProgramModel.fromJson(doc))
        .toList();
  }

  // TEST
  Future<void> createProgram(ProgramModel program) async {
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
