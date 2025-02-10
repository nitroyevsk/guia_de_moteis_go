import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/icones_motel_widget.dart';

void main() {
  late SuiteModel suite;
  late double screenWidth;
  
  setUp(() {
    suite = SuiteModel(
      nome: "Suite teste", 
      fotos: [], 
      periodos: [], 
      categoriaItens: [
        CategoriaItemModel(
          nome: "item 1", 
          icone: "assets/images/logo.png",
        ),
        CategoriaItemModel(
          nome: "item 2", 
          icone: "assets/images/logo.png",
        ),
        CategoriaItemModel(
          nome: "item 3", 
          icone: "assets/images/logo.png",
        ),
      ], 
      itens: ["item A", "item B"]
    );
     screenWidth = 300;
  },);
  

  testWidgets('Deve verificar a existencia de Icones/Imagens em IconesMotelWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconesMotelWidget(     
              suite: suite,
              screenWidth: screenWidth,
              isTestEnvironment: true,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsAtLeast(3));
  });

  testWidgets('Deve tocar no widget IconesMotelWidget e navegar a pagina ItensDetalhes', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconesMotelWidget(     
              suite: suite,
              screenWidth: screenWidth,
              isTestEnvironment: true,
            ),
          ),
        ),
      );

      // Encontrar o InkWell      
      final inkwellFinder = find.byKey(const Key('icones_motel_widget_inkwell'));

      // Verificar se o InkWell está presente
      expect(inkwellFinder, findsOneWidget);

      // Simular o toque no InkWell
      await tester.tap(inkwellFinder);

      // Esperar a navegação ser concluída
      await tester.pumpAndSettle();

      // Verifica se a nova página possui o nome do motel
      expect(find.text(suite.nome), findsOneWidget);
      
      // verifica se outras imagens tambem foram renderizadas
      expect(find.byType(Image), findsWidgets);

      // verifica se os outros itens do motel tambem foram renderizados
      expect(find.text(suite.itens.join(", ")), findsOneWidget);


    });
  
  }