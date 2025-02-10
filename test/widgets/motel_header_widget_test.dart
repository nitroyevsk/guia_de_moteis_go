import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go/models/motel_model.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/motel_header_widget.dart';

void main() {
  late MotelModel motel;
  
  setUp(() {
    motel = MotelModel(
      fantasia: "Motel teste", 
      logo: "assets/images/logo.png", 
      bairro: "bairro teste", 
      distancia: 10, 
      qtdAvaliacoes: 10, 
      media: 10, 
      suites: []);
  },);
  
  testWidgets('Deve verificar a existência de imagens, texto e icones em MotelHeaderWidget', (WidgetTester tester) async {

    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelHeaderWidget(     
            motel: motel,  
            isTestEnvironment: true,     
          ),
        ),
      ),
    );

    // Verifica se texto e imagem foram renderizados
    expect(find.text(motel.fantasia), findsOneWidget);      
    expect(find.text(motel.bairro), findsOneWidget);          
    expect(find.byType(Image), findsOneWidget);
  
  });
 
 
  testWidgets('Deve acionar o botao "favorito" em MotelHeaderWidget e ser redirecionado', (WidgetTester tester) async {

    // Constrói o widget na árvore de testes
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelHeaderWidget(     
            motel: motel,  
            isTestEnvironment: true,     
          ),
        ),
      ),
    );

    // Encontrar o InkWell
    final inkWellFinder = find.byIcon(Icons.favorite);

    // Verificar se o InkWell está presente
    expect(inkWellFinder, findsOneWidget);

    // Simular o toque no InkWell
    await tester.tap(inkWellFinder);

    // Esperar a navegação ser concluída
    await tester.pumpAndSettle();

    // Verifica se a nova página de fotos foi carregada com imagens
    expect(find.text('guia de motéis go'), findsOneWidget);
  
  });
}