import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/views/account.dart';

void main() {

  setUp(() {

  });

  testWidgets("test title", (WidgetTester tester) async {
    tester.pumpWidget(Account());
    expect(find.text("Account"), findsOneWidget);
  });

}