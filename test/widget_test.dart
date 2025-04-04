import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holamundo/main.dart';

void main() {
  testWidgets('La app muestra la pantalla de listado', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Esperar a que se cargue el FutureBuilder
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Listado de Recetas'), findsOneWidget);
  });
}
