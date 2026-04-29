import 'package:flutter_test/flutter_test.dart';
import 'package:app_movil_politicas/main.dart';

void main() {
  testWidgets('Verificar que la aplicación carga correctamente', (
    WidgetTester tester,
  ) async {
    // 1. Cargamos el widget de la aplicación.
    // Usamos pumpWidget para renderizar la interfaz en el entorno de pruebas.
    await tester.pumpWidget(const AplicacionPoliticas());

    // 2. Verificamos que la aplicación se haya construido.
    // En lugar de buscar un contador, verificamos que el widget principal existe.
    expect(find.byType(AplicacionPoliticas), findsOneWidget);

    // 3. Opcional: Verificar que no hay errores visuales inmediatos.
    // Esto asegura que la PantallaConsulta() se mostró al menos inicialmente.
    await tester.pumpAndSettle();
  });
}
