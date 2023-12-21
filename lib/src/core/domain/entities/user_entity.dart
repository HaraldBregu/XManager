import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  // final String fullname;
  // final String description;
  // final String firstName;
  // final String lastName;

  const UserEntity({
    required this.email,
    // required this.fullname,
    // required this.description,
    // required this.firstName,
    // required this.lastName,
  });

  @override
  List<Object> get props => [
        email,
        // fullname,
        // description,
        // firstName,
        // lastName,
      ];
}
