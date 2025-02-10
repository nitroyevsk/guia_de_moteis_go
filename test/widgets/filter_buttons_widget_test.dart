import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/filter_buttons_widget.dart';

void main() {
  testWidgets('Deve encontrar o textos e icones e botoes de filtro', (WidgetTester tester) async {
   
    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterButtonsWidget(),
        ),
      ),
    );

    // Verifica se textos e icones estão na tela
    expect(find.text('filtros'), findsOneWidget);
    expect(find.text('com desconto'), findsOneWidget);
    expect(find.byIcon(Icons.tune), findsOneWidget);
    expect(find.byType(OutlinedButton), findsWidgets);    
  });


}
