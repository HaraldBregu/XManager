import 'package:xmanager/src/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.profileMode,
    required super.hasDataAnalytics,
    required super.hasPrograms,
    required super.devices,
  });
}
