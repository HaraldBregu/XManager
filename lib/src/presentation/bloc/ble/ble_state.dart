import 'package:equatable/equatable.dart';

class BleState extends Equatable {
  final List<int> data;
  final bool connected;

  const BleState({
    this.data = const [],
    this.connected = false,
  });

  BleState copyWith({
    List<int>? data,
    bool? connected,
  }) =>
      BleState(
        data: data ?? this.data,
        connected: connected ?? this.connected,
      );

  @override
  List<Object?> get props => [data, connected];
}

class BleInitial extends BleState {
  const BleInitial({super.data, super.connected = false});
}

class BleConnecting extends BleState {
  const BleConnecting({super.data, super.connected = false});
}

class BleDownloadingData extends BleState {
  const BleDownloadingData({super.data, super.connected = false});
}

class BleDownloadDataComplete extends BleState {
  const BleDownloadDataComplete({super.data, super.connected = false});
}

class BleWillWriteData extends BleState {
  const BleWillWriteData({super.data, super.connected});
}

class BleDidWriteData extends BleState {
  const BleDidWriteData({super.data, super.connected});
}

class BleWillReadData extends BleState {
  const BleWillReadData({super.data, super.connected});
}

class BleDidReadData extends BleState {
  const BleDidReadData({super.data, super.connected});
}
