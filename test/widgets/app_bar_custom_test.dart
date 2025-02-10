import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/app_bar_custom.dart';

void main() {
  testWidgets('Deve encontrar o textos e icones', (WidgetTester tester) async {
    // Definir a largura da tela (screenWidth)
    const screenWidth = 375.0;


    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: AppBarCustom(),
            leadingWidth: screenWidth,
          ),
        ),
      ),
    );

    // Verifica se textos e icones estão na tela
    expect(find.text('ir outro dia'), findsOneWidget);
    expect(find.text('ir agora'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.flash_on), findsOneWidget);
    expect(find.byIcon(Icons.event_available), findsOneWidget);       
  });

   // testa a açao de um botao,
    testWidgets('Verifica a navegação ao tocar no InkWell', (WidgetTester tester) async {
      const screenWidth = 375.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              leading: AppBarCustom(),
              leadingWidth: screenWidth,
            ),
          ),
        ),
      );
      // Encontrar o gesture detector (nesse caso, pelo texto)
      final gestureDetectorFinder = find.byIcon(Icons.menu);

      // Verificar se o InkWell está presente
      expect(gestureDetectorFinder, findsOneWidget);

      // Simular o toque no InkWell
      await tester.tap(gestureDetectorFinder);

      // Esperar a navegação ser concluída
      await tester.pumpAndSettle();

      // Verificar se a nova página foi carregada
      expect(find.text('guia de motéis go'), findsOneWidget);
    });
}
