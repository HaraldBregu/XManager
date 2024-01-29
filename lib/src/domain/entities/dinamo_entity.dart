import 'package:equatable/equatable.dart';

class DinamoEntity extends Equatable {
  final String leftBleMac;
  final String rightBleMac;

  const DinamoEntity({
    required this.leftBleMac,
    required this.rightBleMac,
  });

  @override
  List<Object> get props => [
        leftBleMac,
        rightBleMac,
      ];
}
