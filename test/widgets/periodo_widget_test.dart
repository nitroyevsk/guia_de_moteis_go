import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go/models/periodo_model.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/periodo_widget.dart';

void main() {
  late double screenWidth = 300;
  late PeriodoModel periodo;

  setUp(() {
    periodo = PeriodoModel(
      timeFormatted: "3 horas", 
      value: 88.0, 
      totalValue: 88.0, 
      hasCourtesy: false
    );
  },);
  
  testWidgets('Deve verificar a existência de valores', (WidgetTester tester) async {
     // Constrói o widget na árvore de testes
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PeriodoSuiteWidget(
              periodo: periodo,
              screenWidth: screenWidth,
            ),
          ),
        ),
      );

      // Verifica se texto e icone foram renderizados
      expect(find.text(periodo.timeFormatted), findsOneWidget);      
      expect(find.text("R\$ ${periodo.value}"), findsOneWidget);          
      expect(find.byIcon(Icons.keyboard_arrow_right_outlined), findsOneWidget);
  });
  
  testWidgets('Deve navegação após toque', (WidgetTester tester) async {
    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PeriodoSuiteWidget(
            periodo: periodo,
            screenWidth: screenWidth,
          ),
        ),
      ),
    );

    // Encontrar o InkWell
    final inkWellFinder = find.byKey(const Key('periodo_widget_key'));

    // Verificar se o InkWell está presente
    expect(inkWellFinder, findsOneWidget);

    // Simular o toque no InkWell
    await tester.tap(inkWellFinder);

    // Esperar a navegação ser concluída
    await tester.pumpAndSettle();

    // Verifica se a existência do texto na tela nova
    expect(find.text('guia de motéis go'), findsOneWidget);

  });

}