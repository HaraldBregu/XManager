import 'package:xmanager/src/core/domain/entities/user_entity.dart';

abstract class UserEvent {
  const UserEvent();
}

class InitialUserEvent extends UserEvent {
  const InitialUserEvent();
}

class EnterUserEvent extends UserEvent {
  final String fullName;
  const EnterUserEvent(this.fullName);
}

class ExitUserEvent extends UserEvent {
  const ExitUserEvent();
}
