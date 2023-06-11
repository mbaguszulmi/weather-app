import 'package:app_weather/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'mocks/setup_mocks.dart';

void main() {
  testWidgets('Test search functionality', (tester) async {
    setupMocks();

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MyApp());

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text("Weather"), findsOneWidget);
      expect(find.text("Search city"), findsOneWidget);

      var searchField = find.ancestor(
        of: find.text("Search city"),
        matching: find.byType(TextField),
      );
      await tester.enterText(searchField, "Malang");

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text("Malang, East Java, ID"), findsOneWidget);
    });

    unregisterMocks();
  });

  testWidgets('Test Details Page', (tester) async {
    setupMocks();
    
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MyApp());

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text("Malang"), findsOneWidget);
      await tester.tap(find.text("Malang"));

      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.text("21"), findsOneWidget);
      expect(find.text("5 days forecast"), findsOneWidget);
    });

    unregisterMocks();
  });
}
