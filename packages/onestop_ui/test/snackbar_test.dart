import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onestop_ui/index.dart';

void main() {
  group('OSnackbar Widget Tests', () {
    testWidgets('OSnackbar positive type renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(
              type: SnackbarType.positive,
              message: 'Success message',
            ),
          ),
        ),
      );

      expect(find.text('Success message'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('OSnackbar negative type renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(
              type: SnackbarType.negative,
              message: 'Error message',
            ),
          ),
        ),
      );

      expect(find.text('Error message'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('OSnackbar warning type renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(
              type: SnackbarType.warning,
              message: 'Warning message',
            ),
          ),
        ),
      );

      expect(find.text('Warning message'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('OSnackbar accent type renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(type: SnackbarType.accent, message: 'Info message'),
          ),
        ),
      );

      expect(find.text('Info message'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('OSnackbar with custom icon renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(
              type: SnackbarType.positive,
              message: 'Custom icon message',
              icon: Icons.thumb_up,
            ),
          ),
        ),
      );

      expect(find.text('Custom icon message'), findsOneWidget);
      expect(find.byIcon(Icons.thumb_up), findsOneWidget);
    });

    testWidgets('OSnackbar has correct background color for positive type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(type: SnackbarType.positive, message: 'Test'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, OColor.green100);
    });

    testWidgets('OSnackbar has correct text color for positive type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OSnackbar(type: SnackbarType.positive, message: 'Test'),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Test'));
      expect(text.style?.color, OColor.green700);
    });
  });
}
