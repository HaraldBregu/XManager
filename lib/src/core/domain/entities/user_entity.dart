import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool authenticated;
  final String fullname;
  final String firstName;
  final String lastName;

  const UserEntity({
    required this.authenticated,
    required this.fullname,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [authenticated, fullname, firstName, lastName];
}
