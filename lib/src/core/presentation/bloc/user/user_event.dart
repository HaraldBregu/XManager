import 'package:xmanager/src/core/domain/entities/user_entity.dart';

abstract class UserEvent {
  const UserEvent();
}

class StartUserEvent extends UserEvent {
  const StartUserEvent();
}

class SaveUserEvent extends UserEvent {
  final UserEntity user;
  const SaveUserEvent(this.user);
}

class AccessUserEvent extends UserEvent {
  final String fullName;
  const AccessUserEvent(this.fullName);
}
