import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('MediumButton Integration Test', () {
    testWidgets('should display text and icon, and handle tap events', (
      WidgetTester tester,
    ) async {
      // Given: A variable to track if the button was clicked.
      bool wasClicked = false;
      const buttonText = 'Test Button';

      // When: The MediumButton is rendered.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: MediumButton(
                text: buttonText,
                onClick: () {
                  wasClicked = true;
                },
              ),
            ),
          ),
        ),
      );

      // Then: The button should display the correct text and icon.
      expect(find.text(buttonText), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      // And: The onClick callback should not have been called yet.
      expect(wasClicked, isFalse);

      // When: The user taps the button.
      await tester.tap(find.byType(MediumButton));
      await tester.pump();

      // Then: The onClick callback should be triggered.
      expect(wasClicked, isTrue);
    });

    testWidgets('should change color on press and release', (
      WidgetTester tester,
    ) async {
      // Given: The MediumButton is on the screen.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: MediumButton(
                text: 'Press Me',
                onClick: () {},
              ),
            ),
          ),
        ),
      );

      // Helper function to get the button's container color.
      Color getButtonColor() {
        final container = tester.widget<Container>(
          find.byKey(MediumButton.buttonContainerKey),
        );
        final decoration = container.decoration as BoxDecoration;
        return decoration.color!;
      }

      // Then: The initial color should be the primary color.
      expect(getButtonColor(), AppColors.primary100);

      // When: The user presses down on the button.
      final gesture = await tester.press(find.byKey(MediumButton.gestureKey));
      await tester.pump();

      // Then: The button color should change to the disabled/pressed color.
      expect(getButtonColor(), AppColors.gray4);

      // When: The user releases the press.
      await gesture.up();
      await tester.pump();

      // Then: The button color should return to the primary color.
      expect(getButtonColor(), AppColors.primary100);
    });
  });
}
