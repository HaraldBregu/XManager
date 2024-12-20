// Mocks generated by Mockito 5.4.4 from annotations
// in xmanager/test/src/data/repositories/ble_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:permission_handler/permission_handler.dart' as _i7;
import 'package:xmanager/src/core/enums.dart' as _i5;
import 'package:xmanager/src/shared/data/datasources/local/ble_datasource.dart'
    as _i2;
import 'package:xmanager/src/shared/data/datasources/local/permissions_datasource.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BleDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBleDataSource extends _i1.Mock implements _i2.BleDataSource {
  MockBleDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.ScanResult>> get scanResults => (super.noSuchMethod(
        Invocation.getter(#scanResults),
        returnValue: _i3.Stream<List<_i4.ScanResult>>.empty(),
      ) as _i3.Stream<List<_i4.ScanResult>>);

  @override
  _i3.Stream<bool> get isScanning => (super.noSuchMethod(
        Invocation.getter(#isScanning),
        returnValue: _i3.Stream<bool>.empty(),
      ) as _i3.Stream<bool>);

  @override
  _i3.Future<bool> get isSupported => (super.noSuchMethod(
        Invocation.getter(#isSupported),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> get isOn => (super.noSuchMethod(
        Invocation.getter(#isOn),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Stream<_i5.AppBluetoothAdapterState> get adapterState =>
      (super.noSuchMethod(
        Invocation.getter(#adapterState),
        returnValue: _i3.Stream<_i5.AppBluetoothAdapterState>.empty(),
      ) as _i3.Stream<_i5.AppBluetoothAdapterState>);

  @override
  _i3.Future<_i4.BluetoothAdapterState> get adapterStateNow =>
      (super.noSuchMethod(
        Invocation.getter(#adapterStateNow),
        returnValue: _i3.Future<_i4.BluetoothAdapterState>.value(
            _i4.BluetoothAdapterState.unknown),
      ) as _i3.Future<_i4.BluetoothAdapterState>);

  @override
  _i3.Future<void> startScan(
    int? seconds,
    List<String>? services,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #startScan,
          [
            seconds,
            services,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> stopScan() => (super.noSuchMethod(
        Invocation.method(
          #stopScan,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> turnOn() => (super.noSuchMethod(
        Invocation.method(
          #turnOn,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> connect(String? uuid) => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [uuid],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> connectAndDiscoverServices(String? uuid) =>
      (super.noSuchMethod(
        Invocation.method(
          #connectAndDiscoverServices,
          [uuid],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> disconnect(String? uuid) => (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [uuid],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> discoverServices(String? uuid) => (super.noSuchMethod(
        Invocation.method(
          #discoverServices,
          [uuid],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Stream<bool> connected(String? uuid) => (super.noSuchMethod(
        Invocation.method(
          #connected,
          [uuid],
        ),
        returnValue: _i3.Stream<bool>.empty(),
      ) as _i3.Stream<bool>);

  @override
  _i3.Future<bool> isConnected(String? uuid) => (super.noSuchMethod(
        Invocation.method(
          #isConnected,
          [uuid],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<List<int>> readCharacteristic(
    String? deviceUuid,
    String? serviceUuid,
    String? characteristicsUuid,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #readCharacteristic,
          [
            deviceUuid,
            serviceUuid,
            characteristicsUuid,
          ],
        ),
        returnValue: _i3.Future<List<int>>.value(<int>[]),
      ) as _i3.Future<List<int>>);

  @override
  _i3.Future<void> writeCharacteristic(
    String? deviceUuid,
    String? serviceUuid,
    String? characteristicsUuid,
    List<int>? value,
    bool? withoutResponse,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeCharacteristic,
          [
            deviceUuid,
            serviceUuid,
            characteristicsUuid,
            value,
            withoutResponse,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> setNotifications(
    String? deviceUuid,
    String? serviceUuid,
    String? characteristicsUuid,
    bool? enable,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNotifications,
          [
            deviceUuid,
            serviceUuid,
            characteristicsUuid,
            enable,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Stream<List<int>> lastValueStream(
    String? deviceUuid,
    String? serviceUuid,
    String? characteristicsUuid,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #lastValueStream,
          [
            deviceUuid,
            serviceUuid,
            characteristicsUuid,
          ],
        ),
        returnValue: _i3.Stream<List<int>>.empty(),
      ) as _i3.Stream<List<int>>);
}

/// A class which mocks [PermissionsDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPermissionsDataSource extends _i1.Mock
    implements _i6.PermissionsDataSource {
  MockPermissionsDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i7.Permission>> permissionList() => (super.noSuchMethod(
        Invocation.method(
          #permissionList,
          [],
        ),
        returnValue: _i3.Future<List<_i7.Permission>>.value(<_i7.Permission>[]),
      ) as _i3.Future<List<_i7.Permission>>);

  @override
  _i3.Future<_i5.AppPermissionStatus> permissionStatus(
          _i7.Permission? permission) =>
      (super.noSuchMethod(
        Invocation.method(
          #permissionStatus,
          [permission],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> requestPermission(
          _i7.Permission? permission) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestPermission,
          [permission],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> locationPermissionsRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #locationPermissionsRequest,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> locationPermissionsStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #locationPermissionsStatus,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothPermissionsRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothPermissionsRequest,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothPermissionsStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothPermissionsStatus,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothConnectPermissionsRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothConnectPermissionsRequest,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothConnectPermissionsStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothConnectPermissionsStatus,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothScanPermissionsRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothScanPermissionsRequest,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<_i5.AppPermissionStatus> bluetoothScanPermissionsStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #bluetoothScanPermissionsStatus,
          [],
        ),
        returnValue: _i3.Future<_i5.AppPermissionStatus>.value(
            _i5.AppPermissionStatus.granted),
      ) as _i3.Future<_i5.AppPermissionStatus>);

  @override
  _i3.Future<bool> goToSettings() => (super.noSuchMethod(
        Invocation.method(
          #goToSettings,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
