import 'package:equatable/equatable.dart';

class BleState extends Equatable {
  final bool connected;

  const BleState({
    this.connected = false,
  });

  BleState copyWith({
    bool? connected,
  }) =>
      BleState(connected: connected ?? this.connected);

  @override
  List<Object?> get props => [connected];
}

class BleInitial extends BleState {
  const BleInitial({super.connected = false});
}

class BleConnecting extends BleState {
  const BleConnecting({super.connected = false});
}

class BleConnected extends BleState {
  const BleConnected({super.connected = false});
}
