import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class BleDataSource {
  Future<void> startScan(int seconds, List<String>? services);
  Future<void> stopScan();
  Stream<List<ScanResult>> get scanResults;
  Stream<bool> get isScanning;
  Future<bool> get isSupported;
  Future<bool> get isOn;
  Stream<BluetoothAdapterState> get adapterState;
  Future<BluetoothAdapterState> get adapterStateNow;
  Future<void> turnOn();
  Future<void> connect(String uuid);
  Future<void> connectAndDiscoverServices(String uuid);
  Future<void> disconnect(String uuid);
  Future<void> discoverServices(String uuid);
  Stream<bool> connected(String uuid);
  Future<bool> isConnected(String uuid);

  Future<List<int>> readCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  );

  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    bool withoutResponse,
  );

  Future<void> setNotifications(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    bool enable,
  );

  Stream<List<int>> lastValueStream(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  );
}

class BleDataSourceImpl implements BleDataSource {
  BleDataSourceImpl();

  @override
  Future<void> startScan(int seconds, List<String>? services) async {
    if (FlutterBluePlus.isScanningNow) return;

    //final guidServices = services!.map((e) => Guid(e)).toList();

    await FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
      //scanMode: ScanMode.lowLatency,
      //withServices: [Guid("00001600-1212-efde-1523-785feabcd121")],
      //withServices: guidServices,
      //macAddresses: const [],
      //allowDuplicates: false,
      //androidUsesFineLocation: false,
    );
  }

  @override
  Future stopScan() async {
    if (!FlutterBluePlus.isScanningNow) return;
    await FlutterBluePlus.stopScan();
  }

  @override
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  @override
  Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  @override
  Future<bool> get isSupported => FlutterBluePlus.isSupported;

  @override
  Future<bool> get isOn async {
    return FlutterBluePlus.adapterStateNow == BluetoothAdapterState.on;
  }

  @override
  Stream<BluetoothAdapterState> get adapterState =>
      FlutterBluePlus.adapterState;

  @override
  Future<BluetoothAdapterState> get adapterStateNow async =>
      FlutterBluePlus.adapterStateNow;

  @override
  Future<void> turnOn() async {
    return await FlutterBluePlus.turnOn();
  }

  @override
  Future<void> connect(String uuid) {
    return BluetoothDevice.fromId(uuid).connect();
  }

  @override
  Future<void> connectAndDiscoverServices(String uuid) async {
    final device = BluetoothDevice.fromId(uuid);
    //await device.clearGattCache();
    //device.connect(mtu: 512);
    await device.connect();
    await device.discoverServices();
  }

  @override
  Future<void> discoverServices(String uuid) =>
      BluetoothDevice.fromId(uuid).discoverServices();

  @override
  Future<void> disconnect(String uuid) async {
    final device = BluetoothDevice.fromId(uuid);
    if (device.isConnected) await device.disconnect();
  }

  @override
  Stream<bool> connected(String uuid) => BluetoothDevice.fromId(uuid)
      .connectionState
      .map((event) => event == BluetoothConnectionState.connected);

  @override
  Future<bool> isConnected(String uuid) async =>
      BluetoothDevice.fromId(uuid).isConnected;

  @override
  Future<List<int>> readCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) async {
    final characteristics = await getCharacteristics(
      deviceUuid,
      serviceUuid,
      characteristicsUuid,
    );

    if (characteristics == null) return [];

    return await characteristics.read();
  }

  @override
  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    bool withoutResponse,
  ) async {
    final characteristics = await getCharacteristics(
      deviceUuid,
      serviceUuid,
      characteristicsUuid,
    );

    if (characteristics == null) return;

    return await characteristics.write(value, withoutResponse: withoutResponse);
  }

  @override
  Stream<List<int>> lastValueStream(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) {
    final device = BluetoothDevice.fromId(deviceUuid);

    if (!device.isConnected || device.servicesList.isEmpty) {
      return StreamController<List<int>>().stream;
    }

    final characteristics = device.servicesList
        .firstWhere(
          (e) => e.serviceUuid == Guid(serviceUuid),
        )
        .characteristics
        .firstWhere(
          (e) => e.characteristicUuid == Guid(characteristicsUuid),
        );

    return characteristics.lastValueStream;
  }

  @override
  Future<void> setNotifications(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    bool enable,
  ) async {
    final characteristics = await getCharacteristics(
      deviceUuid,
      serviceUuid,
      characteristicsUuid,
    );

    if (characteristics == null) return;

    if (characteristics.isNotifying != enable) {
      await characteristics.setNotifyValue(enable);
    }
  }

  // UTILS

  Future<BluetoothCharacteristic?> getCharacteristics(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) async {
    final device = BluetoothDevice.fromId(deviceUuid);

    if (!device.isConnected || device.servicesList.isEmpty) {
      return null;
    }

    final services = device.servicesList;
    final service = services.firstWhere(
      (e) => e.serviceUuid == Guid(serviceUuid),
    );
    final characteristics = service.characteristics;
    final characteristic = characteristics.firstWhere(
      (e) => e.characteristicUuid == Guid(characteristicsUuid),
    );

    return characteristic;
  }
}
