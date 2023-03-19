import 'package:equatable/equatable.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';

class DashboardEntity extends Equatable {
  final String title;
  //final List<DashboardPlayerEntity> playersEntity;

  const DashboardEntity({
    required this.title,
    //required this.playersEntity,
  });

  @override
  List<Object?> get props => [
    title,
    //playersEntity,
  ];

}
