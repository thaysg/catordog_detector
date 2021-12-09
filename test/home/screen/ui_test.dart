import 'package:catordog_detector/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.byKey(Key('CatDogDetector')), findsOneWidget);
    expect(find.byKey(Key('CatImage')), findsOneWidget);
    expect(find.byKey(Key('DogImage')), findsOneWidget);
    expect(find.byKey(Key('Gallery')), findsOneWidget);
    expect(find.byKey(Key('Camera')), findsOneWidget);
  });

  testWidgets('test tap buttonCamera', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    final _button = find.byKey(Key('Camera'));
    await tester.tap(_button);
    await tester.pumpAndSettle();
  });

  testWidgets('test tap buttonGallery', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    final _button = find.byKey(Key('Gallery'));
    await tester.tap(_button);
    await tester.pumpAndSettle();
  });
}
