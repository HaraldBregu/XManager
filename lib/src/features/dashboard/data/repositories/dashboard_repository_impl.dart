import 'package:xmanager/src/features/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this.dashboardDatasource);

  final DashboardDatasource dashboardDatasource;

  @override
  DashboardEntity getDashboard() {
    return const DashboardEntity(
      title: "titolo",
    );
  }

  @override
  List<DashboardPlayerEntity> getPlayers() {
    return [
      DashboardPlayerEntity(
        id: 23,
        fullname: "Nome uno",
        birthdate: DateTime.now(),
        weight: 34,
        height: 345,
        role: "",
        nationality: "",
      ),
      DashboardPlayerEntity(
        id: 23,
        fullname: "Nome due",
        birthdate: DateTime.now(),
        weight: 34,
        height: 345,
        role: "",
        nationality: "",
      )
    ];
  }

}
