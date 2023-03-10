import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xmanager/providers/app_state_notifier.dart';

void main() {
  late AppStateNotifier sut;
  
  setUp(() {
    sut = AppStateNotifier();
  });

  test("default theme mode", () {
    expect(sut.themeMode, ThemeMode.system);
  });

  group("", () {
    test("default theme mode", () {
      expect(sut.themeMode, ThemeMode.system);
    });
    test("default theme mode", () {
      when(() {});
      expect(sut.themeMode, ThemeMode.system);
      //verify(() => )
    });
  });
  
}