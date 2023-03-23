import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_profile_model.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';

void main() {
  final profileModel = DashboardProfileModel(fullname: "fullname");

  setUp(() {

  });

  test("it should be a subclass of DashboardProfileModel", () async {
    expect(profileModel, isA<DashboardProfileEntity>());
  });
}
