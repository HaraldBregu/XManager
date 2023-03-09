import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/services/app_state_notifier.dart';

void main() {
  late AppStateNotifier sut;
  
  setUp(() {
    sut = AppStateNotifier();
  });

  test("initial theme mode value is correct", () {
    expect(sut.themeMode, ThemeMode.system);
  });

}