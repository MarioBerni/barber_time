// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:barber_time/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verifica que la app se inicie', (WidgetTester tester) async {
    // Construir nuestra aplicación y generar un frame.
    await tester.pumpWidget(const BarberTimeApp());

    // Verificar que el título de la aplicación esté presente.
    expect(find.text('Barber Time'), findsWidgets);

    // Verificar que el subtítulo esté presente.
    expect(find.text('Tu cita perfecta está a un click'), findsOneWidget);

    // Verificar que el botón de comenzar esté presente.
    expect(find.text('Comenzar'), findsOneWidget);
  });
}
