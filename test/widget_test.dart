// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:final_eight_app/main.dart' as app;

void main() {
  testWidgets('login Screen widget test ', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    //1 - execute app.main()
      app.main();

//2- waite untel the app settled
      await tester.pumpAndSettle();
   const email = Key('email');
   const password = Key('password');

    expect(find.byKey(email), findsOneWidget);
    expect(find.byKey(password), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
