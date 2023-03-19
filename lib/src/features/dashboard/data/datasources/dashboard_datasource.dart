import 'package:xmanager/src/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardDatasource {
  Future<DashboardModel> getData();
}

class DashboardDatasourceImpl implements DashboardDatasource {

  @override
  Future<DashboardModel> getData() async {

    return const DashboardModel(
        fullname: "fullname",
        role: "role",
        nationality: "nationality",
        birthdate: "birthdate",
        weight: "weight",
        height: "height",);
  }

}