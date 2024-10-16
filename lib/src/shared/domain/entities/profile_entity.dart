import 'package:equatable/equatable.dart';

import 'dinamo_entity.dart';

class ProfileEntity extends Equatable {
  final String fullname;
  final DinamoEntity dinamo;

  const ProfileEntity({
    required this.fullname,
    required this.dinamo,
  });

  @override
  List<Object> get props => [
        fullname,
        dinamo,
      ];
}
