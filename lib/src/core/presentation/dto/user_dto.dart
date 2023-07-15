import 'package:equatable/equatable.dart';

class UserDTO extends Equatable {
  final String fullname;

  const UserDTO({
    required this.fullname,
  });

  @override
  List<Object> get props => [fullname];
}
