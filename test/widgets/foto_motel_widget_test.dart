import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/foto_motel_widget.dart';

void main() {
  late SuiteModel suite;
  late double screenWidth;

  setUp(() {
    screenWidth = 375.0; 
    suite = SuiteModel(
      nome: "suite teste", 
      fotos: ["assets/images/logo.png", "assets/images/logo.png","assets/images/logo.png"], 
      periodos: [], 
      categoriaItens: [], 
      itens: []
    );
  },);

  
  testWidgets('Deve encontrar o textos e icones e imagens em FotoMotelWidget', (WidgetTester tester) async {           

    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FotoMotelWidget(suite: suite, 
          screenWidth: screenWidth, isTestEnvironment: true,),
        ),
      ),
    );

    // Verifica se texto e imagem estão na tela
    expect(find.text('suite teste'), findsOneWidget);      
    expect(find.byType(Image), findsOneWidget);
    
    // Verificar se a imagem específica foi carregada (a que usa 'Image.asset')
    expect(find.byWidgetPredicate((widget) => widget is Image && widget.image is AssetImage), findsOneWidget); 
  });

  testWidgets('Deve testar a navegação da imagem em FotoMotelWidget', (WidgetTester tester) async {
      // Constrói o widget na árvore de testes
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FotoMotelWidget(suite: suite, 
            screenWidth: screenWidth, isTestEnvironment: true,),
          ),
        ),
      );
      
      // Encontrar o InkWell
      final inkWellFinder = find.byType(Image);

      // Verificar se o InkWell está presente
      expect(inkWellFinder, findsOneWidget);

      // Simular o toque no InkWell
      await tester.tap(inkWellFinder);

      // Esperar a navegação ser concluída
      await tester.pumpAndSettle();

      // Verifica se a nova página de fotos foi carregada com imagens
      expect(find.byType(Image), findsWidgets);
  });

}